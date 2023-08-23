import 'dart:convert';
import 'dart:developer';

import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medboss/common/widgets/app_loading.dart';
import 'package:medboss/features/auth/data/local/data_sources/auth_locale.dart';
import 'package:medboss/features/file/data/remote/models/file_model.dart';
import 'package:medboss/features/file/presentation/widgets/pdf_view_screen.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../core/database/daos/bot_files_dao/files_dao.dart';
import '../../../../core/database/daos/bot_files_dao/folders_dao.dart';
import '../../../../core/database/daos/purchase_dao.dart';
import '../../../../core/database/database.dart';
import '../../../../core/injections/service_locator.dart';
import '../../domain/entities/file.dart';
import '../../domain/entities/folder.dart';
import '../pages/provider/boot_files_provider.dart';
import 'beta_pdf_view_screen.dart';
import 'file_widget.dart';
import 'floder_widget.dart';

class FilesGrid extends StatefulWidget {
  final dynamic folder;

  const FilesGrid({
    Key? key,
    required this.folder,
  }) : super(key: key);

  @override
  _FilesGridState createState() => _FilesGridState();
}

class _FilesGridState extends State<FilesGrid> {
  List<dynamic> _listFiles = [];
  late int _myIndex;

  List<bool> _isPurchase = [];
  late FoldersDao _foldersDao;
  late FilesDao _filesDao;

  @override
  void initState() {
    initProvider();
    super.initState();
  }

  Future<void> initProvider() async {
    _foldersDao = context.read<FoldersDao>();
    _filesDao = context.read<FilesDao>();
    _myIndex = context.read<BotFilesProvider>().list.length;

    if (widget.folder.hasFiles) {
      int length = await _filesDao
          .getFolderFiles(widget.folder.id)
          .then((value) => value.length);
      _isPurchase = List.filled(length, false);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: !widget.folder.hasFiles
          ? _foldersDao.getSubFolder(int.parse(widget.folder.id))
          : _filesDao.getFolderFiles(widget.folder.id),
      builder: (context, snap) {
        if (snap.data == null) return const AppLoading();
        if (snap.data?.isEmpty ?? true) {
          return const Text('مجلد فارغ');
        }
        if (snap.hasData) _listFiles = snap.requireData;
        return Consumer<BotFilesProvider>(
          builder: (context, botFiles, child) {
            return ListView.builder(
                itemCount: _listFiles.length,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 30),
                itemBuilder: (context, index) {
                  final file = _listFiles[index];
                  final isFile = file is FileData;
                  return isFile
                      ? FileWidget(
                          label: file.name,
                          objectId: file.objectId,
                          isLocked: file.isActivated,
                          onTap: () {
                            if (botFiles.list.length == _myIndex) {
                              _onTapFile(context, botFiles, file, index);
                            }
                          },
                        )
                      : FolderWidget(
                          label: file.name,
                          onTap: () {
                            if (botFiles.list.length == _myIndex) {
                              _onTapFolder(botFiles, file);
                            }
                          },
                        );
                });
          },
        );
      },
    );
  }

  _onTapFolder(BotFilesProvider botFiles, dynamic file) async {
    botFiles.addItem(file);
  }

  _onTapFile(
    BuildContext context,
    BotFilesProvider botFiles,
    dynamic file,
    int fileIndex,
  ) async {
    bool isPurchase = true;
    log(file.isActivated.toString());
    if (!(file.isActivated)) {
      isPurchase = await botFiles.isPurchase(file.objectId);
    }

    if (isPurchase) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('أختر كيفية العرض'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FilledButton.tonal(
                  onPressed: () {
                    context.pop();
                    context.push(
                      PdfViewScreen.path,
                      extra: {
                        'fileName': file.name,
                        'file': file,
                      },
                    );
                  },
                  child: Text('ملف')),
              FilledButton.tonal(
                onPressed: () {
                  context.pop();
                  context.push(
                    BetaPdfViewScreen.path,
                    extra: {
                      'fileName': file.name,
                      'file': file,
                    },
                  );

                },
                child: Text('ملف مع ادوات (beta)'),
              ),
            ],
          ),
        ),
      );
    } else {
      dialogContent(
        file,
        file.objectId,
        fileIndex,
        file.name,
      );
    }
  }

  Future<void> dialogContent(
    FileData myFile,
    String objectId,
    int fileIndex,
    String name,
  ) async {
    final purchaseDao = Provider.of<PurchasesDao>(context, listen: false);
// print((await purchaseDao.getAllPurchases()).map((e) => e.objectId));
    TextEditingController code = TextEditingController();
    bool isTryForSendingCode = false;
    return showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return Center(
          child: Card(
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Padding(
                padding: EdgeInsetsConstrains.card,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const YouText.titleLarge('تفعيل كود '),
                    Space.vm,
                    AbsorbPointer(
                      absorbing: isTryForSendingCode,
                      child: TextFormField(
                        decoration:
                            InputDecoration(hintText: "أكتب الكود هنا "),
                        controller: code,
                      ),
                    ),
                    Space.vm,
                    SizedBox(
                      width: double.maxFinite,
                      child: Visibility(
                        visible: !isTryForSendingCode,
                        replacement: const Center(
                          child: AppLoading(),
                        ),
                        child: FilledButton(
                          onPressed: () async {
                            EasyLoading.show(status: 'جاري التحقق من الكود');
                            if (code.text.trim().isEmpty) {
                              EasyLoading.dismiss();
                              EasyLoading.showError('لايمكن ترك الكود فارغاً');
                            } else {
                              EasyLoading.dismiss();
                              setState(() => isTryForSendingCode = true);
                              var codes = ParseObject('Codes');

                              QueryBuilder<ParseObject> query =
                                  QueryBuilder<ParseObject>(codes)
                                    ..whereEqualTo('objectId', code.text)
                                    ..whereEqualTo('isActivated', false);

                              var apiResponse = await query.query();
                              if (apiResponse.success &&
                                  apiResponse.results != null) {
                                setState(() => isTryForSendingCode = true);
                                await purchaseDao.addPurchase(
                                  PurchaseData(
                                    objectId: code.text,
                                    fileObjectId: objectId,
                                  ),
                                );
                                final authLocale = sl<AuthLocale>();
                                final user = await authLocale.getUser();

                                codes
                                  ..objectId = code.text
                                  ..set('isActivated', true)
                                  ..set("userName", user.fullName)
                                  ..set("userEmail", user.email)
                                  ..set("userPhone", user.phoneNumber)
                                  ..set("cityName", user.city)
                                  ..set("purchaseId", myFile.objectId)
                                  ..set("fileName", myFile.name)
                                  ..set('userId', user.objectId);
                                await codes.save();
                                refreshList(fileIndex);
                                context.pop();
                                showMenu(
                                    context: context,
                                    position: RelativeRect.fill,
                                    items: [
                                      PopupMenuItem(
                                        child: Text(''),
                                      )
                                    ]);
                                // context.push(
                                //   PdfViewScreen.path,
                                //   extra: {
                                //     'fileName': myFile.name,
                                //     'file': myFile,
                                //   },
                                // );
                              } else {
                                EasyLoading.showError(
                                  "الكود غير صحيح او تم استخدامه من قبل",
                                );
                                setState(() => isTryForSendingCode = false);
                              }
                            }
                          },
                          child: const Text(
                            ' تفعيل  ',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  refreshList(int fileIndex) {
    setState(() {
      _isPurchase[fileIndex] = true;
    });
  }
}

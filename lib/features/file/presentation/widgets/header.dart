import 'dart:async';

import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medboss/features/file/presentation/widgets/path_label_widget.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../core/database/daos/bot_files_dao/files_dao.dart';
import '../../../../resources/resources.dart';
import '../pages/provider/boot_files_provider.dart';

class Header extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  Header({super.key});

  @override
  Widget build(BuildContext context) {
    _scrollToEnd();
    return Consumer2<BotFilesProvider, FilesDao>(
      builder: (context, botFiles, filesDao, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FutureBuilder<int>(
              future: filesDao.getCount(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const SizedBox();
                }
                int count = snapshot.requireData;

                return Column(
                  children: [
                    Row(
                      children: [
                        Lottie.asset(
                          JsonRes.filesTransfer,
                          width: 200,
                          height: 200,
                        ),
                        Expanded(
                          child: ListTile(
                            title: YouText.titleLarge(
                              'بوت  الملفات',
                            ),
                            subtitle: Column(
                              children: [
                                YouText.bodyMedium(
                                  'لديك $count ملفات متوفرة ',
                                ),
                                FilledButton.tonal(
                                    onPressed: () {
                                      _refresh(
                                          context.read<BotFilesProvider>());
                                    },
                                    child: Text('تحديث'))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
                return Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: Opacity(
                          opacity: 0.5,
                          child: Lottie.asset(
                            fit: BoxFit.cover,
                            JsonRes.fileDocumentAnimations,
                          )),
                    ),
                  ],
                );
              },
            ),
            Divider(
              thickness: .3,
            ),
            SizedBox(
              height: 55,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: EdgeInsets.only(
                      right: botFiles.list.length > 1 ? 8 : 0,
                      left: botFiles.list.length > 1 ? 4 : 0,
                    ),
                    // width: botFiles.list.length > 1 ? 50 : 0,
                    child: Visibility(
                      visible: botFiles.list.length > 1,
                      child: FloatingActionButton(
                        elevation: 0,
                        mini: true,
                        onPressed: () {
                          if (botFiles.list.length >= 2) {
                            botFiles.removeLast();
                          }
                        },
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                  Expanded(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(
                            horizontal: botFiles.list.length > 1 ? 10 : 0),
                        controller: _scrollController,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: botFiles.list.length + 1,
                        itemBuilder: (context, index) {
                          if (index != botFiles.list.length) {
                            return PathLabel(
                              label: botFiles.list[index].name ?? '',
                              isCurrent: index == botFiles.list.length - 1,
                              onTap: () {
                                botFiles.removeUntil(index + 1);
                              },
                            );
                          }
                          return SizedBox(
                            width: MediaQuery.of(context).size.width * 25 / 100,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: .3,
            ),
          ],
        );
      },
    );
  }

  Future<void> _refresh(provider) async {
    // await _generateCodes(800);
    await provider.getUPath(refresh: true);
  }

  _generateCodes(int n) async {
    for (int i = 0; i < n; i++) {
      var dietPlan = ParseObject('Codes');
      dietPlan.set('isActivated', false);
      final da = await dietPlan.save();
      print("$i : "+da.result['objectId']);
    }
  }

  _scrollToEnd() {
    Timer(const Duration(milliseconds: 400), () {
      try {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.linear,
        );
      } catch (_) {}
    });
  }
}

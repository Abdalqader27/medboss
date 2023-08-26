import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:design/design.dart';
import 'package:lottie/lottie.dart';
import 'package:medboss/common/widgets/app_loading.dart';
import 'package:medboss/core/ads/widgets/banner.dart';
import 'package:medboss/features/collage/presentation/pages/select_collage/select_collage_stream.dart';
import 'package:provider/provider.dart';

import '../../../../../core/ads/widgets/interstitial.dart';
import '../../../../../core/database/database.dart';
import '../../../../../core/injections/service_locator.dart';
import '../../../../../resources/resources.dart';
import '../../../../collage/presentation/widgets/not_selected_collage_widget.dart';
import '../../widgets/empty_university_folder.dart';
import '../../widgets/files_grid.dart';
import '../../widgets/header.dart';
import '../bot_files_builder.dart';
import '../provider/boot_files_provider.dart';

class BotFolderPage extends StatefulWidget {
  const BotFolderPage({Key? key}) : super(key: key);
  static const path = '/$subPath';
  static const subPath = 'bot-folder-page';
  static const name = 'bot_folder_page';

  static const ValueKey pageKey = ValueKey(name);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return NoTransitionPage<void>(
      key: state.pageKey,
      child: const BotFolderPage(),
    );
  }

  @override
  _BotFolderPageState createState() => _BotFolderPageState();
}

class _BotFolderPageState extends State<BotFolderPage> {
  @override
  Widget build(BuildContext context) {
    final db = sl<AppDatabase>();
    final stream = sl<SelectCollageStream>();

    return StreamBuilder(
        stream: stream.collageStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const AppLoading();
          }
          if (!snapshot.hasData) {
            return const NotSelectedCollageWidget();
          }
          return MultiProvider(
            providers: [
              Provider(create: (context) => db.filesDao),
              Provider(create: (context) => db.foldersDao),
              Provider(create: (context) => db.purchasesDao),
            ],
            child: ChangeNotifierProvider.value(
              value: BotFilesProvider(db),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: SafeArea(
                  child: Padding(
                    padding: EdgeInsetsConstrains.listView,
                    child: Consumer<BotFilesProvider>(
                      builder: (context, botFiles, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: RefreshIndicator(
                                onRefresh: () => _refresh(
                                    context.read<BotFilesProvider>()),
                                child: AnimatedSwitcher(
                                  duration:
                                      const Duration(milliseconds: 300),
                                  child: botFiles.loadingUFolder
                                      ? const AppLoading()
                                      : Column(
                                          children: [
                                            Visibility(
                                              visible:
                                                  botFiles.last != null,
                                              child: Header(),
                                            ),
                                            Space.vl,
                                            Expanded(
                                              flex: 2,
                                              child: AnimatedSwitcher(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                child: botFiles.last != null
                                                    ? FilesGrid(
                                                        key: Key(botFiles
                                                            .list
                                                            .last
                                                            .name),
                                                        folder: (botFiles
                                                            .last!),
                                                      )
                                                    : const EmptyUniversityFolder(),
                                              ),
                                            ),
                                          ],
                                        ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  Future<void> _refresh(provider) async {
    await provider.getUPath(refresh: true);
  }
}

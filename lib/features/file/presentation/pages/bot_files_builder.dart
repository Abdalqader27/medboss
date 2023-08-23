import 'package:flutter/material.dart';
import 'package:medboss/features/file/presentation/pages/bot_folder_page/bot_folder_page.dart';
import 'package:medboss/features/file/presentation/pages/provider/boot_files_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/ads/widgets/banner.dart';
import '../../../../core/database/database.dart';
import '../../../../core/injections/service_locator.dart';

class BotFilesBuilder extends StatelessWidget {
  const BotFilesBuilder({
    super.key,
    required this.db,
  });

  final AppDatabase db;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => db.filesDao),
        Provider(create: (context) => db.foldersDao),
        Provider(create: (context) => db.purchasesDao),
      ],
      child: ChangeNotifierProvider.value(
        value: BotFilesProvider(sl()),
        child: const BotFolderPage(),
      ),
    );
  }
}

import 'dart:io' as io;
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:medboss/core/ads/widgets/interstitial.dart';
import 'package:medboss/core/ads/widgets/rewarded.dart';
import 'package:medboss/core/database/database.dart';
import 'package:medboss/features/file/domain/entities/file.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/ads/widgets/banner.dart';

import 'package:go_router/go_router.dart';
import 'package:design/design.dart';
import '../../../../core/injections/service_locator.dart';
import '../../../../core/storage/storage_service.dart';

class PdfViewScreen extends StatefulWidget {
  static const path = '/$subPath';
  static const subPath = 'pdf-view';
  static const name = 'pdf_view_screen';

  static const ValueKey pageKey = ValueKey(name);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    final extra = state.extra as Map<String, dynamic>;

    return MaterialPage<void>(
      key: state.pageKey,
      child: PdfViewScreen(
        file: extra['file'] as FileData,
        fileName: extra['fileName'] as String,
      ),
    );
  }

  final FileData file;
  final String fileName;

  const PdfViewScreen({
    super.key,
    required this.file,
    required this.fileName,
  });

  @override
  _PdfViewScreenState createState() => _PdfViewScreenState();
}

class _PdfViewScreenState extends State<PdfViewScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    secureScreen();
  }

  Future<void> secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PDF(
              nightMode: Theme.of(context).brightness == Brightness.dark,
              swipeHorizontal: _isLandscape(),
              enableSwipe: true,
              fitEachPage: true,
              pageSnap: false,

              preventLinkNavigation: false,
              pageFling: _isLandscape(),
              defaultPage: getSavedPageNumber(),
              onPageChanged: (int? page, int? total) {
                savePageNumber(page ?? 0);
              },
              onViewCreated: (PDFViewController controller) {},
            ).cachedFromUrl(
              widget.file.myFile,
            ),
            SizedBox(
              height: kToolbarHeight,
              child: AppBar(
                elevation: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isPortrait() {
    final storage = sl<IStorageService>();
    final isPortrait = storage.getBool('isPortrait-PDF') ?? false;
    return isPortrait;
  }

  savePageNumber(int pageNumber) async {
    final storage = sl<IStorageService>();
    await storage.setInt(widget.file.objectId, pageNumber);
  }

  getSavedPageNumber()  {
    final storage = sl<IStorageService>();
    final pageNumber = storage.getInt(widget.file.objectId) ?? 0;
    return pageNumber;
  }

  bool _isLandscape() {
    return !_isPortrait();
  }
}

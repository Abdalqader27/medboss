import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:design/design.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';

import '../../../../core/database/database.dart';

class BetaPdfViewScreen extends StatefulWidget {
  const BetaPdfViewScreen({
    Key? key,
    required this.file,
    required this.fileName,
  }) : super(key: key);
  static const path = '/$subPath';
  static const subPath = 'beta-pdf-view';
  static const name = 'beta_pdf_view_screen';

  static const ValueKey pageKey = ValueKey(name);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    final extra = state.extra as Map<String, dynamic>;
    return MaterialPage<void>(
      key: state.pageKey,
      child: BetaPdfViewScreen(
        file: extra['file'] as FileData,
        fileName: extra['fileName'] as String,
      ),
    );
  }

  final FileData file;
  final String fileName;

  @override
  State<BetaPdfViewScreen> createState() => _BetaPdfViewScreenState();
}

class _BetaPdfViewScreenState extends State<BetaPdfViewScreen> {
  @override
  void initState() {
    super.initState();
    initPlatformState();

    showViewer();

  }

  // Platform messages are asynchronous, so initialize in an async method.
  Future<void> initPlatformState() async {
    String version;
    // Platform messages may fail, so use a try/catch PlatformException.
    try {
      // Initializes the PDFTron SDK, it must be called before you can use
      // any functionality.
      PdftronFlutter.initialize(
          "demo:1685682720542:7db6c99d0300000000361ad8341f0bb79db28d8d5b67657acbd31c270d");

      version = await PdftronFlutter.version;
    } on PlatformException {
      version = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, you want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  void showViewer() async {
    var config = Config();
    await PdftronFlutter.openDocument(widget.file.myFile, config: config);

    try {
      PdftronFlutter.importAnnotationCommand(
          "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n    <xfdf xmlns=\"http://ns.adobe.com/xfdf/\" xml:space=\"preserve\">\n      <add>\n        <square style=\"solid\" width=\"5\" color=\"#E44234\" opacity=\"1\" creationdate=\"D:20200619203211Z\" flags=\"print\" date=\"D:20200619203211Z\" name=\"c684da06-12d2-4ccd-9361-0a1bf2e089e3\" page=\"1\" rect=\"113.312,277.056,235.43,350.173\" title=\"\" />\n      </add>\n      <modify />\n      <delete />\n      <pdf-info import-version=\"3\" version=\"2\" xmlns=\"http://www.pdftron.com/pdfinfo\" />\n    </xfdf>");
    } on PlatformException catch (e) {
      print("Failed to importAnnotationCommand '${e.message}'.");
    }

    try {
      PdftronFlutter.importBookmarkJson('{"0":"Page 1"}');
    } on PlatformException catch (e) {
      print("Failed to importBookmarkJson '${e.message}'.");
    }

    // An event listener for when local annotation changes are committed
    // to the document. xfdfCommand is the XFDF Command of the annotation
    // that was last changed.
    var annotCancel = startExportAnnotationCommandListener((xfdfCommand) {
      // Local annotation changed.
      // Upload XFDF command to server here.
      String command = xfdfCommand;
      // Dart limits how many characters are printed onto the console.
      // The code below ensures that all of the XFDF command is printed.
      if (command.length > 1024) {
        print("flutter xfdfCommand:\n");
        int start = 0;
        int end = 1023;
        while (end < command.length) {
          print(command.substring(start, end) + "\n");
          start += 1024;
          end += 1024;
        }
        print(command.substring(start));
      } else {
        print(command);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: DocumentView(

          onCreated: _onDocumentViewCreated,
        ),
      ),
    );
  }

  void _onDocumentViewCreated(DocumentViewController controller) async {
    Config config = Config();
    config.autoSaveEnabled = true;
    config.showDocumentSavedToast = false;

    config.disabledElements = [
      Buttons.shareButton,
      Buttons.saveCopyButton,
      Buttons.printButton,
      Buttons.editPagesButton,
    ];

    var leadingNavCancel = startLeadingNavButtonPressedListener(() {
      _showMyDialog();
    });
    startAppBarButtonPressedListener((id) {
      _showMyDialog();

    });

    await controller.openDocument(widget.file.myFile, config: config);
  }

  Future<void> _showMyDialog() async {
    print('hello');
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog'),
          content: SingleChildScrollView(
            child: Text('Leading navigation button has been pressed.'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

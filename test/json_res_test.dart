import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:medboss/resources/resources.dart';

void main() {
  test('json_res assets test', () {
    expect(File(JsonRes.emptyState).existsSync(), true);
    expect(File(JsonRes.fileDocumentAnimations).existsSync(), true);
    expect(File(JsonRes.fileEditor).existsSync(), true);
    expect(File(JsonRes.fileMoving).existsSync(), true);
    expect(File(JsonRes.filesTransfer).existsSync(), true);
    expect(File(JsonRes.loginWoman).existsSync(), true);
    expect(File(JsonRes.noInternet).existsSync(), true);
    expect(File(JsonRes.secureLogin).existsSync(), true);
    expect(File(JsonRes.securityLogin).existsSync(), true);
    expect(File(JsonRes.smileLoading).existsSync(), true);
    expect(File(JsonRes.smileLoadingBlack).existsSync(), true);
    expect(File(JsonRes.student1).existsSync(), true);
    expect(File(JsonRes.studentWalkWithBook).existsSync(), true);
    expect(File(JsonRes.university).existsSync(), true);
  });
}

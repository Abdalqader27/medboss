import 'package:get_it/get_it.dart';

import 'features.dart';

final sl = GetIt.I;
bool kTestMode = false;

Future<void> inject() async {
  await commonDependencies();
  await authDependencies();
  await collageDependencies();
}

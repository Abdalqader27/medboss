import 'dart:async';

import 'package:core/core.dart';

import '../../../../common/utils/i_transformer.dart';

abstract class IFileRepository {
  FutureOr<ITransformer> getFolderById(Params params);

  FutureOr<ITransformer> getFolders(Params params);

  FutureOr<ITransformer> getFiles(Params params);
}

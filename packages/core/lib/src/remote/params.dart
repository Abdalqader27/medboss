import 'dart:async';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

abstract class IMap {
  const IMap();

  Map<String, dynamic> toMap();
}

abstract class Params implements IMap {
  final CancelToken cancelToken = CancelToken();
  FetchPolicy fetchPolicy = FetchPolicy.cacheFirst;
}

class ParamsWrapper extends Params {
  final Map<String, dynamic> params;

  ParamsWrapper(this.params);

  @override
  Map<String, dynamic> toMap() => params;
}

class IdParams extends Params {
  final String id;

  IdParams(this.id);

  @override
  Map<String, dynamic> toMap() => {'id': id};
}

class EmptyParams extends Params {
  @override
  Map<String, dynamic> toMap() => {};
}

abstract class FormDataParams extends Params {
  FutureOr<FormData> toFromData();

  FutureOr<FormData> toAsyncFormData();
}

class NoParams extends Params {
  @override
  Map<String, dynamic> toMap() => {};
}

class PagingParams extends Params {
  final int page;
  final int pageSize;

  PagingParams({
    this.page = 1,
    this.pageSize = 20,
  });

  @override
  Map<String, dynamic> toMap() => {
        'pageNumber': page,
        'pageSize': pageSize,
      };
}

class QueryParams extends Params {
  @override
  Map<String, dynamic> toMap() => {};

  String get query => 'filtering=$filtering&paging=$paging';

  Map get filtering => {
        'condition': 'and',
        'filtering': [],
        'groups': [],
      };

  Map get paging => {
        'offset': 0,
        'limit': -1,
      };
}

class FileParams extends FormDataParams {
  final String key;
  final String path;
  final String name;

  FileParams({
    required this.name,
    required this.path,
    required this.key,
  });

  @override
  FutureOr<FormData> toFromData() async {
    return FormData.fromMap(toMap());
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      key: MultipartFile.fromFileSync(
        path,
        filename: name,
        contentType: MediaType('image', 'png'),
      ),
    };
  }

  @override
  FutureOr<FormData> toAsyncFormData() async {
    return FormData.fromMap({
      key: await MultipartFile.fromFile(
        path,
        filename: name,
        contentType: MediaType('image', 'png'),
      ),
    });
  }
}

extension ParamsEx on Params {
  FormData toFormData() {
    return FormData.fromMap(toMap());
  }

  String? get id => toMap()['id'];

  T get<T>(String key) => toMap()[key];
}

enum FetchPolicy { cacheFirst, networkFirst, cacheAndNetwork }

extension FetchPolicyEx on FetchPolicy {
  bool get isCachePolicy => this == FetchPolicy.cacheFirst;

  bool get isNetworkPolicy =>
      this == FetchPolicy.networkFirst || this == FetchPolicy.cacheAndNetwork;
}

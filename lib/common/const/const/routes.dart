// ignore_for_file: non_constant_identifier_names, constant_identifier_names
part of '../const.dart';

abstract class APIRoutes {
  APIRoutes._();

  static const baseUrl = 'https://api.nytimes.com';

  static const article = _Article._();
}

class _Article {
  const _Article._();

  final articles = '/svc/mostpopular/v2/mostviewed/';
}

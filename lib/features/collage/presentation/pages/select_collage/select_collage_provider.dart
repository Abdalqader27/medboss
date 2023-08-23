import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:medboss/features/collage/data/local/data_sources/collage_locale.dart';
import 'package:medboss/features/collage/presentation/pages/select_collage/select_collage_stream.dart';

import '../../../../../core/injections/service_locator.dart';
import '../../../application/collage_facade.dart';
import '../../../domain/entities/collage.dart';

class SelectCollageProvider extends ChangeNotifier
    with ChangeNotifierDisposeMixin {
  SelectCollageProvider(this.collageFacade)
      : _pageState = const PageState.init();

  final CollageFacade collageFacade;
  final CollageLocale collageLocale = sl<CollageLocale>();

  PageState<List<Collage>> _pageState;

  PageState<List<Collage>> get pageState => _pageState;

  set pageState(PageState<List<Collage>> pageState) {
    _pageState = pageState;
    notifyListeners();
  }

  void fetchCollages([FetchPolicy? fetchPolicy]) async {
    pageState = const PageState.loading();
    final result = await collageFacade.getAllCollages(
      EmptyParams()..fetchPolicy = fetchPolicy ?? FetchPolicy.cacheFirst,
    );
    pageState = result.toPageState();
  }
}

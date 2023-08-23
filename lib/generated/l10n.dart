// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Medboss`
  String get app_name {
    return Intl.message(
      'Medboss',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `No data found`
  String get empty_page {
    return Intl.message(
      'No data found',
      name: 'empty_page',
      desc: '',
      args: [],
    );
  }

  /// `Article Details`
  String get details_title {
    return Intl.message(
      'Article Details',
      name: 'details_title',
      desc: '',
      args: [],
    );
  }

  /// `Something wrong happened, if this persists please submit a help request.`
  String get error_something_wrong {
    return Intl.message(
      'Something wrong happened, if this persists please submit a help request.',
      name: 'error_something_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Looks like your internet is unstable, and your application is facing connectivity issues.`
  String get error_internet_issue {
    return Intl.message(
      'Looks like your internet is unstable, and your application is facing connectivity issues.',
      name: 'error_internet_issue',
      desc: '',
      args: [],
    );
  }

  /// `Due to this error, we were unable to load the requested data.`
  String get error_unable_to_load {
    return Intl.message(
      'Due to this error, we were unable to load the requested data.',
      name: 'error_unable_to_load',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

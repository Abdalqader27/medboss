import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LruStorage<S, T> {
  static const String _lruCache = 'lru-cache';

  final int maximumSize;
  final SharedPreferences sharedPreferences;

  final T Function(dynamic) mapToObject;
  late final Map<S, List<T>> _map;

  LruStorage({
    required this.sharedPreferences,
    this.maximumSize = 3,
    required this.mapToObject,
  }) {
    // init map before store it from shared preferences
    _store();
  }

  void add({required T value, required S groupId}) {
    _addGroup(groupId);

    if (_containsInGroup(value: value, groupId: groupId)) {
      _removeInGroup(value: value, groupId: groupId);
    }

    _map[groupId]!.insert(0, value);

    if (_map[groupId]!.length > maximumSize) {
      _map[groupId]!.removeLast();
    }

    // save to shared preferences
    _save();
  }

  List<T> getList(S groupId) {
    return _map[groupId] ?? [];
  }

  void _addGroup(S groupId) {
    if (groupId == null) {
      throw ArgumentError.notNull('groupId');
    }
    if (!_map.containsKey(groupId)) {
      _map[groupId] = [];
      _save();
    }
  }

  _removeInGroup({required T value, required S groupId}) {
    if (_containsInGroup(value: value, groupId: groupId)) {
      _map[groupId]!.remove(value);
      _save();
    }
  }

  bool _containsInGroup({required T value, required S groupId}) {
    return _map[groupId]?.contains(value) ?? false;
  }

  void clear() {
    _map.clear();
    sharedPreferences.remove(_lruCache);
  }

  _store() {
    _map = {};
    final cache = sharedPreferences.getString(_lruCache);

    if (cache != null) {
      final map = jsonDecode(cache) as Map<String, dynamic>;
      map.forEach((key, value) {
        final list = value as List<dynamic>;
        _map[key as S] = List<T>.from(
          list.map((e) => mapToObject(e)),
        );
      });
    }
  }

  void _save() {
    sharedPreferences.setString(_lruCache, jsonEncode(_map));
  }
}

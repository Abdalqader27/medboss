import 'package:drift/drift.dart';

mixin ExList on List {
  List<Insertable> toInsertableList() {
    return map((e) => e as Insertable).toList();
  }
}

import 'package:design/design.dart';

extension SpaceEx on List<Widget> {
  List<Widget> addSpacing(Widget spacing) {
    return List.generate(
      length > 0 ? length * 2 - 1 : 0,
      (index) => (index % 2) == 0 ? elementAt(index ~/ 2) : spacing,
    );
  }
}

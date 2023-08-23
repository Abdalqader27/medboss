import 'package:flutter/material.dart';

class RowSpacingBuilder extends StatelessWidget {
  const RowSpacingBuilder({
    Key? key,
    required this.spacing,
    required this.builder,
    required this.itemsCount,
  }) : super(key: key);

  final Widget spacing;
  final int itemsCount;
  final IndexedWidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        itemsCount * 2 - 1,
        (index) => (index % 2) == 0 ? builder(context, index ~/ 2) : spacing,
      ),
    );
  }
}

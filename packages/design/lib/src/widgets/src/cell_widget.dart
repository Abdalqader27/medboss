import 'package:flutter/material.dart';

enum CellType {
  header,
  row,
}

class CellWidget extends StatelessWidget {
  const CellWidget({
    Key? key,
    required this.cell,
    this.cellType = CellType.row,
  }) : super(key: key);

  const CellWidget.header({
    Key? key,
    required this.cell,
    this.cellType = CellType.header,
  }) : super(key: key);

  final FlexCell cell;
  final CellType cellType;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
      flex: cell.flex,
      child: DefaultTextStyle(
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: cellType == CellType.header ? textTheme.bodySmall! : textTheme.bodyMedium!,
        child: cell.widget,
      ),
    );
  }
}

class FlexCell {
  FlexCell({
    required this.flex,
    required this.widget,
  });

  final int flex;
  final Widget widget;
}

import 'package:design/design.dart';
import 'package:flutter/material.dart';

class PageHeading extends StatelessWidget {
  final String title;

  const PageHeading({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsetsConstrains.listView,
      child: YouText.titleMedium(
        title,
        style: textTheme.titleLarge?.copyWith(
          color: theme.primaryColor,
          fontWeight: FontWeight.w500,
        )
      ),
    );
  }
}

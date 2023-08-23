import 'package:design/design.dart';
import 'package:flutter/material.dart';

class PathLabel extends StatelessWidget {
  final String label;
  final bool isCurrent;
  final Function() onTap;

  const PathLabel({
    Key? key,
    required this.label,
    required this.onTap,
    required this.isCurrent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Card(
        child: Padding(
          padding: EdgeInsetsConstrains.button,
          child: GestureDetector(
            onTap: onTap,
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                    color: !isCurrent ? theme.colorScheme.onSurface: theme.colorScheme.primary,
                    fontWeight: isCurrent ? FontWeight.bold : null),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

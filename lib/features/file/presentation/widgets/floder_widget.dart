import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:iconly/iconly.dart';

class FolderWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String label;

  const FolderWidget({
    Key? key,
    required this.onTap,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onPressed: onTap,
      duration: const Duration(milliseconds: 300),
      child: Card(
        child: ListTile(
          title: Row(
            children: [
              Icon(
                IconlyBroken.folder,
                color: Colors.amber.shade700,
                size: 40,
              ),
              Expanded(child: Center(child: Text(label))),
              const Icon(
                IconlyBroken.arrow_left_2,
                size: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

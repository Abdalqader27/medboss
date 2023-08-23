import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:medboss/core/database/database.dart';
import 'package:provider/provider.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/database/daos/purchase_dao.dart';
import '../../../../core/injections/service_locator.dart';

class FileWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String label;

  // final String date;
  final String objectId;
  final bool isLocked;

  const FileWidget({
    Key? key,
    required this.onTap,
    required this.label,
    // required this.date,
    required this.objectId,
    required this.isLocked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: const Duration(milliseconds: 300),
      onPressed: onTap,
      child: Card(
        child: ListTile(
          leading: FutureBuilder(
              future: sl<AppDatabase>().purchasesDao.isPurchase(objectId),
              builder: (context, snapshot) {
                if (this.isLocked) return const Icon(Iconsax.document);
                final isLocked =
                    snapshot.data == null || snapshot.data == false;
                return Icon(
                  isLocked ? Iconsax.lock : IconlyLight.document,
                );
              }),
          title: Text(label),
        ),
      ),
    );
  }

  String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    var formatter = DateFormat.yMMMd('ar_SA');
    String formatted = formatter.format(dateTime);
    return formatted;
  }
}

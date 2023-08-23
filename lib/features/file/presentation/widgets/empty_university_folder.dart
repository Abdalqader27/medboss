import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:medboss/resources/resources.dart';

class EmptyUniversityFolder extends StatelessWidget {
  const EmptyUniversityFolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width / 2,
            child: Lottie.asset(
              JsonRes.emptyState
            ),
          ),
          const YouText.titleMedium(
            'لا يوجد ملفات للكلية المختارة'),
        ],
      ),
    );
  }
}

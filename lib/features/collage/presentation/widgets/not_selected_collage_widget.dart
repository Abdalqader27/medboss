import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../common/custom_painter/custom_clipper_ar.dart';
import '../../../../resources/resources.dart';
import '../pages/select_collage/select_collage_screen.dart';

class NotSelectedCollageWidget extends StatelessWidget {
  const NotSelectedCollageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const width = 300.0;
    const height = 300.0;
    return Stack(
      children: [
        ClipPath(
            clipper: ClippingAppBarAr(),
            child: SizedBox(
              height: height,
              child: Container(
                color: theme.colorScheme.primary.withOpacity(.1),
              ),
            )),
        Center(
          child: Column(
            children: [
              Lottie.asset(
                JsonRes.student1,
                width: width,
                height: height,
              ),
              const YouText.headlineSmall(
                'مرحبا بك في تطبيق الطالب',
              ),
              Space.vm,
              const Text(
                'قم بالتسجيل في الجامعة التي تريد الالتحاق بها',
              ),
              Space.vl,
              FilledButton.tonal(
                onPressed: () async {
                  _openSelectCollageScreen(context);
                },
                child: const Text('قم باختيار الجامعة '),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _openSelectCollageScreen(BuildContext context) {
    context.push(SelectCollageScreen.path);
  }
}

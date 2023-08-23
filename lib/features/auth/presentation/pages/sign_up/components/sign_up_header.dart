import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:medboss/features/auth/presentation/pages/login_page/login_page.dart';

import '../../../../../../resources/resources.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const width = 200.0;

    return Padding(
      padding: EdgeInsetsConstrains.horizontal,
      child: Row(
        children: [
          Hero(
            tag: JsonRes.secureLogin,
            child: Lottie.asset(
              JsonRes.secureLogin,
              width: width,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                Space.vl,
                YouText.headlineSmall(
                  '  حساب جديد',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Space.vs,
                YouText.bodySmall(
                  'قم بإنشاء حساب جديد للبدء في استخدام التطبيق',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../../resources/resources.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.25,
      child: Image.asset(ImageRes.friendship),
    );
  }
}

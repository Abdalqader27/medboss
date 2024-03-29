import 'package:flutter/material.dart';
import 'package:flutter_wizard/flutter_wizard.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StepsProgress extends StatelessWidget {
  const StepsProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: context.wizardController.indexStream,
      initialData: 0,
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.hasError) {
          return const SizedBox.shrink();
        }
        final index = snapshot.data!;
        return AnimatedSmoothIndicator(
          activeIndex: index,
          count: context.wizardController.stepCount,
          onDotClicked: (index) {
            _onDotClicked(context, index);
          },
          effect: const ExpandingDotsEffect(
            spacing: 8.0,
            expansionFactor: 2,
            radius: 4.0,
            dotWidth: 40.0,
            dotHeight: 4,
            strokeWidth: 1.5,
            dotColor: Colors.grey,
          ),
        );
      },
    );
  }

  _onDotClicked(BuildContext context, int index) {
    var wizardController = context.wizardController;
    if (wizardController.index < index &&
        wizardController.getIsGoNextEnabled()) {
      wizardController.goTo(index: index);
    } else {
      wizardController.goTo(index: index);
    }
  }
}

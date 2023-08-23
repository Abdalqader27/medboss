import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wizard/flutter_wizard.dart';

import '../steps/step_two_provider.dart';

class StepOneFloatingActionButton extends StatelessWidget {
  const StepOneFloatingActionButton({
    Key? key,
    required this.onPressed,
    required this.stepIndex,
  }) : super(key: key);

  final void Function(WizardStep step) onPressed;
  final int stepIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          StreamBuilder<int>(
            stream: context.wizardController.indexStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.hasError) {
                return const SizedBox.shrink();
              }
              final index = snapshot.data!;
              if (index == stepIndex) {
                return AspectRatio(
                  aspectRatio: 1,
                  child: FloatingActionButton(
                    child: const Icon(Icons.arrow_forward),
                    onPressed: () {
                      final step =
                          context.wizardController.stepControllers[index].step;
                      onPressed(step);
                    },
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}

class StepTwoButtons extends StatelessWidget {
  const StepTwoButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: context.wizardController.indexStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.hasError) {
          return const SizedBox.shrink();
        }
        final index = snapshot.data!;
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.5, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
          child: index == 1
              ? Padding(
                padding: EdgeInsetsConstrains.listView,
                child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            context.wizardController.goBack();
                          },
                          child: Text(
                            "الرجوع",
                          ),
                        ),
                      ),
                      Space.hxl,
                      Expanded(
                        child: FilledButton(
                          onPressed: () {
                            _signUpSubmitted(context, index);
                          },
                          child: Text(
                            "التالي",
                          ),
                        ),
                      ),
                    ],
                  ),
              )
              : const SizedBox.shrink(),
        );
      },
    );
  }

  void _signUpSubmitted(BuildContext context, int index) {
    final step = context.wizardController.stepControllers[index].step;
    (step as StepTwoProvider).submitted(context);
  }
}

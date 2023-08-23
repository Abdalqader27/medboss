import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_wizard/flutter_wizard.dart';
import 'package:go_router/go_router.dart';
import 'package:medboss/core/ads/widgets/banner.dart';
import 'package:medboss/features/file/presentation/pages/bot_folder_page/bot_folder_page.dart';
import 'package:provider/provider.dart';

import '../../../../../common/utils/utils.dart';
import '../../../../../core/injections/service_locator.dart';
import 'bloc/sign_up_bloc.dart';
import 'components/expandable_wizard.dart';
import 'components/sign_up_header.dart';
import 'components/steps_controll_buttons.dart';
import 'components/steps_progress.dart';
import 'steps/steps.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const path = '/$subPath';
  static const subPath = 'sign-up-screen';
  static const name = 'sign_up_screen';

  static const ValueKey pageKey = ValueKey(name);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: BlocProvider<SignUpBloc>(
        create: (context) => SignUpBloc(sl()),
        child: const SignUpScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final signUpBloc = context.read<SignUpBloc>();
    return DefaultWizardController(
      stepControllers: [
        WizardStepController(
          step: signUpBloc.stepOneProvider,
        ),
        WizardStepController(
          step: signUpBloc.stepTowProvider,
        ),
      ],
      child: BlocListener<SignUpBloc, SignUpState>(
        listener: _listener,
        child: Scaffold(
          appBar: AppBar(),
          floatingActionButton: StepOneFloatingActionButton(
            stepIndex: 0,
            onPressed: (step) {
              (step as StepOneProvider).goNext();
            },
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Builder(
                  builder: (context) => SingleChildScrollView(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsetsConstrains.horizontal,
                          child: SignUpHeader(),
                        ),
                        ExpandableWizard(
                          padding: EdgeInsetsConstrains.horizontal,
                          stepBuilder: (BuildContext context, WizardStep step) {
                            if (step is StepOneProvider) {
                              return StepOne(step: step);
                            }
                            if (step is StepTwoProvider) {
                              return StepTwo(step: step);
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                        Space.vl,
                        const Center(child: StepsProgress()),
                        Space.vxl,
                        const Padding(
                          padding: EdgeInsetsConstrains.horizontal,
                          child: StepTwoButtons(),
                        ),
                        Space.vm,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _listener(BuildContext context, SignUpState state) {
    if (state is SignUpFailure) {
      final message = state.message;
      dismissAllAndShowError(context, message);
    } else if (state is SignUpLoading) {
      showLoadingOverLay(message: 'Signing up');
    } else if (state is SignUpSuccess) {
      EasyLoading.dismiss();
      context.go(BotFolderPage.path);
    }
  }
}

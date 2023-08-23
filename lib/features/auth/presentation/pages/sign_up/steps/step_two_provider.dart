import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wizard/flutter_wizard.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../bloc/sign_up_bloc.dart';

class StepTwoProvider with WizardStep, DisposableMixin {
  StepTwoProvider();

  static const fullNameControllerName = 'fullName';
  static const emailControllerName = 'email';
  static const cityControllerName = 'city';

  final fullNameControl = FormControl<String>(
    validators: [Validators.required],
  );
  final emailControl = FormControl<String>(
    validators: [
      Validators.required,
      Validators.email,
    ],
  );
  final cityControl = FormControl<String>(
    validators: [Validators.required],
  );

  late final form = fb.group(
    {
      fullNameControllerName: fullNameControl,
      emailControllerName: emailControl,
      cityControllerName: cityControl,
    },
    [

    ]
  );

  void submitted(BuildContext context) {
    if (form.valid) {
      context.read<SignUpBloc>().add(SignUpSubmitted());
    } else {
      form.markAllAsTouched();
    }
  }
}

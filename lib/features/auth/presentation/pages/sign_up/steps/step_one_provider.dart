import 'package:core/core.dart';
import 'package:flutter_wizard/flutter_wizard.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:reactive_forms/reactive_forms.dart';

class StepOneProvider with WizardStep, DisposableMixin {
  static const phoneNumberControllerName = 'phoneNumber';
  static const passwordControllerName = 'password';
  static const confirmPasswordControllerName = 'confirm-password';

  final phoneNumberController = FormControl<PhoneNumber>(
    value: PhoneNumber(
      countryISOCode: 'SY',
      countryCode: '+963',
      number: '',
    ),
    validators: [
      Validators.required,
      (control) => control.value.number.length != 9
          ? {'invalidNumber': 'رقم الهاتف غير صحيح'}
          : null,
    ],
  );

  final passwordController = FormControl<String>(
    validators: [
      Validators.required,
      Validators.minLength(8),
      Validators.maxLength(16),
    ],
  );
  final confirmPasswordController = FormControl<String>(
    validators: [
      Validators.required,
    ],
  );

  late final form = fb.group(
    {
      phoneNumberControllerName: phoneNumberController,
      passwordControllerName: passwordController,
      confirmPasswordControllerName: confirmPasswordController,
    },
    [
      Validators.mustMatch(
        passwordControllerName,
        confirmPasswordControllerName,
        markAsDirty: false,
      )
    ],
  );

  void goNext() {
    if (form.valid) {
      wizardController.goNext();
    } else {
      form.markAllAsTouched();
    }
  }
}

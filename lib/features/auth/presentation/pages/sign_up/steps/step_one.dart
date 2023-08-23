import 'package:design/design.dart';
import 'package:medboss/features/auth/presentation/pages/sign_up/steps/step_one_provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../common/widgets/custom_text_field.dart';

class StepOne extends StatelessWidget {
  const StepOne({
    Key? key,
    required this.step,
  }) : super(key: key);
  final StepOneProvider step;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsConstrains.listView,
      child: ReactiveForm(
        formGroup: step.form,
        child: Column(
          children: [
            Directionality(
              textDirection: TextDirection.ltr,
              child: ReactiveIntlPhoneFormField(
                formControlName: StepOneProvider.phoneNumberControllerName,
                validationMessages: _phoneValidationMessage(),
                hintText: 'رقم الهاتف',
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.right,
              ),
            ),
            Space.vm,
            CustomReactiveTextField(
              formControlName: StepOneProvider.passwordControllerName,
              validationMessages: _passwordValidationMessage(),
              hintText: 'كلمة المرور',
              prefix: Icons.lock_open,
              obscureText: true,
            ),
            Space.vm,
            CustomReactiveTextField(
              formControlName: StepOneProvider.confirmPasswordControllerName,
              validationMessages: _confirmPasswordValidationMessage(),
              showErrors: (control) => control.invalid && control.dirty,
              hintText: 'تأكيد كلمة المرور ',
              obscureText: true,
              prefix: Icons.lock_open,
            ),
            Space.vm,
          ],
        ),
      ),
    );
  }

  _phoneValidationMessage() {
    return {
      ValidationMessage.required: (_) => '',
      'invalidNumber': (_) => '',
    };
  }

  _passwordValidationMessage() {
    return {
      ValidationMessage.required: (_) => 'يرجى إدخال كلمة المرور',
      ValidationMessage.minLength: (_) =>
          'كلمة المرور يجب ان تكون 6 احرف على الاقل',
      ValidationMessage.maxLength: (_) =>
          'كلمة المرور يجب ان تكون 16 حرف على الاكثر',
    };
  }

  _confirmPasswordValidationMessage() {
    return {
      ValidationMessage.required: (_) => 'يرجى إدخال  تاكيد كلمة المرور',
      'mustMatch': (_) => 'كلمة المرور غير متطابقة',
    };
  }
}

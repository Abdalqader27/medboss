import 'package:design/design.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:medboss/features/auth/presentation/pages/sign_up/steps/step_two_provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../common/widgets/custom_text_field.dart';

class StepTwo extends StatelessWidget {
  const StepTwo({
    Key? key,
    required this.step,
  }) : super(key: key);

  final StepTwoProvider step;

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: step.form,
      child: Padding(
        padding: EdgeInsetsConstrains.listView,
        child: Column(
          children: [
            CustomReactiveTextField(
              formControl: step.fullNameControl,
              validationMessages: _fullNameValidationMessage(),
              hintText: 'الاسم الكامل',
              prefix: IconlyLight.add_user,
            ),
            Space.vm,
            CustomReactiveTextField(
              formControl: step.emailControl,
              validationMessages: _emailValidationMessage(),
              hintText: 'الايميل',
              prefix: IconlyLight.message,
            ),
            Space.vm,
            CustomReactiveTextField<String>(
              formControl: step.cityControl,
              hintText: 'المحافظة',
              maxLines: 1,
              dense: true,
              readOnly: true,
              prefix: IconlyLight.location,
              validationMessages: _cityValidationMessage(),
              onTap: (control) async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  isDismissible: true,
                  context: context,
                  builder: (context) {
                    return LocationsBottomSheet(
                      onCitySelected: (value) {
                        control.value = value;
                        Navigator.pop(context);
                      },
                    );
                  },
                );
              },
            ),
            Space.vm,
          ],
        ),
      ),
    );
  }

  _fullNameValidationMessage() {
    return {
      ValidationMessage.required: (_) => 'يرجى إدخال الاسم الكامل',
    };
  }

  _emailValidationMessage() {
    return {
      ValidationMessage.required: (_) => 'يرجى إدخال الايميل',
      ValidationMessage.email: (_) => 'يرجى إدخال الايميل بشكل صحيح',
    };
  }

  _cityValidationMessage() {
    return {
      ValidationMessage.required: (_) => 'يرجى إدخال المحافظة',
    };
  }
}

class LocationsBottomSheet extends StatelessWidget {
  const LocationsBottomSheet({
    Key? key,
    required this.onCitySelected,
  }) : super(key: key);
  final ValueChanged<String> onCitySelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsetsConstrains.vertical,
          child: YouText.titleLarge(
            'اختر المحافظة',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.builder(
          padding: EdgeInsetsConstrains.listView,
          shrinkWrap: true,
          itemCount: _items.length,
          itemBuilder: (context, index) {
            final item = _items[index];
            return ListTile(
              title: Text(item),
              onTap: () {
                onCitySelected(item);
              },
            );
          },
        ),
      ],
    );
  }
}

final List<String> _items = <String>[
  'حلب ',
  'دمشق',
  '  تشرين',
  '  طرطوس',
  ' البعث',
  ' حماة'
];

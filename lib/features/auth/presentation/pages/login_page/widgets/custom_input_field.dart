import 'package:design/design.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomInputField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final String? suffixText;
  final FormControl formControl;
  final Map<String, ValidationMessageFunction>? validationMessages;
  final bool suffixIcon;
  final bool? isDense;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

  const CustomInputField(
      {Key? key,
      required this.formControl,
      required this.labelText,
      required this.hintText,
      this.validationMessages,
      this.suffixIcon = false,
      this.isDense,
      this.suffixText,
      this.inputFormatters,
      this.obscureText = false,
      this.keyboardType})
      : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  //
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              widget.labelText,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          ReactiveTextField(
            formControl: widget.formControl,
            obscureText: (widget.obscureText && _obscureText),
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              isDense: (widget.isDense != null) ? widget.isDense : false,
              hintText: widget.hintText,
              suffixText: widget.suffixText,
              suffixStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              suffixIcon: widget.suffixIcon
                  ? IconButton(
                      icon: Icon(
                        _obscureText
                            ? Icons.remove_red_eye
                            : Icons.visibility_off_outlined,
                        color: Colors.black54,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : null,
              suffixIconConstraints: (widget.isDense != null)
                  ? const BoxConstraints(maxHeight: 33)
                  : null,
            ),
            inputFormatters: widget.inputFormatters,
            validationMessages: widget.validationMessages,
          ),
        ],
      ),
    );
  }
}

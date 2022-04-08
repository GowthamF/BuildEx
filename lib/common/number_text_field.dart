import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final FocusNode? focusNode;
  final String? validationMessage;
  final String labelText;
  final bool isRequired;
  final bool isMultiLine;
  final Icon? suffixIcon;
  const NumberTextField({
    Key? key,
    required this.textEditingController,
    required this.labelText,
    this.validationMessage,
    this.isRequired = true,
    this.isMultiLine = false,
    this.focusNode,
    this.suffixIcon,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NumberTextFieldState();
  }
}

class _NumberTextFieldState extends State<NumberTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        focusNode: widget.focusNode,
        controller: widget.textEditingController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: widget.labelText,
          suffixIcon: widget.suffixIcon,
        ),
        validator: (value) {
          if (!widget.isRequired) {
            return null;
          }
          if (value == null || value.isEmpty) {
            return widget.validationMessage;
          }
          return null;
        },
      ),
    );
  }
}

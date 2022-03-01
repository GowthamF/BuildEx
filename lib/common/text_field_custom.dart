import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {
  final TextEditingController textEditingController;
  final FocusNode? focusNode;
  final String? validationMessage;
  final String labelText;
  final bool isRequired;
  final bool isMultiLine;
  const TextFieldCustom({
    Key? key,
    required this.textEditingController,
    required this.labelText,
    this.validationMessage,
    this.isRequired = true,
    this.isMultiLine = false,
    this.focusNode,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TextFieldCustomState();
  }
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        keyboardType: widget.isMultiLine ? TextInputType.multiline : null,
        maxLines: widget.isMultiLine ? null : 1,
        focusNode: widget.focusNode,
        controller: widget.textEditingController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: widget.labelText,
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

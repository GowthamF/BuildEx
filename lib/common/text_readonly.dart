import 'package:flutter/material.dart';

class TextReadOnly extends StatefulWidget {
  final bool isMultiLine;
  final Widget? suffixIcon;
  final String text;
  final String labelText;
  const TextReadOnly({
    Key? key,
    required this.text,
    required this.labelText,
    this.isMultiLine = false,
    this.suffixIcon,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TextReadOnlyState();
  }
}

class _TextReadOnlyState extends State<TextReadOnly> {
  bool isEditMode = false;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        focusNode: focusNode,
        initialValue: widget.text,
        readOnly: true,
        maxLines: widget.isMultiLine ? null : 1,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          labelText: widget.labelText,
        ),
      ),
    );
  }
}

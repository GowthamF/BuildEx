import 'package:flutter/material.dart';

class TextFieldEdit extends StatefulWidget {
  final TextEditingController textEditingController;
  final bool isMultiLine;
  final Widget? suffixIcon;
  final String text;
  final String labelText;
  const TextFieldEdit({
    Key? key,
    required this.textEditingController,
    required this.text,
    required this.labelText,
    this.isMultiLine = false,
    this.suffixIcon,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TextFieldEditState();
  }
}

class _TextFieldEditState extends State<TextFieldEdit> {
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
        readOnly: !isEditMode,
        maxLines: widget.isMultiLine ? null : 1,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          suffixIcon: isEditMode
              ? IconButton(
                  onPressed: () {
                    focusNode.unfocus();
                    setState(() {
                      isEditMode = false;
                    });
                  },
                  icon: const Icon(Icons.cancel_outlined),
                )
              : IconButton(
                  onPressed: () {
                    focusNode.requestFocus();
                    setState(() {
                      isEditMode = true;
                    });
                  },
                  icon: const Icon(Icons.edit),
                ),
          labelText: widget.labelText,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CheckBoxCustom extends StatefulWidget {
  final String text;
  final bool initialValue;
  final Function selectedValue;
  const CheckBoxCustom({
    required this.text,
    required this.initialValue,
    required this.selectedValue,
    Key? key,
  }) : super(key: key);

  @override
  State<CheckBoxCustom> createState() => _CheckBoxCustomState();
}

class _CheckBoxCustomState extends State<CheckBoxCustom> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    isSelected = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Checkbox(
            value: isSelected,
            onChanged: (val) {
              if (val != null) {
                widget.selectedValue(val);
                setState(() {
                  isSelected = val;
                });
              }
            }),
        Text(widget.text),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  final List<Map<dynamic, dynamic>> dropdownList;
  final Function selectedValue;
  final String hintText;
  final String disableHintText;
  const DropDown(this.dropdownList, this.selectedValue, this.hintText,
      this.disableHintText,
      {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DropDown();
  }
}

class _DropDown extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<dynamic>(
      disabledHint: Text(widget.disableHintText),
      iconSize: 30,
      isExpanded: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (selected) {
        if (selected == null) {
          return 'Please select a value';
        }

        return null;
      },
      selectedItemBuilder: (BuildContext context) {
        return widget.dropdownList.map<Widget>((dynamic e) {
          return Text(
            e.values.first,
            overflow: TextOverflow.ellipsis,
          );
        }).toList();
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        hintText: widget.hintText,
      ),
      items: widget.dropdownList.map<DropdownMenuItem<dynamic>>(
        (e) {
          return DropdownMenuItem<dynamic>(
            value: e.keys.first,
            child: Text(e.values.first),
          );
        },
      ).toList(),
      onChanged: (e) {
        widget.selectedValue(e);
      },
    );
  }
}

import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  final TextEditingController textEditingController;
  final Function selectedDate;
  final bool isEnabled;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const DatePicker(this.textEditingController, this.selectedDate,
      {Key? key, this.isEnabled = true, this.firstDate, this.lastDate})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DatePickerState();
  }
}

class _DatePickerState extends State<DatePicker> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (selectedDate == null) {
          return 'Pick a Date';
        }

        return null;
      },
      readOnly: true,
      enabled: widget.isEnabled,
      controller: widget.textEditingController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        prefixIcon: const Icon(Icons.date_range),
        labelText: 'Pick a date',
        floatingLabelBehavior: FloatingLabelBehavior.never,
        suffixIcon: selectedDate == null
            ? null
            : IconButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  widget.textEditingController.clear();
                  setState(() {
                    selectedDate = null;
                  });
                },
                icon: const Icon(Icons.clear),
              ),
      ),
      onTap: () async {
        var selected = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate:
              widget.firstDate != null ? widget.firstDate! : DateTime.now(),
          lastDate: widget.lastDate == null
              ? DateTime.now().add(const Duration(days: 10))
              : widget.lastDate!,
          initialEntryMode: DatePickerEntryMode.calendarOnly,
        );
        if (selected != null) {
          widget.textEditingController.text =
              selected.toString().substring(0, 10);
          var dateWithoutTime =
              DateTime(selected.year, selected.month, selected.day);
          widget.selectedDate(dateWithoutTime);
          setState(() {
            selectedDate = selected;
          });
        } else {
          await Future.delayed(const Duration(milliseconds: 100));
          FocusScope.of(context).unfocus();
        }
      },
    );
  }
}

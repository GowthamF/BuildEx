import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  final TextEditingController textEditingController;
  final Function selectedDate;
  final bool isEnabled;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String? labelText;

  const TimePicker(this.textEditingController, this.selectedDate,
      {Key? key,
      this.isEnabled = true,
      this.firstDate,
      this.lastDate,
      this.labelText})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TimePickerState();
  }
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (selectedTime == null) {
          return 'Pick a Time';
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
        prefixIcon: const Icon(Icons.access_time),
        labelText: widget.labelText ?? 'Pick a time',
        floatingLabelBehavior: FloatingLabelBehavior.never,
        suffixIcon: selectedTime == null
            ? null
            : IconButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  widget.textEditingController.clear();
                  setState(() {
                    selectedTime = null;
                  });
                },
                icon: const Icon(Icons.clear),
              ),
      ),
      onTap: () async {
        var selected = await showTimePicker(
          context: context,
          initialTime: const TimeOfDay(hour: 9, minute: 00),
        );
        if (selected != null) {
          var minutes = '${selected.minute}'.padLeft(2, '0');
          widget.textEditingController.text =
              '${selected.hour}:$minutes ${selected.period.name}';
          widget.selectedDate(selected);
          setState(() {
            selectedTime = selected;
          });
        } else {
          await Future.delayed(const Duration(milliseconds: 100));
          FocusScope.of(context).unfocus();
        }
      },
    );
  }
}

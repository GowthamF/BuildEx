import 'package:flutter/material.dart';

class ServiceCentersSlots extends StatefulWidget {
  const ServiceCentersSlots({Key? key}) : super(key: key);

  @override
  State<ServiceCentersSlots> createState() => _ServiceCentersSlotsState();
}

class _ServiceCentersSlotsState extends State<ServiceCentersSlots> {
  int? selectedIndex;

  DateTime startDateTime = DateTime(2022, 1, 1, 8, 00);
  List<String> appointmentSlots = [];
  @override
  void initState() {
    super.initState();
    appointmentSlots = List.generate(12, (index) {
      startDateTime = startDateTime.add(const Duration(hours: 1));
      return '${startDateTime.hour} : ${startDateTime.minute}0';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 20,
      runSpacing: 15,
      children: List.generate(
        appointmentSlots.length,
        (index) {
          return TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<OutlinedBorder>(
                selectedIndex != null && selectedIndex == index
                    ? RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(5.0),
                      )
                    // : widget.isDisabled
                    //     ? RoundedRectangleBorder(
                    //         side: BorderSide(
                    //             color: Theme.of(context).disabledColor),
                    //         borderRadius: BorderRadius.circular(5.0),
                    //       )
                    : RoundedRectangleBorder(
                        side: BorderSide(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
              ),
            ),
            onPressed: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Text(
              appointmentSlots[index],
              style: TextStyle(
                  color: selectedIndex != null && selectedIndex == index
                      ? Colors.red
                      // : widget.isDisabled
                      //     ? Theme.of(context).disabledColor
                      : Theme.of(context).primaryColor),
            ),
          );
        },
      ),
    );
  }
}

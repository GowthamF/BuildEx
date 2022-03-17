import 'package:buildex/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AddDialog extends StatefulWidget {
  const AddDialog({Key? key}) : super(key: key);

  @override
  State<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      ListTile(
        title: const Text('Register Vehicle'),
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RegisterVehicleScreen(),
            ),
          );
        },
      ),
      ListTile(
        title: const Text('Add Vehicle for Sale'),
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddVehicleSaleScreen(),
            ),
          );
        },
      )
    ]);
  }
}

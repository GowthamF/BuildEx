import 'package:buildex/cubits/cubits.dart';
import 'package:buildex/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddDialog extends StatefulWidget {
  const AddDialog({Key? key}) : super(key: key);

  @override
  State<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserRolesCubit, List<UserRoles?>>(
      builder: (context, state) {
        var buyer = state.firstWhere((element) => element == UserRoles.buyer,
            orElse: () => null);
        var vehicleOwner = state.firstWhere(
            (element) => element == UserRoles.vehicleOwner,
            orElse: () => null);
        return Wrap(children: [
          ListTile(
            title: const Text('Register Vehicle'),
            subtitle: vehicleOwner != null
                ? null
                : const Text('Vehicle Owner Role should be added',
                    style: TextStyle(color: Colors.red)),
            enabled: vehicleOwner != null,
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
            enabled: buyer != null,
            subtitle: buyer != null
                ? null
                : const Text('Buyer Role should be added',
                    style: TextStyle(color: Colors.red)),
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
      },
    );
  }
}

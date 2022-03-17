import 'package:buildex/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AddVehicleSaleScreen extends StatelessWidget {
  const AddVehicleSaleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Vehicle for Sale'),
      ),
      body: const AddVehicleSale(),
    );
  }
}

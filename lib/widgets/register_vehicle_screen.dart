import 'package:buildex/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RegisterVehicleScreen extends StatelessWidget {
  const RegisterVehicleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Vehicle'),
      ),
      body: const RegisterVehicle(),
    );
  }
}

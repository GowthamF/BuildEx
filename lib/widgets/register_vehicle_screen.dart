import 'package:buildex/blocs/blocs.dart';
import 'package:buildex/repositories/repositories.dart';
import 'package:buildex/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterVehicleScreen extends StatelessWidget {
  const RegisterVehicleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Vehicle'),
      ),
      body: BlocProvider(
        create: (context) => VehicleBloc(
          RepositoryProvider.of<VehicleRepository>(context),
        ),
        child: const RegisterVehicle(),
      ),
    );
  }
}

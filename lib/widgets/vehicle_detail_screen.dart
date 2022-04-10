import 'package:buildex/blocs/blocs.dart';
import 'package:buildex/repositories/repositories.dart';
import 'package:buildex/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehicleDetailScreen extends StatelessWidget {
  final String vehicleId;
  const VehicleDetailScreen({required this.vehicleId, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VehicleBloc(
        RepositoryProvider.of<VehicleRepository>(context),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Vehicle Details'),
        ),
        body: VehicleDetail(vehicleId: vehicleId),
      ),
    );
  }
}

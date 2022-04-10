import 'package:buildex/blocs/blocs.dart';
import 'package:buildex/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehicleDetail extends StatefulWidget {
  final String vehicleId;
  const VehicleDetail({required this.vehicleId, Key? key}) : super(key: key);

  @override
  State<VehicleDetail> createState() => _VehicleDetailState();
}

class _VehicleDetailState extends State<VehicleDetail> {
  // final TextEditingController

  late VehicleBloc _vehicleBloc;

  @override
  void initState() {
    super.initState();
    _vehicleBloc = BlocProvider.of<VehicleBloc>(context);
    _vehicleBloc.add(GetVehicleById(widget.vehicleId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehicleBloc, VehicleState>(
      builder: (context, state) {
        if (state is VehicleByIdLoaded) {
          if (state.vehicleModel != null) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextReadOnly(
                      text: state.vehicleModel!.registrationNumber,
                      labelText: 'Registration Number',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextReadOnly(
                      text: state.vehicleModel!.model,
                      labelText: 'Model',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextReadOnly(
                      text: state.vehicleModel!.make,
                      labelText: 'Make',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextReadOnly(
                      text: state.vehicleModel!.fuelType,
                      labelText: 'Fuel Type',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextReadOnly(
                      text: state.vehicleModel!.gearType,
                      labelText: 'Gear Type',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextReadOnly(
                      text: state.vehicleModel!.options,
                      labelText: 'Options',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextReadOnly(
                      text: '${state.vehicleModel!.engineCapacity}',
                      labelText: 'Engine Capacity',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextReadOnly(
                      text: '${state.vehicleModel!.mileage}',
                      labelText: 'Mileage',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextReadOnly(
                      text: '${state.vehicleModel!.yom}',
                      labelText: 'YOM',
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: Text('No Data found'),
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

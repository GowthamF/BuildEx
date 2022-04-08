import 'package:buildex/blocs/blocs.dart';
import 'package:buildex/common/common.dart';
import 'package:buildex/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterVehicle extends StatefulWidget {
  const RegisterVehicle({Key? key}) : super(key: key);

  @override
  State<RegisterVehicle> createState() => _RegisterVehicleState();
}

class _RegisterVehicleState extends State<RegisterVehicle> {
  final TextEditingController _vehicleNumberEditingController =
      TextEditingController();
  final TextEditingController _vehicleModelEditingController =
      TextEditingController();
  final TextEditingController _mileageEditingController =
      TextEditingController();
  final TextEditingController _makeEditingController = TextEditingController();
  final TextEditingController _yomEditingController = TextEditingController();
  final TextEditingController _gearTypeEditingController =
      TextEditingController();
  final TextEditingController _fuelTypeEditingController =
      TextEditingController();
  final TextEditingController _optionsEditingController =
      TextEditingController();
  final TextEditingController _engineCapacityEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late VehicleBloc _vehicleBloc;

  @override
  void initState() {
    super.initState();
    _vehicleBloc = BlocProvider.of<VehicleBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                child: SizedBox(
                  height: 250,
                  child: Carousel(
                    uploadedImageUrls: [],
                  ),
                ),
              ),
            ),
            TextFieldCustom(
                textEditingController: _vehicleNumberEditingController,
                labelText: 'Vehicle Number'),
            TextFieldCustom(
                textEditingController: _vehicleModelEditingController,
                labelText: 'Vehicle Model'),
            TextFieldCustom(
                textEditingController: _makeEditingController,
                labelText: 'Make'),
            NumberTextField(
                textEditingController: _yomEditingController, labelText: 'YOM'),
            NumberTextField(
                textEditingController: _mileageEditingController,
                labelText: 'Mileage'),
            TextFieldCustom(
                textEditingController: _gearTypeEditingController,
                labelText: 'Gear Type'),
            TextFieldCustom(
                textEditingController: _fuelTypeEditingController,
                labelText: 'Fuel Type'),
            TextFieldCustom(
                textEditingController: _optionsEditingController,
                labelText: 'Options'),
            NumberTextField(
                textEditingController: _engineCapacityEditingController,
                labelText: 'Engine Capacity'),
            BlocConsumer<VehicleBloc, VehicleState>(
              listener: (context, state) {
                if (state is VehicleCreated) {
                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                if (state is VehicleCreating) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Button(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        var vehicleModel = VehicleModel(
                          engineCapacity: int.parse(
                            _engineCapacityEditingController.text.trim(),
                          ),
                          fuelType: _fuelTypeEditingController.text.trim(),
                          gearType: _gearTypeEditingController.text.trim(),
                          isActive: true,
                          make: _makeEditingController.text.trim(),
                          mileage:
                              int.parse(_mileageEditingController.text.trim()),
                          model: _vehicleModelEditingController.text.trim(),
                          options: _optionsEditingController.text.trim(),
                          registrationNumber:
                              _vehicleNumberEditingController.text.trim(),
                          yom: int.parse(_yomEditingController.text.trim()),
                        );

                        _vehicleBloc
                            .add(CreateVehicle(vehicleModel: vehicleModel));
                      }
                    },
                    text: 'SUBMIT');
              },
            )
          ],
        ),
      ),
    );
  }
}

import 'package:buildex/common/common.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Column(
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
            textEditingController: _mileageEditingController,
            labelText: 'Mileage'),
        Button(onPressed: () {}, text: 'SUBMIT')
      ],
    );
  }
}

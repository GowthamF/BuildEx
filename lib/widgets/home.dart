import 'package:buildex/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Vehicle Details',
                style: TextStyle(fontSize: 25),
              ),
            ),
            VehicleDetails(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Service Centers',
                style: TextStyle(fontSize: 25),
              ),
            ),
            ServiceCenters()
          ],
        ),
      ),
    );
  }
}

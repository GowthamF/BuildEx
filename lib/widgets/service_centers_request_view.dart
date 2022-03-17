import 'package:buildex/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ServiceCentersRequestsView extends StatefulWidget {
  const ServiceCentersRequestsView({Key? key}) : super(key: key);

  @override
  State<ServiceCentersRequestsView> createState() =>
      _ServiceCentersRequestsViewState();
}

class _ServiceCentersRequestsViewState
    extends State<ServiceCentersRequestsView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ServiceCentersRequestsScreen()));
      },
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Text(
              'Requests - Service Centers',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Pending : 0',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      )),
    );
  }
}

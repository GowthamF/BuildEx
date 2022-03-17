import 'package:buildex/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ServiceCentersRequestsScreen extends StatelessWidget {
  const ServiceCentersRequestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Requests'),
      ),
      body: const ServiceCentersRequests(),
    );
  }
}

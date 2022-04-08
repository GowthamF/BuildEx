import 'package:buildex/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MyServiceCenterScreen extends StatelessWidget {
  const MyServiceCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Service Center'),
      ),
      body: const MyServiceCenter(),
    );
  }
}

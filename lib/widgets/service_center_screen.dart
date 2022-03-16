import 'package:buildex/cubits/cubits.dart';
import 'package:buildex/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceCenterScreen extends StatelessWidget {
  const ServiceCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceCenterSlotCubit(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Service Center'),
          ),
          body: const ServiceCenter(),
        ),
      ),
    );
  }
}

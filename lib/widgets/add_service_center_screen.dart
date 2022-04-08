import 'package:buildex/blocs/blocs.dart';
import 'package:buildex/repositories/repositories.dart';
import 'package:buildex/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddServiceCenterScreen extends StatelessWidget {
  const AddServiceCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Service Center'),
      ),
      body: BlocProvider(
        create: (context) => ServiceCenterBloc(
          RepositoryProvider.of<ServiceCenterRepository>(context),
        ),
        child: const AddServiceCenter(),
      ),
    );
  }
}

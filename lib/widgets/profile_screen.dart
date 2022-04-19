import 'package:buildex/blocs/blocs.dart';
import 'package:buildex/repositories/repositories.dart';
import 'package:buildex/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<UserRepository>(context),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: const Profile(),
      ),
    );
  }
}

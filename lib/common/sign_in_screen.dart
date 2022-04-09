import 'package:buildex/blocs/blocs.dart';
import 'package:buildex/common/common.dart';
import 'package:buildex/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Sign In'),
          ),
          body: BlocProvider(
            create: (context) => UserBloc(
              RepositoryProvider.of<UserRepository>(context),
            ),
            child: const SignIn(),
          ),
        ),
      ),
    );
  }
}

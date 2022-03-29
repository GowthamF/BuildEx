import 'package:buildex/blocs/blocs.dart';
import 'package:buildex/common/common.dart';
import 'package:buildex/cubits/cubits.dart';
import 'package:buildex/helpers/helpers.dart';
import 'package:buildex/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<HttpHelper>(
          create: (context) =>
              HttpHelper("http://ec2-3-91-205-55.compute-1.amazonaws.com:3001"),
        ),
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepository(
            RepositoryProvider.of<HttpHelper>(context),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomePageChangeCubit(),
          ),
          BlocProvider(
            create: (context) => UserRolesCubit(),
          ),
          BlocProvider(
            create: (context) => UserBloc(
              RepositoryProvider.of<UserRepository>(context),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'BuildEx',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const SignInScreen(),
        ),
      ),
    );
  }
}

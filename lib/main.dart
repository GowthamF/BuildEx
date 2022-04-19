import 'package:buildex/blocs/blocs.dart';
import 'package:buildex/common/common.dart';
import 'package:buildex/cubits/cubits.dart';
import 'package:buildex/helpers/helpers.dart';
import 'package:buildex/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
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
        RepositoryProvider<ServiceCenterRepository>(
          create: (context) => ServiceCenterRepository(
            RepositoryProvider.of<HttpHelper>(context),
          ),
        ),
        RepositoryProvider<TimeslotRepository>(
          create: (context) => TimeslotRepository(
            RepositoryProvider.of<HttpHelper>(context),
          ),
        ),
        RepositoryProvider<TimetableRepository>(
          create: (context) => TimetableRepository(
            RepositoryProvider.of<HttpHelper>(context),
          ),
        ),
        RepositoryProvider<VehicleServiceRepository>(
          create: (context) => VehicleServiceRepository(
            RepositoryProvider.of<HttpHelper>(context),
          ),
        ),
        RepositoryProvider<VehicleImageRepository>(
          create: (context) => VehicleImageRepository(
            RepositoryProvider.of<HttpHelper>(context),
          ),
        ),
        RepositoryProvider<VehicleRepository>(
          create: (context) => VehicleRepository(
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
            create: (context) => UserAccessTokenCubit(),
          ),
          BlocProvider(
            create: (context) => UserBloc(
              RepositoryProvider.of<UserRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => FeedbackBloc(),
          ),
          BlocProvider(
            create: (context) => RolesBloc(),
          ),
          BlocProvider(
            create: (context) => ServiceCenterBloc(
              RepositoryProvider.of<ServiceCenterRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => TimeslotBloc(
              RepositoryProvider.of<TimeslotRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => TimetableBloc(
              RepositoryProvider.of<TimetableRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => VehicleBloc(
              RepositoryProvider.of<VehicleRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => VehicleImageBloc(),
          ),
          BlocProvider(
            create: (context) => VehicleServiceBloc(),
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

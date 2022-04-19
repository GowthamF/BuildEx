import 'package:buildex/blocs/blocs.dart';
import 'package:buildex/common/common.dart';
import 'package:buildex/cubits/cubits.dart';
import 'package:buildex/helpers/helpers.dart';
import 'package:buildex/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  late UserBloc _userBloc;

  @override
  void initState() {
    super.initState();
    _userBloc = BlocProvider.of<UserBloc>(context);
    var accessToken = context.read<UserAccessTokenCubit>().state;
    if (accessToken != null) {
      _userBloc.add(GetProfile(accessToken: accessToken));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserProfileLoaded) {
          var userModel = state.userModel;
          context.read<UserRolesCubit>().getRoles(userModel.roles);
          return SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: IconButton(
                      iconSize: 100,
                      onPressed: () {},
                      icon: const Icon(Icons.portrait_outlined),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    child: TextFieldEdit(
                      text: userModel.firstName,
                      labelText: 'First Name',
                      textEditingController: _firstNameController,
                    ),
                    padding: const EdgeInsets.all(2),
                  ),
                ),
                Center(
                  child: Padding(
                      child: TextFieldEdit(
                          text: userModel.lastName,
                          labelText: 'Last Name',
                          textEditingController: _lastNameController),
                      padding: const EdgeInsets.all(2)),
                ),
                Center(
                  child: Padding(
                    child: TextFieldEdit(
                        text: userModel.email,
                        labelText: 'Email Address',
                        textEditingController: _emailController),
                    padding: const EdgeInsets.all(2),
                  ),
                ),
                Center(
                  child: Padding(
                    child: TextFieldEdit(
                        text: userModel.mobile,
                        labelText: 'Mobile Number',
                        textEditingController: _mobileController),
                    padding: const EdgeInsets.all(2),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      const Text('User Roles'),
                      BlocBuilder<UserRolesCubit, List<UserRoles?>>(
                        builder: (context, state) {
                          var buyer = state.firstWhere(
                              (element) => element == UserRoles.buyer,
                              orElse: () => null);
                          var serviceCenter = state.firstWhere(
                              (element) => element == UserRoles.serviceCenter,
                              orElse: () => null);
                          var vehicleOwner = state.firstWhere(
                              (element) => element == UserRoles.vehicleOwner,
                              orElse: () => null);
                          return Wrap(
                            children: [
                              CheckBoxCustom(
                                text: 'Buyer',
                                initialValue: buyer != null,
                                selectedValue: (bool selectedValue) {
                                  if (selectedValue) {
                                    context
                                        .read<UserRolesCubit>()
                                        .changeRole(UserRoles.buyer);
                                  } else {
                                    context
                                        .read<UserRolesCubit>()
                                        .removeRole(UserRoles.buyer);
                                  }
                                },
                              ),
                              CheckBoxCustom(
                                text: 'Vehicle Owner',
                                initialValue: vehicleOwner != null,
                                selectedValue: (bool selectedValue) {
                                  if (selectedValue) {
                                    context
                                        .read<UserRolesCubit>()
                                        .changeRole(UserRoles.vehicleOwner);
                                  } else {
                                    context
                                        .read<UserRolesCubit>()
                                        .removeRole(UserRoles.vehicleOwner);
                                  }
                                },
                              ),
                              CheckBoxCustom(
                                text: 'Vehicle Service Center',
                                initialValue: serviceCenter != null,
                                selectedValue: (bool selectedValue) {
                                  if (selectedValue) {
                                    context
                                        .read<UserRolesCubit>()
                                        .changeRole(UserRoles.serviceCenter);
                                  } else {
                                    context
                                        .read<UserRolesCubit>()
                                        .removeRole(UserRoles.serviceCenter);
                                  }
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BlocBuilder<UserRolesCubit, List<UserRoles?>>(
                      builder: (context, state) {
                        var serviceCenterOwner = state.firstWhere(
                            (element) => element == UserRoles.serviceCenter,
                            orElse: () => null);
                        print(serviceCenterOwner);
                        if (serviceCenterOwner == null) {
                          return const SizedBox();
                        }
                        return ListTile(
                          title: const Text('My Service Center'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const MyServiceCenterScreen(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Button(
                        onPressed: () {
                          // Navigator.pop(context);
                        },
                        text: 'Update Profile'),
                  ],
                )
              ],
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

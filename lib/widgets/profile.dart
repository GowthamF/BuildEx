import 'package:buildex/common/common.dart';
import 'package:buildex/cubits/cubits.dart';
import 'package:buildex/helpers/helpers.dart';
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

  @override
  Widget build(BuildContext context) {
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
                text: 'Gowtham',
                labelText: 'First Name',
                textEditingController: _firstNameController,
              ),
              padding: const EdgeInsets.all(2),
            ),
          ),
          Center(
            child: Padding(
                child: TextFieldEdit(
                    text: 'B',
                    labelText: 'Last Name',
                    textEditingController: _lastNameController),
                padding: const EdgeInsets.all(2)),
          ),
          Center(
            child: Padding(
              child: TextFieldEdit(
                  text: 'gowtham@gmail.com',
                  labelText: 'Email Address',
                  textEditingController: _emailController),
              padding: const EdgeInsets.all(2),
            ),
          ),
          Center(
            child: Padding(
              child: TextFieldEdit(
                  text: '0777123456',
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
}

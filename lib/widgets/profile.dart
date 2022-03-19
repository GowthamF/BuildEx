import 'package:buildex/common/common.dart';
import 'package:flutter/material.dart';

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
                Wrap(
                  children: [
                    CheckBoxCustom(
                      text: 'Buyer',
                      initialValue: false,
                      selectedValue: (selectedValue) {},
                    ),
                    CheckBoxCustom(
                      text: 'Vehicle Owner',
                      initialValue: false,
                      selectedValue: (selectedValue) {},
                    ),
                    CheckBoxCustom(
                      text: 'Vehicle Service Center',
                      initialValue: false,
                      selectedValue: (selectedValue) {},
                    ),
                  ],
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

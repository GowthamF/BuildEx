import 'package:buildex/blocs/blocs.dart';
import 'package:buildex/common/common.dart';
import 'package:buildex/helpers/helpers.dart';
import 'package:buildex/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  UserRoles? selectedUserRole;

  late UserBloc _userBloc;

  @override
  void initState() {
    super.initState();
    _userBloc = BlocProvider.of<UserBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: Image.asset('assets/images/playstore.png',
            //       cacheHeight: MediaQuery.of(context).size.height ~/ 3),
            // ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        labelText: 'Email Address',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email Address is required';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TextFormField(
                      controller: _firstNameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        labelText: 'First Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email Address is required';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TextFormField(
                      controller: _lastNameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        labelText: 'Last Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email Address is required';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TextFormField(
                      controller: _mobileController,
                      keyboardType: TextInputType.phone,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        labelText: 'Mobile Number',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mobile Number is required';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: DropDown(const [
                      {UserRoles.vehicleOwner: "Vehicle Owner"},
                      {UserRoles.serviceCenter: "Vehicle Service Center"},
                      {UserRoles.buyer: "Buyer"}
                    ], (selectedValue) {
                      selectedUserRole = selectedValue;
                    }, "User Type", ""),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: PasswordField(_passwordController),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 8),
                  //   child: IconButton(
                  //     iconSize: 100,
                  //     onPressed: () {},
                  //     icon: const Icon(Icons.portrait_outlined),
                  //   ),
                  // )
                ],
              ),
            ),
            BlocConsumer<UserBloc, UserState>(
              listener: (context, state) {
                if (state is UserRegistered) {
                  Navigator.pop(context);
                }
                if (state is UserError) {
                  var snackBar = SnackBar(content: Text(state.errorMessage));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              builder: (context, state) {
                if (state is UserRegistering) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Button(
                      onPressed: () {
                        if (selectedUserRole != null) {
                          var userModel = UserModel(
                              firstName: _firstNameController.text.trim(),
                              lastName: _lastNameController.text.trim(),
                              mobile: _mobileController.text.trim(),
                              email: _emailController.text.trim(),
                              isActive: true,
                              jwtTokens: [],
                              locked: false,
                              refreshTokens: [],
                              roles: [selectedUserRole!]);

                          _userBloc.add(RegisterUser(userModel: userModel));
                        }
                      },
                      text: 'Create an Account',
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

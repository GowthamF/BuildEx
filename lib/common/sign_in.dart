import 'package:buildex/blocs/blocs.dart';
import 'package:buildex/common/common.dart';
import 'package:buildex/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SignInState();
  }
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Image.asset('assets/images/logo.png',
                      cacheHeight: MediaQuery.of(context).size.height ~/ 3),
                  const Text(
                    'BuildEx',
                    style: TextStyle(fontSize: 50),
                  ),
                ],
              ),
            ),
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
                    child: PasswordField(_passwordController),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BlocConsumer<UserBloc, UserState>(
                  listener: (context, state) {
                    if (state is UserLogged) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InitialScreen(),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is UserLogging) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Button(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _userBloc.add(LoginUser(
                                userName: _emailController.text.trim(),
                                password: _passwordController.text.trim()));
                          }
                        },
                        text: 'Sign In');
                  },
                ),
                Button(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                    },
                    text: 'Sign Up'),
              ],
            )
          ],
        ),
      ),
    );
  }
}

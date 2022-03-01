import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController passwordEditingController;
  const PasswordField(this.passwordEditingController, {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PasswordFieldState();
  }
}

class _PasswordFieldState extends State<PasswordField> {
  bool isShowingPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordEditingController,
      obscureText: !isShowingPassword,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        labelText: 'Password',
        suffixIcon: IconButton(
          tooltip: 'Show Password',
          onPressed: () {
            setState(() {
              isShowingPassword = !isShowingPassword;
            });
          },
          icon: isShowingPassword
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Password is required';
        }
        return null;
      },
    );
  }
}

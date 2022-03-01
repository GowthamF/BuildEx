import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final Function()? onPressed;
  final String text;
  const Button({required this.onPressed, required this.text, Key? key})
      : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      padding: const EdgeInsets.all(15.0),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        child: Text(widget.text),
      ),
    );
  }
}

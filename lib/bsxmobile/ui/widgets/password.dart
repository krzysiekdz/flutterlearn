
import 'package:flutter/material.dart';

class Password extends StatefulWidget {

  TextEditingController controller;
  Widget? label;
  Password({super.key,  required this.controller, this.label });

  @override
  State<StatefulWidget> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      obscureText: !showPassword,
      decoration:  InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        label: widget.label,
        suffixIcon: IconButton(
            icon: showPassword ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
            onPressed: (){ _toggleShowPassword(); }
        ),
      ),
    );
  }

  void _toggleShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }
}
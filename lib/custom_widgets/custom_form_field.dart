import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField({
    Key? key,
    @required this.onChanged,
    required this.prefix,
    this.validator,
    required this.labelText,
    required this.prefixPressed,
    required this.textInputType,
    this.onTap,
    required this.controller,
  }) : super(key: key);

  TextInputType textInputType;
  GlobalKey formKey = GlobalKey<FormState>();
  TextEditingController controller;
  Widget prefix;
  Function prefixPressed;
  void Function(String)? onChanged;

  String labelText;
  String? Function(String?)? validator;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(


      style: TextStyle(color: Colors.black54),
      enableSuggestions: true,
      textInputAction: TextInputAction.search,
      onChanged: onChanged,

      controller: controller,
      decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: prefix,
          border: OutlineInputBorder()),
      onTap: onTap,
      keyboardType: textInputType,
      validator: validator,
    );
  }
}

import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({super.key, this.text, this.icon, this.onChanged,this.obSecureText=false});
  Function(String)? onChanged;
  String? text;
  IconData? icon;
  bool? obSecureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obSecureText!,
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required';
        }
      },
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        hintText: text,
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      onChanged: onChanged,
    );
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.textButton,
    this.onPressed,
  });
  String textButton;
  VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            textButton,
            style: const TextStyle(color: Colors.black),
          ),
        ));
  }
}
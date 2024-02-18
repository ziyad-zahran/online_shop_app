import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, this.onChanged,required this.hint,this.icon,this.isPassword});
  String? hint;
  IconData? icon;
  bool? isPassword = false;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data)
      {
        if(data!.isEmpty)
        {
          return 'field is required';
        }
        return null;
      },
      onChanged: onChanged,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.white54,
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.black54,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}


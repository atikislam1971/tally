import 'package:flutter/services.dart';

import '../../exports.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key,
    required this.labelText,
    required this.hintText,
    this.prefixText,
    this.leadingIcon,
    this.onChanged,
    this.inputFormatters,
    this.controller,
    this.keyboardType
  });
  final String labelText;
  final String hintText;
  final String? prefixText;
  final IconData? leadingIcon;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.3),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        prefixText: prefixText,
        prefixStyle: TextStyle(
          color: Colors.black.withOpacity(0.5),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.black.withOpacity(0.3),
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        floatingLabelStyle: TextStyle(
          color: AppColors.primary,
        ),
        prefixIcon: leadingIcon ==null ? null: Icon(leadingIcon)
    )
    );
  }
}

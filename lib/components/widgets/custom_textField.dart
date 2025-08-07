import 'package:flutter/material.dart';
import 'package:notoan/utils/constants/colors.dart';
import 'package:notoan/utils/constants/fonts.dart';

class CustomTextField extends StatefulWidget {
  final IconData leadingIcon;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final Widget? trailing; // ✅ Optional trailing widget

  const CustomTextField({
    super.key,
    required this.leadingIcon,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.trailing,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _hasText = widget.controller.text.isNotEmpty;
    widget.controller.addListener(_handleTextChange);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleTextChange);
    super.dispose();
  }

  void _handleTextChange() {
    if (_hasText != widget.controller.text.isNotEmpty) {
      setState(() {
        _hasText = widget.controller.text.isNotEmpty;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      style: const TextStyle(
        fontFamily: AppFonts.outfit,
        fontSize: 14,
        color: AppColors.black,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.leadingIcon,
          color: _hasText ? AppColors.primaryGreen : AppColors.grey,
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontFamily: AppFonts.outfit,
          fontSize: 14,
          color: Colors.grey,
        ),

        suffixIcon:
            widget.isPassword
                ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.primaryGreen,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
                : widget.trailing, // render trailing if not password field

        filled: true,
        fillColor: const Color(0xFFF9F9F9),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.grey.shade50),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(color: AppColors.white),
        ),
      ),
    );
  }
}

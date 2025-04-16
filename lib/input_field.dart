import 'package:flutter/material.dart';
import 'package:attorney_ai/app_colors.dart';

// ignore: must_be_immutable
class InputField extends StatelessWidget {
  String? label;
  String? hintText;
  IconData? suffixIcon;
  IconData? prefixIcon;
  VoidCallback? onSuffixIconPressed;
  VoidCallback? onPrefixIconPressed;
  TextInputType? keyboardType;
  bool? multiline;
  TextEditingController? controller;

  void Function(String?)? onSubmitted;

  TextCapitalization? textCapitalization;
  VoidCallback? onTap;

  bool? enabled;

  bool obscureText;

  int minLines;

  void Function(String?)? onChanged;

  InputField({
    super.key,
    this.label,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.onSuffixIconPressed,
    this.onPrefixIconPressed,
    this.keyboardType,
    this.multiline = false,
    this.minLines = 1,
    this.enabled = true,
    this.controller,
    this.obscureText = false,
    this.textCapitalization,
    this.onSubmitted,
    this.onTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null)
          Text(
            label!,
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: AppColors.secondaryText,
              fontSize: 15,
            ),
          ),
        if (label != null)
          const SizedBox(
            height: 10,
          ),
        TextField(
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          cursorColor: Colors.white,
          obscureText: obscureText,
          onChanged: onChanged,
          minLines: minLines,
          maxLines: multiline! ? 10 : 1,
          style: const TextStyle(
            fontSize: 17,
            color: AppColors.primaryText,
          ),
          keyboardType: keyboardType,
          controller: controller,
          onSubmitted: onSubmitted,
          decoration: InputDecoration(
              suffixIcon: suffixIcon != null
                  ? IconButton(
                      onPressed: onSuffixIconPressed,
                      splashRadius: 2,
                      icon: Icon(suffixIcon, color: AppColors.primary),
                    )
                  : null,
              prefixIcon: prefixIcon != null
                  ? IconButton(
                      splashColor: AppColors.primary,
                      splashRadius: 1,
                      onPressed: onPrefixIconPressed,
                      icon: Icon(prefixIcon, color: AppColors.primary),
                    )
                  : null,
              hintStyle: const TextStyle(
                color: AppColors.secondaryText,
                fontWeight: FontWeight.normal,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
              hintText: hintText ?? "",
              filled: true,
              fillColor: AppColors.secondaryBackground,
              
              border: OutlineInputBorder(
                // borderSide: BorderSide(color: AppColors.secondaryBackgroundBorder, width: 0.5),
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(50),
              ),
              focusedBorder: OutlineInputBorder(
                // borderSide: BorderSide(color: AppColors.secondaryBackgroundBorder, width: 0.5),
                borderRadius: BorderRadius.circular(50),
              )
          ),
          enabled: enabled,
          onTap: onTap,
        ),
      ],
    );
  }
}

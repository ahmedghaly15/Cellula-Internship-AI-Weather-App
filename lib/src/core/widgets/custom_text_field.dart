import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_colors.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.validate,
    this.onChanged,
    this.obscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.onSubmit,
    this.autofillHints,
    this.focusNode,
    this.onEditingComplete,
    this.textCapitalization = TextCapitalization.none,
    this.contentPadding,
    this.textAlign = TextAlign.start,
    this.enabledBorder,
    this.focusedBorder,
    this.enabled,
    this.margin,
    this.border,
    this.errorBorder,
    this.focusedErrorBorder,
    this.hintStyle,
    this.disabledBorder,
    this.autofocus = false,
  });

  final TextInputType keyboardType;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  final String? Function(String?)? validate;
  final void Function(String)? onChanged;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String submittedText)? onSubmit;
  final List<String>? autofillHints;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final TextCapitalization textCapitalization;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlign textAlign;
  final InputBorder? enabledBorder;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;
  final bool? enabled;
  final EdgeInsetsGeometry? margin;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: 24.w),
      child: TextFormField(
        autofocus: autofocus,
        enabled: enabled,
        selectionHeightStyle: BoxHeightStyle.strut,
        obscureText: obscureText ?? false,
        autofillHints: autofillHints,
        validator: validate,
        onChanged: onChanged,
        onFieldSubmitted: onSubmit,
        onEditingComplete: onEditingComplete,
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboardType,
        cursorColor: Colors.white,
        textCapitalization: textCapitalization,
        textAlign: textAlign,
        style: const TextStyle(color: Colors.white),
        cursorErrorColor: Colors.white,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          contentPadding:
              contentPadding ?? EdgeInsets.symmetric(horizontal: 12.w),
          disabledBorder: disabledBorder ?? _outlineInputBorder,
          enabledBorder: enabledBorder ?? _outlineInputBorder,
          focusedBorder: focusedBorder ?? _outlineInputBorder,
          focusedErrorBorder: focusedErrorBorder ?? _outlineInputBorder,
          errorBorder: errorBorder ?? _outlineInputBorder,
          hintText: hintText ?? '',
          hintStyle: hintStyle ?? AppTextStyles.font16WhiteRegular,
          filled: true,
          fillColor: AppColors.lightTeal,
          border: border ?? _outlineInputBorder,
        ),
      ),
    );
  }

  OutlineInputBorder get _outlineInputBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(34.r),
        borderSide: const BorderSide(color: Colors.transparent),
      );
}

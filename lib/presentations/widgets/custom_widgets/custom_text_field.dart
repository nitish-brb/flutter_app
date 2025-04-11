import 'package:flutter/material.dart';

import '../../../../core/constants/app_text_style.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/dimension_constants.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final bool isObscureText;
  final bool? readyOnly;
  final TextInputType textInputType;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final OutlineInputBorder? enabledBorder;
  final Widget? suffixIcon;

  const CustomTextField(
      {super.key,
        this.controller,
        this.label,
        this.readyOnly,
        this.textInputType = TextInputType.text,
        this.isObscureText = false,
        this.hintText,
        this.hintTextStyle,
        this.enabledBorder,
        this.suffixIcon, required bool enabled,
      });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isShowPassword = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _isShowPassword = widget.isObscureText;
      });
    });
  }

  _showHidePasswordIconTapped() {
    setState(() {
      _isShowPassword = !_isShowPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(readOnly: widget.readyOnly??false,
      obscureText: _isShowPassword,
      controller: widget.controller,
      keyboardType: widget.textInputType,
      decoration: InputDecoration(

          suffixIcon: _getSuffixWidget(),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.label,
          hintText: widget.hintText,
          hintStyle: widget.hintTextStyle ??
              AppTextStyles.regularText(fontSize: Dimensions.px12),
          labelStyle: AppTextStyles.regularText(fontSize: Dimensions.px12),
          focusedBorder: widget.enabledBorder ??
              OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.px10),
                  borderSide:
                  const BorderSide(width: .5, color: ColorConstants.grey)),
          enabledBorder: widget.enabledBorder ??
              OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.px10),
                  borderSide:
                  const BorderSide(width: .5, color: ColorConstants.grey)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.px10),
              borderSide:
              const BorderSide(width: .5, color: ColorConstants.grey))),
    );
  }

  Widget? _getSuffixWidget() {
    if (widget.isObscureText) {
      return GestureDetector(
        onTap: _showHidePasswordIconTapped,
        child: _isShowPassword
            ? const Icon(Icons.visibility_outlined)
            : const Icon(
          Icons.visibility_off_outlined,
          color: ColorConstants.dodgerBlue,
        ),
      );
    }
    return widget.suffixIcon;
  }
}

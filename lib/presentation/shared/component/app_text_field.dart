import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String labelText;
  final String? errorMessage;
  final TextInputType? textInputType;

  const AppTextField(
      {Key? key,
        required this.controller,
        this.isPassword = false,
        required this.labelText,
        this.errorMessage, this.textInputType})
      : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200.w,
        margin: REdgeInsets.only(bottom: 12.h),
        child: TextFormField(
          keyboardType: widget.textInputType ?? TextInputType.name,
          controller: widget.controller,
          cursorColor: Colors.black,
          maxLength: 20,
          obscureText: !isPasswordVisible && widget.isPassword,
          decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle: const TextStyle(
              color: Colors.grey,
            ),
            errorText: widget.errorMessage,
            suffixIcon: widget.isPassword
                ? IconButton(
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Theme.of(context).primaryColorDark,
              ),
              onPressed: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
            )
                : null,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF6200EE)),
            ),
          ),
        ),
      ),
    );
  }
}
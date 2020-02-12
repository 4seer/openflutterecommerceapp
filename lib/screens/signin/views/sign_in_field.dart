import 'package:flutter/material.dart';

import '../../../config/theme.dart';

class SignInField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final FormFieldValidator validator;
  final TextInputType keyboard;
  final FocusNode focusNode;
  final VoidCallback onFinished;
  final bool isPassword;

  const SignInField(
      {Key key,
      @required this.controller,
      this.hint,
      this.validator,
      this.keyboard = TextInputType.text,
      this.focusNode,
      this.onFinished,
      this.isPassword = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SignInFieldState();
  }
}

class _SignInFieldState extends State<SignInField> {
  bool isRed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        elevation: 3,
        shape: isRed
            ? RoundedRectangleBorder(
                side: BorderSide(color: AppColors.red, width: 1.0),
                borderRadius: BorderRadius.circular(AppSizes.TEXT_FIELD_RADIUS),
              )
            : RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 1.0),
                borderRadius: BorderRadius.circular(AppSizes.TEXT_FIELD_RADIUS),
              ),
        color: AppColors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: TextFormField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            validator: _validator,
            keyboardType: widget.keyboard,
            obscureText: widget.isPassword,
            decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: TextStyle(
                    color: AppColors.lightGray,
                    fontSize: 16,
                    fontWeight: FontWeight.w300)),
          ),
        ),
      ),
    );
  }

  String _validator(String value) {
    String validatorResult = widget.validator(value);
    setState(() {
      isRed = validatorResult.isNotEmpty;
    });
    return validatorResult;
  }
}

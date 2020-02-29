import 'package:flutter/material.dart';

import '../config/theme.dart';

class OpenFlutterInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final FormFieldValidator validator;
  final TextInputType keyboard;
  final FocusNode focusNode;
  final VoidCallback onFinished;
  final bool isPassword;
  final double horizontalPadding;
  final Function onValueChanged;

  const OpenFlutterInputField(
      {Key key,
      @required this.controller,
      this.hint,
      this.validator,
      this.keyboard = TextInputType.text,
      this.focusNode,
      this.onFinished,
      this.isPassword = false,
      this.horizontalPadding = 16.0,
      this.onValueChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return OpenFlutterInputFieldState();
  }
}

class OpenFlutterInputFieldState extends State<OpenFlutterInputField> {
  String error = null;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
      child: Column(
        children: <Widget>[
          Card(
            elevation: 3,
            shape: error != null
                ? RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.red, width: 1.0),
                    borderRadius:
                        BorderRadius.circular(AppSizes.textFieldRadius),
                  )
                : RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 1.0),
                    borderRadius:
                        BorderRadius.circular(AppSizes.textFieldRadius),
                  ),
            color: AppColors.white,
            child: Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: TextField(
                onChanged: (value) => this.widget.onValueChanged(value),
                style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 16),
                controller: widget.controller,
                focusNode: widget.focusNode,
                keyboardType: widget.keyboard,
                obscureText: widget.isPassword,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: widget.hint,
                    hintText: widget.hint,
                    suffixIcon: error != null
                        ? Icon(
                            Icons.close,
                            color: AppColors.red,
                          )
                        : isChecked ? Icon(Icons.done) : null,
                    hintStyle: TextStyle(
                        color: AppColors.lightGray,
                        fontSize: 16,
                        fontWeight: FontWeight.w300)),
              ),
            ),
          ),
          error == null
              ? Container()
              : Text(
                  error,
                  style: TextStyle(color: AppColors.red, fontSize: 12),
                )
        ],
      ),
    );
  }

  String validate() {
    setState(() {
      error = widget.validator(widget.controller.text);
    });
    return error;
  }
}

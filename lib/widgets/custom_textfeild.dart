import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final String value;
  final Widget suffixIcon;
  final int maxLines;
  final bool obscureText;
  final int maxLength;
  final TextInputType keyboardType;
  final double fontSize;
  final void Function(String value) onChange;
  final bool enabled;
  final TextAlign textAlign;
  final double letterSpacing;
  final double lineHeight;
  final FontWeight fontWeight;
  final String prefixText;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final FormFieldValidator<String> validator;
  String labelText;

  CustomTextField({this.hint,
    this.value,
    this.maxLines = 1,
    this.maxLength,
    this.fontSize = 14,
    this.keyboardType,
    this.suffixIcon,
    this.obscureText = false,
    this.onChange,
    this.textAlign = TextAlign.left,
    this.letterSpacing = 0,
    this.lineHeight,
    this.fontWeight = FontWeight.w400,
    this.textInputAction = TextInputAction.search,
    this.prefixText = '',
    this.focusNode,
    this.validator,
    this.labelText,
    this.enabled = true});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String initialValue;
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    initialValue = widget.value;
    _controller = TextEditingController(text: initialValue);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        height: 64,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: TextFormField(
          validator: widget.validator,
          enabled: this.widget.enabled,
          focusNode: widget.focusNode ?? new FocusNode(),
          textCapitalization: TextCapitalization.sentences,
          controller: _controller,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          keyboardAppearance: Brightness.light,
          textAlign: widget.textAlign,
          obscureText: widget.obscureText,
          onChanged: widget.onChange,
          style: TextStyle(
            height: widget.lineHeight,
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
            color: Colors.black,
            letterSpacing: widget.letterSpacing,
          ),
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          decoration: InputDecoration(
            enabled: widget.enabled,
            labelText: widget.labelText,
            labelStyle: TextStyle(
              fontSize: 12,
              color: AppColors.lightGray
            ),
            counter: Offstage(),
            prefixText: widget.prefixText,
            prefixStyle: TextStyle(
                color: AppColors.lightGray,
                fontSize: 16,
                fontWeight: FontWeight.w400),
            suffixIcon: widget.suffixIcon,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.TEXT_FIELD_RADIUS),
              borderSide: BorderSide.none,
            ),
            hintText: widget.hint,
            hintStyle: TextStyle(
              color: AppColors.lightGray,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

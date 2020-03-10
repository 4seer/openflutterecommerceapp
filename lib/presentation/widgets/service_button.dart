import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';

class OpenFlutterServiceButton extends StatelessWidget {
  final ServiceType serviceType;
  final VoidCallback onPressed;

  const OpenFlutterServiceButton(
      {Key key, this.serviceType = ServiceType.Google, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
              boxShadow: [
                BoxShadow(
                    color: AppColors.lightGray.withOpacity(0.3),
                    blurRadius: 4.0,
                    offset: Offset(0.0, 5.0)),
              ]),
          child: Image.asset(_selectImage()),
        ),
      ),
    );
  }

  String _selectImage() {
    switch (serviceType) {
      case ServiceType.Google:
        return 'assets/icons/signin/google.png';
      case ServiceType.Facebook:
        return 'assets/icons/signin/facebook.png';
    }
    return '';
  }
}

enum ServiceType { Google, Facebook }

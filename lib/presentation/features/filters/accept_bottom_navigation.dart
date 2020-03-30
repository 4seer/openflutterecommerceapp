import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/presentation/widgets/independent/custom_button.dart';

class AcceptBottomNavigation extends StatelessWidget {
  final VoidCallback onApply;

  const AcceptBottomNavigation({Key key, this.onApply}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: OpenFlutterButton(
              title: 'Discard',
              onPressed: () {
                Navigator.of(context).pop();
              },
              backgroundColor: AppColors.white,
              borderColor: AppColors.black,
              textColor: AppColors.black,
            ),
          ),
          Expanded(
            child: OpenFlutterButton(
              title: 'Apply',
              onPressed: onApply,
            ),
          )
        ],
      ),
    );
  }
}

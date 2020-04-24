import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/presentation/widgets/independent/base_product_list_item.dart';

class BlankProductListItem extends BaseProductListItem {
  BlankProductListItem()
      : super(
          inactiveMessage: '',
          bottomRoundButton: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.background,
            ),
            height: 36,
            width: 36,
          ),
          mainContentBuilder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildGrey(115, 21),
                _buildGrey(38, 11),
                _buildGrey(91, 14),
                _buildGrey(23, 15),
              ],
            );
          },
        );

  static Widget _buildGrey(double width, double height) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.all(Radius.circular(4.0))),
      ),
    );
  }
}

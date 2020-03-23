import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/abstract/model/product_attribute.dart';
import 'package:openflutterecommerce/presentation/features/product_details/product.dart';

class AttributeBottomSheet extends StatelessWidget {
  final ProductAttribute productAttribute;
  final String selectedValue;

  const AttributeBottomSheet(
      {Key key, this.productAttribute, this.selectedValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.62,
      child: Container(
        padding: AppSizes.bottomSheetPadding,
        decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(34), topRight: Radius.circular(34)),
            boxShadow: []),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 6,
                width: 60,
                decoration: BoxDecoration(
                  color: AppColors.lightGray,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Select ${productAttribute.name}',
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                child: IgnorePointer(
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    childAspectRatio: 100 / 60,
                    children: productAttribute.options
                        .map((String value) => InkWell(
                              onTap: () => {
                                BlocProvider.of<ProductBloc>(context).add(
                                    ProductSetAttributeEvent(
                                        value, productAttribute))
                              },
                              child: Container(
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: selectedValue == value
                                            ? AppColors.red
                                            : AppColors.darkGray),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                                child: Center(
                                  child: Text(
                                    value,
                                    style: TextStyle(fontSize: 15.0),
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              productAttribute.info == null
                  ? Container()
                  : Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: AppColors.darkGray),
                      child: Divider()),
              productAttribute.info == null
                  ? Container()
                  : ExpansionTile(
                      title: Text('${productAttribute.name} info'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      //TODO show info on click
                    ),
              Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: AppColors.darkGray),
                  child: Divider()),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

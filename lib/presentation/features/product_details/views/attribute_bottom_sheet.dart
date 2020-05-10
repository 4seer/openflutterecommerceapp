import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/abstract/model/product_attribute.dart';

class AttributeBottomSheet extends StatelessWidget {
  final ProductAttribute productAttribute;
  final String selectedValue;
  final Function(String, ProductAttribute) onValueSelect;

  const AttributeBottomSheet(
    {Key key, this.productAttribute, this.selectedValue, this.onValueSelect})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.12 + productAttribute.options.length/3*0.1,
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
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  childAspectRatio: 100 / 60,
                  children: productAttribute.options
                    .map((String value) => 
                      InkWell(
                        onTap: () => {
                          onValueSelect(value, productAttribute)
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
                      )
                    ).toList(),
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

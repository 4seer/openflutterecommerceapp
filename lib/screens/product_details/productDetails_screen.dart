import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/repos/models/product.dart';
import 'package:openflutterecommerce/screens/product_reviews/product_review_and_rating_screen.dart';
import 'package:openflutterecommerce/widgets/expansion_tile.dart';
import 'package:openflutterecommerce/widgets/favourite_button.dart';
import 'package:openflutterecommerce/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<int> list = [1, 2, 3, 4, 5];
  List<String> _sizes = ['XS', 'S', 'M', 'L', 'XL'];
  List<String> _color = ['Red', 'Black', 'White', 'Yellow'];
  Orientation orientation;
  List<Product> product = [
    Product(
        id: 1,
        image: "assets/thumbs/dress/dress2.png",
        discountPercent: 20,
        favorite: false,
        rating: 5,
        ratingCount: 10,
        price: 15,
        title: 'Evening Dress',
        categoryTitle: 'Dorothy Perkins',
        isNew: true),
    Product(
        id: 2,
        image: "assets/thumbs/dress/dress1.png",
        discountPercent: 15,
        favorite: false,
        rating: 5,
        ratingCount: 10,
        price: 22,
        title: 'Short Dress',
        categoryTitle: 'Sitlly',
        isNew: false),
    Product(
        id: 3,
        image: "assets/thumbs/dress/dress2.png",
        discountPercent: 20,
        favorite: false,
        rating: 5,
        ratingCount: 10,
        price: 15,
        title: 'Evening Dress',
        categoryTitle: 'Dorothy Perkins',
        isNew: false),
    Product(
        id: 4,
        image: "assets/thumbs/dress/dress1.png",
        discountPercent: 15,
        favorite: false,
        rating: 5,
        ratingCount: 10,
        price: 22,
        title: 'Short Dress',
        categoryTitle: 'Sitlly',
        isNew: true),
  ];
  bool favorite = false;
  String text = //dummy text for product description,shipping info and support
      "Lorem ipsum dolor amet ennui chia synth mixtape wolf forage brooklyn pug you probably haven't heard of them lumbersexual, iceland tilde. Poke tumeric readymade brunch, mustache banh mi man bun bushwick celiac hoodie mumblecore";
  String title = "H&M";
  String categoryTitle = "Short black dress";
  double rating = 5.0;
  int ratingCount = 10;
  double price = 19.99;

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    AppBarTheme _appbar = _theme.appBarTheme;
    final dividertheme =
        Theme.of(context).copyWith(dividerColor: AppColors.darkGray);
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: OpenFlutterScaffold(
      title: "Short dress",
      bottomMenuIndex: 3,
      background: _theme.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: deviceHeight * 0.52,
                  child: ListView.builder(
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(color: Colors.black),
                      //simpley replace the container with the images
                      width: deviceWidth * 0.75,
                      margin: EdgeInsets.only(right: 4.0, bottom: 5.0),
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: list.length,
                  ),
                ),
                Container(
                  //countains size button,color button and favourite button
                  margin: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      selectionOutlineButton(
                          deviceWidth, "Size", _showSelectSizeBottomSheet),
                      selectionOutlineButton(
                          deviceWidth, "Color", _showSelectColorBottomSheet),
                      OpenFlutterFavouriteButton(
                        favourite: favorite,
                        setFavourite: setFavourite,
                      ),
                    ],
                  ),
                ),
                productDetails(_theme),
                //Function call for Product detail widget
                Container(
                  margin:
                      EdgeInsets.only(left: 16.0, right: 16.0, bottom: 10.0),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                Container(
                  //                  decoration: BoxDecoration(
                  //                      boxShadow: <BoxShadow>[
                  //                        BoxShadow(
                  //                            color: Colors.black54,
                  //                            blurRadius: 15.0,
                  //                            offset: Offset(0.0, 0.75)
                  //                        )
                  //                      ],
                  //                    color: AppColors.white
                  //                  ),
                  width: deviceWidth,
                  margin: EdgeInsets.only(bottom: 13),
                  height: 90,
                  child: Center(
                    child: OpenFlutterButton(
                      title: "ADD TO CART",
                      onPressed: null,
                      width: deviceWidth * 0.88,
                      height: 50,
                    ),
                  ),
                ),
                Theme(data: dividertheme, child: Divider()),
                OpenFlutterExpansionTile(
                  title: "Shipping info",
                  description: text,
                ),
                Theme(data: dividertheme, child: Divider()),
                OpenFlutterExpansionTile(
                  title: "Support",
                  description: text,
                ),
                Theme(data: dividertheme, child: Divider()),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 16.0, right: 16.0, bottom: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        "You can also like this",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w600),
                      ),
                      new Text(
                        product.length.toString() + " items",
                        style: TextStyle(color: AppColors.lightGray),
                      )
                    ],
                  ),
                ),
                OpenFlutterProductListView(
                  width: deviceWidth,
                  products: product,
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  void setFavourite() {
    setState(() {
      favorite = !favorite;
    });
  }

  _showSelectSizeBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(34), topRight: Radius.circular(34)),
        ),
        builder: (BuildContext context) => Container(
              height: 472,
              padding: AppSizes.bottomSheetPadding,
              decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(34),
                      topRight: Radius.circular(34)),
                  boxShadow: []),
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
                    'Select size',
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    //height: 250,
                    child: IgnorePointer(
                      child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        childAspectRatio: 100 / 60,
                        children: _sizes
                            .map((String value) => GestureDetector(
                                  onTap: () => print(value),
                                  child: new Container(
                                    margin: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.darkGray),
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
                  Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: AppColors.darkGray),
                      child: Divider()),
                  ExpansionTile(
                    title: Text("Size info"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                  Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: AppColors.darkGray),
                      child: Divider()),
                  SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: OpenFlutterButton(
                      title: "ADD TO CART",
                      onPressed: null,
                    ),
                  )
                ],
              ),
            ));
  } //modelBottomSheet for selecting size

  _showSelectColorBottomSheet(
      BuildContext context) //modelBottomSheet for selecting color
  {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(34), topRight: Radius.circular(34)),
        ),
        builder: (BuildContext context) => Container(
              height: 472,
              padding: AppSizes.bottomSheetPadding,
              decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(34),
                      topRight: Radius.circular(34)),
                  boxShadow: []),
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
                    'Select color',
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    //height: 250,
                    child: IgnorePointer(
                      child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        childAspectRatio: 100 / 60,
                        children: _color
                            .map((String value) => GestureDetector(
                                  onTap: () => print(value),
                                  child: new Container(
                                    margin: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.darkGray),
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
                  Center(
                    child: OpenFlutterButton(
                      title: "ADD TO CART",
                      onPressed: null,
                    ),
                  )
                ],
              ),
            ));
  }

  Widget selectionOutlineButton(var deviceWidth, String title, Function fun) {
    //select size and select color widget
    return OutlineButton(
      onPressed: () => fun(context),
      child: Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  fontSize: 14,
                  color: AppColors.black,
                  fontWeight: FontWeight.w300),
            ),
            Icon(Icons.keyboard_arrow_down)
          ],
        ),
        width: deviceWidth * 0.29,
      ),
      borderSide: BorderSide(color: AppColors.darkGray),
      highlightedBorderColor: AppColors.red,
      focusColor: AppColors.white,
      highlightColor: Colors.white,
      hoverColor: AppColors.red,
      shape:
          ContinuousRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    );
  }

  Widget productDetails(ThemeData theme) {
    //title,rating,price of product
    return new Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 17.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Text(
                title,
                style: theme.textTheme.headline2,
              ),
              new Text(
                '\$' + price.toString(),
                style: theme.textTheme.headline2,
              )
            ],
          ),
          new Text(
            categoryTitle,
            style: theme.textTheme.bodyText1,
          ),
          new SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () => navigateToReviewDetail(context),
            child: Container(
              child: OpenFlutterProductRating(
                rating: rating,
                ratingCount: ratingCount,
                alignment: MainAxisAlignment.start,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void navigateToReviewDetail(BuildContext context) {
    //TODO change the product param when the screen has a dynamic behaviour
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ProductReviewRatingScreen(
        product: product.first,
      ),
    ));
  }
}

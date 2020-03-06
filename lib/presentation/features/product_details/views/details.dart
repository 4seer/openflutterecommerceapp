import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/fake_repositories/models/product.dart';
import 'package:openflutterecommerce/presentation/features/product_reviews/product_review_and_rating_screen.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

import '../product.dart';
import '../product_bloc.dart';
import '../product_state.dart';

class ProductDetailsView extends StatefulWidget {
  final Product product;
  final Function changeView;
  final List<Product> similarProducts;

  const ProductDetailsView(
      {Key key,
      @required this.product,
      @required this.changeView,
      @required this.similarProducts})
      : super(key: key);

  @override
  _ProductDetailsViewState createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  List<int> list = [1, 2, 3, 4, 5];
  Orientation orientation;
  bool favorite;

  @override
  void initState() {
    favorite = widget.product.favorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    final dividerTheme =
        Theme.of(context).copyWith(dividerColor: AppColors.darkGray);
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    var bloc = BlocProvider.of<ProductBloc>(context);
    return BlocListener(
        bloc: bloc,
        listener: (context, state) {
          if (state is ProductErrorState) {
            return Container(
                padding: EdgeInsets.all(AppSizes.sidePadding),
                child: Text('An error occured',
                    style: _theme.textTheme.headline3
                        .copyWith(color: _theme.errorColor)));
          }
          return Container();
        },
        child: BlocBuilder(
            bloc: bloc,
            builder: (BuildContext context, ProductState state) {
              if (state is ProductLoadedState) {
                return SingleChildScrollView(
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
                            itemBuilder: (context, index) => Image.asset(
                              'assets/images/products/shortdress.png',
                              width: deviceWidth * 0.75,
                              height: deviceHeight * 0.52,
                            ),
                            scrollDirection: Axis.horizontal,
                            itemCount: list.length,
                          ),
                        ),
                        Container(
                          //contains size button,color button and favourite button
                          margin: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              selectionOutlineButton(deviceWidth, 'Size',
                                  _showSelectSizeBottomSheet, bloc),
                              selectionOutlineButton(deviceWidth, 'Color',
                                  _showSelectColorBottomSheet, bloc),
                              OpenFlutterFavouriteButton(
                                favourite: favorite,
                                setFavourite: (() => {setFavourite(bloc)}),
                              ),
                            ],
                          ),
                        ),
                        productDetails(_theme),
                        //Function call for Product detail widget
                        Container(
                          margin: EdgeInsets.only(
                              left: 16.0, right: 16.0, bottom: 10.0),
                          child: Text(
                            widget.product.description,
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ),
                        Container(
                          width: deviceWidth,
                          margin: EdgeInsets.only(bottom: 13),
                          height: 90,
                          child: Center(
                            child: OpenFlutterButton(
                              title: 'ADD TO CART',
                              onPressed: (() =>
                                  {_showSelectSizeBottomSheet(context, bloc)}),
                              width: deviceWidth * 0.88,
                              height: 50,
                            ),
                          ),
                        ),
                        Theme(data: dividerTheme, child: Divider()),
                        OpenFlutterExpansionTile(
                          title: 'Shipping info',
                          //TODO: get this date from store settings
                          description: widget.product.description,
                        ),
                        Theme(data: dividerTheme, child: Divider()),
                        OpenFlutterExpansionTile(
                          title: 'Support',
                          //TODO: get this date from store settings
                          description: widget.product.description,
                        ),
                        Theme(data: dividerTheme, child: Divider()),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 16.0, right: 16.0, bottom: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'You can also like this',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                widget.similarProducts.length.toString() +
                                    ' items',
                                style: TextStyle(color: AppColors.lightGray),
                              )
                            ],
                          ),
                        ),
                        OpenFlutterProductListView(
                          width: deviceWidth,
                          products: widget.similarProducts,
                        )
                      ],
                    ),
                  ),
                ));
              }
              return Container();
            }));
  }

  void setFavourite(ProductBloc bloc) {
    if (!favorite) {
      bloc..add(ProductAddToFavEvent(widget.product.id));
    } else {
      bloc..add(ProductRemoveFromFavEvent(widget.product.id));
    }
    setState(() {
      favorite = !favorite;
    });
  }

  void _showSelectSizeBottomSheet(BuildContext context, ProductBloc bloc) {
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
                        children: widget.product.sizes
                            .map((String value) => InkWell(
                                  onTap: () => {
                                    bloc..add(ProductSetSizeEvent(size: value))
                                  },
                                  child: Container(
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
                    title: Text('Size info'),
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
                      title: 'ADD TO CART',
                      onPressed: (() => {
                            bloc..add(ProductAddToCartEvent(widget.product.id))
                          }),
                    ),
                  )
                ],
              ),
            ));
  } //modelBottomSheet for selecting size

  void _showSelectColorBottomSheet(BuildContext context,
      ProductBloc bloc) //modelBottomSheet for selecting color
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
                        children: widget.product.colors
                            .map((String value) => GestureDetector(
                                  onTap: () => (() => {
                                        bloc
                                          ..add(ProductSetColorEvent(
                                              color: value))
                                      }),
                                  child: Container(
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
                      title: 'ADD TO CART',
                      onPressed: (() => {
                            bloc..add(ProductAddToCartEvent(widget.product.id))
                          }),
                    ),
                  )
                ],
              ),
            ));
  }

  Widget selectionOutlineButton(
      var deviceWidth, String title, Function fun, ProductBloc bloc) {
    //select size and select color widget
    return OutlineButton(
      onPressed: () => fun(context, bloc),
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
    return Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 17.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                widget.product.title,
                style: theme.textTheme.headline2,
              ),
              Text(
                '\$' + widget.product.price.toString(),
                style: theme.textTheme.headline2,
              )
            ],
          ),
          Text(
            widget.product.categoryTitle,
            style: theme.textTheme.bodyText1,
          ),
          SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () => navigateToReviewDetail(context),
            child: Container(
              child: OpenFlutterProductRating(
                rating: widget.product.rating,
                ratingCount: widget.product.ratingCount,
                alignment: MainAxisAlignment.start,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void navigateToReviewDetail(BuildContext context) {
    if (widget.product.hasReviews()) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ProductReviewRatingScreen(
          product: widget.product,
        ),
      ));
    }
  }
}

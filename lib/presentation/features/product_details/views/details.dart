import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/routes.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/model/category.dart';
import 'package:openflutterecommerce/data/model/product.dart';
import 'package:openflutterecommerce/data/model/product_attribute.dart';
import 'package:openflutterecommerce/presentation/features/home/home.dart';
import 'package:openflutterecommerce/presentation/features/product_details/views/attribute_bottom_sheet.dart';
import 'package:openflutterecommerce/presentation/features/product_reviews/product_review_and_rating_screen.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

import '../product.dart';

class ProductDetailsView extends StatefulWidget {
  final Product product;
  final Function changeView;
  final ProductCategory category;
  final bool hasReviews;

  final List<Product> similarProducts;

  const ProductDetailsView(
      {Key key,
      @required this.product,
      @required this.changeView,
      @required this.similarProducts,
      this.category,
      this.hasReviews = false})
      : assert(product != null),
        super(key: key);

  @override
  _ProductDetailsViewState createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  Orientation orientation;
  bool favorite;
  ProductBloc bloc;

  @override
  void initState() {
    favorite = widget.product?.isFavorite ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    final dividerTheme =
        Theme.of(context).copyWith(dividerColor: AppColors.darkGray);
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    bloc = BlocProvider.of<ProductBloc>(context);
    return BlocListener(
        bloc: bloc,
        listener: (context, state) {
          if (state is ProductErrorState) {
            return Container(
                padding: EdgeInsets.all(AppSizes.sidePadding),
                child: Text('An error occured',
                    style: _theme.textTheme.headline4
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
                            itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.only(
                                    right: AppSizes.sidePadding),
                                child: Image.network(
                                    state.product.images[index].address)),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.product.images.length,
                          ),
                        ),
                        Container(
                          //contains size button,color button and favourite button
                          margin: EdgeInsets.all(16),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: (state.product.selectableAttributes !=
                                          null
                                      ? state.product.selectableAttributes
                                          .map((value) =>
                                              selectionOutlineButton(
                                                  deviceWidth,
                                                  value,
                                                  state.productAttributes
                                                          .selectedAttributes[
                                                      value]))
                                          .toList()
                                      : List<Widget>()) +
                                  [
                                    OpenFlutterFavouriteButton(
                                      favourite: favorite,
                                      setFavourite: () => {setFavourite(bloc)},
                                    )
                                  ]),
                        ),
                        productDetails(_theme),
                        //Function call for Product detail widget
                        Container(
                          margin: EdgeInsets.only(
                              left: 16.0, right: 16.0, bottom: 10.0),
                          child: Text(
                            widget.product.description ?? 'no details',
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
                              onPressed: () {
                                _addItemToCart(context, state);
                              },
                              width: deviceWidth * 0.88,
                              height: 50,
                            ),
                          ),
                        ),
                        Theme(data: dividerTheme, child: Divider()),
                        OpenFlutterExpansionTile(
                          title: 'Shipping info',
                          //TODO: get this date from store settings
                          description: 'detailed data about shipping options',
                        ),
                        Theme(data: dividerTheme, child: Divider()),
                        OpenFlutterExpansionTile(
                          title: 'Support',
                          //TODO: get this date from store settings
                          description: 'detailed data about support',
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
                          onFavoritesTap: ((Product product) => {
                                BlocProvider.of<HomeBloc>(context).add(
                                    HomeAddToFavoriteEvent(
                                        isFavorite: !product.isFavorite,
                                        product: product))
                              }),
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
      bloc.add(
          ProductAddToFavoritesEvent()); //TODO ask for real parameters if required
    } else {
      bloc.add(ProductRemoveFromFavoritesEvent());
    }
    setState(() {
      favorite = !favorite;
    });
  }

  void _showSelectAttributeBottomSheet(
      BuildContext context, ProductAttribute attribute,
      {Function onSelect, String selectedValue}) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(34), topRight: Radius.circular(34)),
        ),
        builder: (BuildContext context) => AttributeBottomSheet(
            productAttribute: attribute,
            selectedValue: selectedValue,
            onValueSelect: ((String value, ProductAttribute productAttribute) =>
                {
                  bloc..add(ProductSetAttributeEvent(value, productAttribute)),
                  Navigator.pop(context),
                  onSelect()
                })));
  } //modelBottomSheet for selecting size

  Widget selectionOutlineButton(var deviceWidth, ProductAttribute attribute,
      String alreadySelectedValue) {
    //select size and select color widget
    return OutlineButton(
      onPressed: () => _showSelectAttributeBottomSheet(context, attribute,
          selectedValue: alreadySelectedValue),
      child: Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              alreadySelectedValue ?? attribute.name,
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
                style: theme.textTheme.headline6,
              ),
              Text(
                '\$' + widget.product.price.toString(),
                style: theme.textTheme.headline6,
              )
            ],
          ),
          widget.category == null
              ? Container()
              : Text(
                  widget.category.name,
                  style: theme.textTheme.bodyText1,
                ),
          SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: widget.hasReviews
                ? () {
                    navigateToReviewDetail(context);
                  }
                : null,
            child: Container(
              child: OpenFlutterProductRating(
                rating: widget.product.averageRating,
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
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ProductReviewRatingScreen(
        product: widget.product,
      ),
    ));
  }

  void _addItemToCart(BuildContext context, ProductLoadedState state) async {
    if (state.productAttributes.selectedAttributes.length ==
        state.product.selectableAttributes.length) {
      BlocProvider.of<ProductBloc>(context).add(ProductAddToCartEvent());
      await Navigator.pushNamed(context, OpenFlutterEcommerceRoutes.cart);
    } else {
      for (int i = 0; i < state.product.selectableAttributes.length; i++) {
        final attribute = state.product.selectableAttributes[i];
        if (!state.productAttributes.selectedAttributes
            .containsKey(attribute)) {
          await _showSelectAttributeBottomSheet(context, attribute,
              onSelect: i == 0
                  ? (() => {
                        BlocProvider.of<ProductBloc>(context)
                            .add(ProductAddToCartEvent()),
                        Navigator.pushNamed(
                            context, OpenFlutterEcommerceRoutes.cart)
                      })
                  : null);
        }
      }
    }
  }
}

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/repos/models/product_cart.dart';

class OpenFlutterProductCartCard extends StatefulWidget {
  final ProductCart productCart;

  const OpenFlutterProductCartCard({Key key, this.productCart})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _OpenFlutterProductCartCardState();
}

class _OpenFlutterProductCartCardState
    extends State<OpenFlutterProductCartCard> {
  ThemeData _theme;
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Container(
        height: 120,
        child: Card(
          color: Colors.white,
          margin: EdgeInsets.only(bottom:16.0,top: 16.0),
          child: Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[_imageWidget, _listWidget],
          ),
        ));
  }

  Widget get _listWidget => Positioned(
      right: 10,
      left: 110,
      top: 10,
      bottom: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(widget.productCart.title,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Icon(
                  Icons.more_vert,
                  size: 14,
                ),
              ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Color:",
                style: _theme.textTheme.display1,
              ),
              Text(
                widget.productCart.color,
                style: _theme.textTheme.display2,
              ),
              SizedBox(
                width: 13,
              ),
              Text(
                "Size:",
                style: _theme.textTheme.display1,
              ),
              Text(
                widget.productCart.size,
                style: _theme.textTheme.display2,
              ),
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  height: 30,
                  child: FloatingActionButton(
                    heroTag: null,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.remove,
                      color: Colors.black,
                      size: 14,
                    ),
                  )),
              Text(
                "1",
                style: _theme.textTheme.display2,
              ),
              Container(
                  height: 30,
                  child: FloatingActionButton(
                    heroTag: null,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 14,
                    ),
                  )),
              Spacer(),
              Text(
                widget.productCart.price.toString() +
                    widget.productCart.currency,
                style: _theme.textTheme.display2,
              ),
            ],
          ),
        ],
      ));

  Widget get _imageWidget => Positioned(
        width: 100,
        left: 0.0,
        child: Image(
          image: AssetImage(widget.productCart.image),
          fit: BoxFit.scaleDown,
          width: 100,
        ),
      );
}

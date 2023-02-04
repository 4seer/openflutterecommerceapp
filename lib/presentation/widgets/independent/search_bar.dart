import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';

class OpenFlutterSearchBar extends StatefulWidget {
  final String searchKey;
  final Function(String) onChange;

  const OpenFlutterSearchBar({ required this.searchKey, required this.onChange}) ;

  @override
  _OpenFlutterSearchBarState createState() => _OpenFlutterSearchBarState();
}

class _OpenFlutterSearchBarState extends State<OpenFlutterSearchBar> {
  late TextEditingController _searchKeyController;

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    var width = MediaQuery.of(context).size.width;
    return Container(
        height: 50,
        width: width,
        alignment: Alignment.topLeft,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(23), border: Border.all(color: _theme.primaryColorLight)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(AppSizes.linePadding * 2),
              child: Icon(Icons.search, color: _theme.primaryColorLight),
            ),
            Container(
                height: 50,
                width: width - 90,
                child: TextField(
                    controller: _searchKeyController,
                    style: _theme.textTheme.headline2?.copyWith(color: _theme.primaryColorLight),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    )))
          ],
        ));
  }

  @override
  void initState() {
    _searchKeyController = TextEditingController(text: widget.searchKey);

    _searchKeyController.addListener(() {
      widget.onChange(_searchKeyController.text);
    });

    super.initState();
  }

  @override
  void dispose() {
    _searchKeyController?.dispose();
    super.dispose();
  }
}

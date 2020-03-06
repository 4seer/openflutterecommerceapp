// Screen Wrapper to navigate between views
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';

enum ViewChangeType { Start, Forward, Backward, Exact }

class OpenFlutterWrapperState<StatefullWidget> extends State {
  PageController _viewController;

  PageView getPageView(List<Widget> widgets) {
    return PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _viewController,
        children: widgets);
  }

  void changePage({@required ViewChangeType changeType, int index}) {
    switch (changeType) {
      case ViewChangeType.Forward:
        _viewController.nextPage(
            duration: Duration(milliseconds: 300), curve: Curves.elasticIn);
        break;
      case ViewChangeType.Backward:
        _viewController.previousPage(
            duration: Duration(milliseconds: 300), curve: Curves.elasticIn);
        break;
      case ViewChangeType.Start:
        _viewController.jumpToPage(0);
        break;
      case ViewChangeType.Exact:
        _viewController.jumpToPage(index);
        break;
    }
  }

  @override
  void initState() {
    _viewController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _viewController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    throw Exception('Build method should be implemented in child class');
  }
}

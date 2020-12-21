import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:twin_list_views/app/app_controller.dart';
import 'package:twin_list_views/app/twin_lists/vertical_list/section_model.dart';

import 'horizontal_menu_item.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({
    Key key,
    double horizontalMenuHeight = 40.0,
    @required double menuItemWidth,
    @required List<SectionModel> sections,
    @required ScrollController controller,
    @required AppController appController,
    Function({int selectedIndex}) onHorizontalMenuItemSelect,
  })  : _horizontalMenuHeight = horizontalMenuHeight,
        _menuItemWidth = menuItemWidth,
        _controller = controller,
        _onHorizontalMenuItemSelect = onHorizontalMenuItemSelect,
        _sections = sections,
        _appController = appController,
        super(key: key);

  final double _horizontalMenuHeight;
  final double _menuItemWidth;
  final ScrollController _controller;
  final Function({int selectedIndex}) _onHorizontalMenuItemSelect;
  final List<SectionModel> _sections;
  final AppController _appController;

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      height: _horizontalMenuHeight,
      child: SingleChildScrollView(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _sections.map((section) {
            return Container(
              width: _menuItemWidth,
              child: Observer(builder: (_) {
                return HorizontalMenuItem(
                  index: _sections.indexOf(section),
                  menuItemKey: section.menuItemKey,
                  title: section.horizontalMenuTitle,
                  onSelect: ({int selectedIndex}) {
                    _onHorizontalMenuItemSelect(selectedIndex: selectedIndex);
                  },
                  isActive: _appController.selectedIndex ==
                      _sections.indexOf(section),
                );
              }),
            );
          }).toList(),
        ),
      ),
    );
  }
}

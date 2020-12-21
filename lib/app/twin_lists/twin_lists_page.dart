import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'vertical_list/vertical_list.dart';

import '../app_controller.dart';
import 'horizontal_list/horizontal_list.dart';
import 'vertical_list/section_model.dart';

class TwinListsPage extends StatefulWidget {
  final List<SectionModel> sections;

  const TwinListsPage({Key key, this.sections}) : super(key: key);

  @override
  _TwinListsPageState createState() => _TwinListsPageState();
}

class _TwinListsPageState extends ModularState<TwinListsPage, AppController> {
  final ScrollController _verticalScroll = ScrollController();
  final ScrollController _horizontalScroll = ScrollController();
  final List<double> _initialVerticalPositions = [];
  final List<double> _initialHorizontalPositions = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _getVerticalPositions();
      _getHorizontalPositions();
      _verticalScroll.addListener(_addVerticalScrollListeners);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              HorizontalList(
                appController: controller,
                controller: _horizontalScroll,
                menuItemWidth: 80.0,
                sections: widget.sections,
                onHorizontalMenuItemSelect: ({int selectedIndex}) {
                  controller.selectIndex(index: selectedIndex);
                  // Scrollable.ensureVisible(
                  //   widget.sections[selectedIndex].sectionKey.currentContext,
                  //   duration: Duration(milliseconds: 1000),
                  // );
                  // _horizontalScroll.animateTo(
                  //   _initialHorizontalPositions[selectedIndex],
                  //   duration: Duration(milliseconds: 1000),
                  //   curve: Curves.linear,
                  // );
                  _verticalScroll.animateTo(
                    _initialVerticalPositions[selectedIndex] -
                        _initialVerticalPositions[0] +
                        1,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                },
              ),
              Expanded(
                child: VerticalSectionList(
                  sections: widget.sections,
                  controller: _verticalScroll,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Offset _getRenderBoxOffset({GlobalKey elementKey}) {
    final RenderBox renderBox = elementKey.currentContext.findRenderObject();
    return renderBox.localToGlobal(Offset.zero);
  }

  void _getVerticalPositions() {
    widget.sections.forEach((section) {
      _initialVerticalPositions
          .add(_getRenderBoxOffset(elementKey: section.sectionKey).distance);
    });
    print(_initialVerticalPositions);
  }

  void _getHorizontalPositions() {
    widget.sections.forEach((section) {
      _initialHorizontalPositions
          .add(_getRenderBoxOffset(elementKey: section.menuItemKey).distance);
    });
    print(_initialHorizontalPositions);
  }

  void _addVerticalScrollListeners() {
    final RenderBox menuItemRenderBox =
        widget.sections[0].menuItemKey.currentContext.findRenderObject();
    final Offset menuItemVerticalPosition =
        menuItemRenderBox.localToGlobal(Offset.zero);

    for (var i = 0; i < widget.sections.length; i++) {
      if (i == 0) {
        if (_verticalScroll.offset <
                (_initialVerticalPositions[i + 1] -
                    _initialVerticalPositions[0]) &&
            controller.selectedIndex != i) {
          print('section $i');
          controller.selectIndex(index: i);
        }
      } else if (i == widget.sections.length - 1) {
        if (_verticalScroll.offset >
                (_initialVerticalPositions[i] - _initialVerticalPositions[0]) &&
            controller.selectedIndex != i) {
          print('section $i');
          controller.selectIndex(index: i);
        }
      } else {
        if (_verticalScroll.offset <
                (_initialVerticalPositions[i + 1] -
                    _initialVerticalPositions[0]) &&
            _verticalScroll.offset >
                (_initialVerticalPositions[i] - _initialVerticalPositions[0]) &&
            controller.selectedIndex != i) {
          print('section $i');
          controller.selectIndex(index: i);
        }
      }
    }
  }
}

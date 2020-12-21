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
  // List<GlobalKey> _verticalKeys = [];
  // List<GlobalKey> _horizontalKeys = [];
  // List<double> _sectionsVerticalPositions = [];
  // List<double> _horizontalMenuItemsPositions = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // await _generateVerticalKeys();
      // await _getSectionsPositions();
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
                controller: _horizontalScroll,
                menuItemWidth: 80.0,
                sections: widget.sections,
                onHorizontalMenuItemSelect: ({int selectedIndex}) {
                  Scrollable.ensureVisible(
                    widget.sections[selectedIndex].sectionKey.currentContext,
                    duration: Duration(milliseconds: 1000),
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

  // Future<void> _getSectionsPositions() async {
  //   _sectionsVerticalPositions = List.generate(_verticalKeys.length, (index) {
  //     final RenderBox renderBox =
  //         _verticalKeys[index].currentContext.findRenderObject();
  //     return renderBox.localToGlobal(Offset.zero).dy;
  //   });
  // }

  void _addVerticalScrollListeners() {
    widget.sections.forEach((section) {});
  }
}

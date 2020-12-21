import 'package:flutter/material.dart';

import 'section.dart';
import 'section_model.dart';

class VerticalSectionList extends StatelessWidget {
  const VerticalSectionList({
    Key key,
    List<SectionModel> sections,
    // List<Widget> sectionHeaders,
    // @required List<GlobalKey> verticalKeys,
    @required ScrollController controller,
  })  : _sections = sections,
        // _sectionHeaders = sectionHeaders,
        _controller = controller,
        // _verticalKeys = verticalKeys,
        super(key: key);

  // final List<Widget> _sectionHeaders;
  final ScrollController _controller;
  // final List<GlobalKey> _verticalKeys;
  final List<SectionModel> _sections;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: _sections.map((e) {
            return Section(
              section: e,
            );
          }).toList(),
        ),
        // ListView.builder(
        //   padding: const EdgeInsets.all(0.0),
        //   itemCount: _sections.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     return Container(
        //       decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        //       child: Section(
        //         // itemKey: _verticalKeys[index],
        //         // sectionIndex: index,
        //         // sectionHeader: _sectionHeaders[index],
        //         // items: mockedItems,
        //         section: _sections[index],
        //       ),
        //     );
        //   },
        // ),
      ),
    );
  }
}

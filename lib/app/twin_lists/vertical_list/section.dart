// import 'package:flutter/material.dart';

// import 'section_model.dart';

// class Section extends StatelessWidget {
//   const Section({
//     Key key,
//     SectionModel section,
//     GlobalKey itemKey,
//     // int sectionIndex,
//     List<Widget> items = const [Text('Section')],
//     Widget sectionHeader,
//   })  :
//         // _itemKey = itemKey,
//         // _sectionIndex = sectionIndex,
//         // _items = items,
//         // _sectionHeader = sectionHeader,
//         _section = section,
//         super(key: key);

//   // final int _sectionIndex;
//   // final List<Widget> _items;
//   // final Widget _sectionHeader;
//   // final GlobalKey _itemKey;
//   final SectionModel _section;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       key: _section.sectionKey,
//       title: Column(
//         children: [
//           _section.sectionHeader,
//           ..._section.sectionItems,
//         ],
//       ),
//     );
//   }
// }

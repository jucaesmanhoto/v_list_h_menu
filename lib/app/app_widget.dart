import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:twin_list_views/app/twin_lists/twin_lists_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TwinListsPage(),
      // onGenerateRoute: Modular.generateRoute,
      // navigatorKey: Modular.navigatorKey,
      // initialRoute: Modular.initialRoute,
    );
  }
}

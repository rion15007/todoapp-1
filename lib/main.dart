import 'package:flutter/material.dart';
import 'page1.dart';
import 'page2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late PageController controller;

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.dangerous),
        title: const Text('AppBar'),
      ),
      body: Column(
        children: [
          Text('dataA', textScaleFactor: 4),
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (pageIdx) => controller.animateToPage(pageIdx,
                  duration: const Duration(seconds: 1),
                  curve: Curves.elasticIn),
              children: <Widget>[
                page1(),
                page2(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

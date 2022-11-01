import 'package:flutter/material.dart';

class ViewResultPage extends StatefulWidget {
  const ViewResultPage({Key? key}) : super(key: key);

  @override
  State<ViewResultPage> createState() => _ViewResultPageState();
}

class _ViewResultPageState extends State<ViewResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VOTE RESULT'),
      ),

    );
  }
}

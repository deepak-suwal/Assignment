import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/util/keyboard_util.dart';

class BaseView extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget>? actions;

  const BaseView({
    super.key,
    required this.title,
    required this.body,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: actions,
          centerTitle: false,
        ),
        backgroundColor: Colors.white,
        body: body,
      ),
    );
  }
}

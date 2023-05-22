// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  final AppBar? appBar;
  final Widget? floatingActionButton;
  final Widget child;

  const BaseLayout({
    Key? key,
    this.appBar,
    this.floatingActionButton,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      body: SafeArea(child: child),
    );
  }
}

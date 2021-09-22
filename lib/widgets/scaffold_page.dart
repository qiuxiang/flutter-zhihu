import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ScaffoldPage extends StatelessWidget {
  final List<Widget> children;
  final List<Widget> slivers;
  final ScrollController? controller;
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? bottom;
  final Color? backgroundColor;

  const ScaffoldPage({
    this.children = const [],
    this.slivers = const [],
    this.controller,
    this.appBar,
    this.body,
    this.bottom,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    if (children.isNotEmpty) {
      slivers.add(SliverList(delegate: SliverChildListDelegate(children)));
    }
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        systemNavigationBarIconBrightness:
            context.isDarkMode ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: context.theme.appBarTheme.backgroundColor,
      ),
      child: Scaffold(
        appBar: appBar,
        body:
            body ?? CustomScrollView(controller: controller, slivers: slivers),
        bottomNavigationBar: bottom,
        backgroundColor: backgroundColor,
      ),
    );
  }
}

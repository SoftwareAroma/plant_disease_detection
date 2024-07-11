import 'package:flutter/material.dart';
import 'package:plant_disease_detection/index.dart';

class MainLayout extends StatefulWidget {
  final Widget child;
  final bool showSideBar;

  const MainLayout({
    super.key,
    required this.child,
    this.showSideBar = true,
  });

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            widget.child,
            const SideBar(),
          ],
        ),
      ),
    );
  }
}

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar(
      {super.key, required this.pageIndex, required this.onTap});

  final int pageIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: pageIndex,
      backgroundColor: Theme.of(context).primaryColor,
      color: Theme.of(context).primaryColorDark,
      animationDuration: const Duration(milliseconds: 250),
      height: 75.0,
      animationCurve: Curves.easeOutSine,
      items: const <Widget>[
        Icon(Icons.view_agenda_sharp, size: 30),
        Icon(Icons.info, size: 30),
        Icon(Icons.qr_code, size: 30),
      ],
      onTap: onTap,
    );
  }
}

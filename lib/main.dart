import 'package:flutter/material.dart';

// pub.dev libraries
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// splash screen
import 'package:hd2_app/splash_screen.dart';

// pages
import 'package:hd2_app/pages/agenda_page.dart';
import 'package:hd2_app/pages/information_page.dart';
import 'package:hd2_app/pages/qr_code_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(brightness: Brightness.dark),
      home: const MyHomePage(title: 'HackDearborn 2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Builder(
            builder: (context) {
              switch (_pageIndex) {
                case 0:
                  return const AgendaPage();
                case 1:
                  return const InformationPage();
                default:
                  return const QrCodePage();
              }
            },
          ),
          bottomNavigationBar: CurvedNavigationBar(
            index: _pageIndex,
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
            onTap: (index) {
              setState(() {
                _pageIndex = index;
              });
            },
          ),
        ),
        const SplashScreen()
      ],
    );
  }
}

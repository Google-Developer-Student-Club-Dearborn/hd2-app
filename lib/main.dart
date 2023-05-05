import 'package:flutter/material.dart';

// pub.dev libraries
import 'package:hd2_app/components/bottom_navbar.dart';

// splash screen
import 'package:hd2_app/components/splash_screen.dart';

// pages
import 'package:hd2_app/pages/agenda_page/agenda_page.dart';
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
      title: 'HackDearborn 2',
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
              elevation: 0,
              // backgroundColor: Colors.black,
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
            bottomNavigationBar: CustomBottomNavbar(
              pageIndex: _pageIndex,
              onTap: (index) {
                setState(() {
                  _pageIndex = index;
                });
              },
            )),
        const SplashScreen()
      ],
    );
  }
}

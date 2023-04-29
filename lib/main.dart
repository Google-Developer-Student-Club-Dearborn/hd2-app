import 'package:flutter/material.dart';

// libraries
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          brightness: Brightness.dark),
      home: const MyHomePage(title: 'HackDearborn 2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  int _pageIndex = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
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
          // floatingActionButton: FloatingActionButton(
          //   onPressed: _incrementCounter,
          //   tooltip: 'Increment',
          //   child: const Icon(Icons.add),
          // ), // This trailing comma makes auto-formatting nicer for build methods.
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
              //Handle button tap
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

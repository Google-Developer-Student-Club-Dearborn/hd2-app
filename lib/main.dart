import 'package:flutter/material.dart';
import 'package:hd2_app/pages/agenda_page/eventexpand.dart';
import 'package:provider/provider.dart';

// pub.dev libraries
import 'package:hd2_app/components/bottom_navbar.dart';

import 'package:screen_brightness/screen_brightness.dart';

// splash screen
import 'package:hd2_app/components/splash_screen.dart';

// pages
import 'package:hd2_app/pages/agenda_page/agenda_page.dart';
import 'package:hd2_app/pages/information_page.dart';
import 'package:hd2_app/pages/agenda_page/navbar.dart';
import 'package:hd2_app/pages/qr_code_page/qr_code_page.dart';
import 'package:hd2_app/services/notification/NotificationService.dart';
import 'package:hd2_app/pages/notifications_page/NotificationsPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HDNotificationService.init(initScheduled: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

    HDNotificationService.init(
        initScheduled: true, context: context, navigatorKey: navigatorKey);
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'HackDearborn 2',
        theme: ThemeData(brightness: Brightness.dark),
        home: const MyHomePage(title: 'HackDearborn 2'),
        navigatorKey: navigatorKey,
        routes: {
          '/qr_code': (context) => QrCodePage(),
          '/second_route': (context) =>
              EventDetails(appointments: [], selectedIndex: 0),
        },
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  //TODO: store NavBar settings here
  FilterSettings _filterSettings = FilterSettings();
  int _amountOfButtons = 3;
  int _selekshun = 0;
  String _userQRString = "";

  String get userQRString => _userQRString;

  set userQRString(String userString) {
    _userQRString = userString;
    notifyListeners();
  }

  FilterSettings get filterSettings => _filterSettings;

  set filterSettings(FilterSettings value) {
    _filterSettings = value;
    notifyListeners();
  }

  List<String> get allTrues => _filterSettings.allTrues;

  set allTrues(List<String> newAllTrues) {
    _filterSettings.allTrues = newAllTrues;
    notifyListeners();
  }

  int get amountOfButtons => _amountOfButtons;

  set amountOfButtons(int newValue) {
    _amountOfButtons = newValue;
    notifyListeners();
  }

  int get selection => _selekshun;

  set selection(int newValue) {
    _selekshun = newValue;
    notifyListeners();
  }

  void setSelection(int val) {
    _selekshun = val;
    notifyListeners();
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

  void _onPageChange(int pageIndex) {
    final qrDataProvider = Provider.of<MyAppState>(context, listen: false);
    setState(() {
      _pageIndex = pageIndex;
    });
    bool isQrCodePage = (pageIndex == 2 && qrDataProvider._userQRString != "");
    if (isQrCodePage) {
      _setMaxBrightness();
    } else {
      _resetBrightness();
    }
  }

  void _setMaxBrightness() {
    double brightness = 1.0;
    ScreenBrightness().setScreenBrightness(brightness);
  }

  void _resetBrightness() {
    ScreenBrightness().resetScreenBrightness();
  }

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
                _onPageChange(index);
              },
            )),
        const SplashScreen()
      ],
    );
  }
}

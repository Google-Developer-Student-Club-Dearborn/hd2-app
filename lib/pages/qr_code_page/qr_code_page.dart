import 'package:flutter/material.dart';
import 'package:hd2_app/models/hdnotification.dart';
import 'package:hd2_app/services/hdnotification_service.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:hd2_app/pages/qr_code_page/inputRow.dart';
import 'package:hd2_app/main.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QrCodePage extends StatefulWidget {
  const QrCodePage({Key? key}) : super(key: key);

  @override
  _QrCodePageState createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {
  String userQRString = "";

  @override
  void initState() {
    super.initState();
    loadUserQRStringFromSharedPreferences();
  }

  Future<void> loadUserQRStringFromSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.clear();
    setState(() {
      userQRString = prefs.getString('userQRString') ?? "";
    });
  }

  Future<void> saveStringToSharedPreferences(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userQRString', value);
  }

  @override
  Widget build(BuildContext context) {
    final qrDataProvider = Provider.of<MyAppState>(context);
    // userQRString = qrDataProvider.userQRString;
    loadUserQRStringFromSharedPreferences();
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (userQRString != "")
                Column(
                  children: [
                    Text("Using: $userQRString"),
                    QrImageView(
                      data: userQRString,
                      version: QrVersions.auto,
                      size: 300.0,
                      padding: const EdgeInsets.all(10.0),
                      errorCorrectionLevel: QrErrorCorrectLevel.H,
                      backgroundColor: Colors.white,
                      gapless: true,
                      errorStateBuilder: (cxt, err) {
                        return const Center(
                          child: Text(
                            "Uh oh! Something went wrong...",
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff007aff),
                          ),
                          onPressed: () {
                            qrDataProvider.userQRString = "";
                            saveStringToSharedPreferences("");
                            setState(() {
                              userQRString = "";
                            });
                          },
                          child: const Text("Clear"),
                        )
                      ],
                    ),
                  ],
                ),
              const SizedBox(height: 50),
              if (userQRString == "") const InputRow(),
            ],
          ),
        ),
      ),
    );
  }
}

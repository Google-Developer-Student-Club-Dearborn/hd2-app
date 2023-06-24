import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:hd2_app/pages/qr_code_page/inputRow.dart';
import 'package:hd2_app/main.dart';
import 'package:provider/provider.dart';

class QrCodePage extends StatefulWidget {
  const QrCodePage({Key? key}) : super(key: key);

  @override
  _QrCodePageState createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {
  String userQRString = "";

  @override
  Widget build(BuildContext context) {
    final qrDataProvider = Provider.of<MyAppState>(context);
    userQRString = qrDataProvider.userQRString;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (userQRString != "")
                Column(
                  children: [
                    Text("Using: $userQRString"),
                    QrImage(
                      data: userQRString, // need to fetch this from some server
                      version: QrVersions.auto,
                      size: 300.0,
                      padding: const EdgeInsets.all(10.0),
                      errorCorrectionLevel: QrErrorCorrectLevel.H,
                      foregroundColor: Colors.black,
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

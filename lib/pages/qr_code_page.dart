import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodePage extends StatelessWidget {
  const QrCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: QrImage(
            data:
                "https://www.hackdearborn.org", //need to fetch this from some server
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
            }),
      ),
    );
  }
}

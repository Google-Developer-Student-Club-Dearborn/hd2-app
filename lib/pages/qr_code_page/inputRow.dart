import 'package:flutter/material.dart';
import 'package:hd2_app/main.dart';
import 'package:provider/provider.dart';

class InputRow extends StatefulWidget {
  const InputRow({super.key});

  @override
  State<InputRow> createState() => _InputRowState();
}

class _InputRowState extends State<InputRow> {
  final textController = TextEditingController();
  final focusNode = FocusNode();
  bool showError = false;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        setState(() {
          showError = !isValidInput(textController.text);
        });
      }
    });
  }

  bool isValidInput(String input) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    final isEmail = emailRegex.hasMatch(input);
    final isPhone = int.tryParse(input) != null && input.length == 10;
    return isEmail || isPhone;
  }

  @override
  Widget build(BuildContext context) {
    final qrSettingsProvider = MyApp.of(context);
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Email/Phone #:',
              errorText: showError ? 'Invalid input' : null,
            ),
            controller: textController,
            focusNode: focusNode,
          ),
        ),
        const SizedBox(width: 10),
        TextButton(
          onPressed: () {
            setState(() {
              showError = !isValidInput(textController.text);
            });
            if (!showError) {
              qrSettingsProvider.userQRString = textController.text;
            }
          },
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xffff66c4)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: const BorderSide(color: Color(0xffff66c4)),
              ),
            ),
          ),
          child: const Text(
            'Generate',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    );
  }
}

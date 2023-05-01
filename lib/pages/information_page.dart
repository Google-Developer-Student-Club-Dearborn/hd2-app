import 'package:flutter/material.dart';
import 'package:dismissible_page/dismissible_page.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
        child: Card(
            margin: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 8.0),
            elevation: 4.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            clipBehavior: Clip.antiAlias,
            child: Hero(
              tag: "tag1",
              child: Image.asset(
                "assets/test.jpg",
                fit: BoxFit.cover,
              ),
            )),
        onTap: () {
          context.pushTransparentRoute(DismissiblePage(
            onDismissed: () {
              Navigator.of(context).pop();
            },
            direction: DismissiblePageDismissDirection.down,
            isFullScreen: false,
            child: Hero(
              tag: 'tag1',
              child: Image.asset(
                "assets/test.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ));
        },
      )
    ]);
  }
}

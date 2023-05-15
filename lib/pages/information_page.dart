import 'package:flutter/material.dart';
import 'package:dismissible_page/dismissible_page.dart';

const fiveParagraphLorem =
    '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed elementum tempus egestas sed. Ipsum dolor sit amet consectetur adipiscing elit duis tristique sollicitudin. Habitant morbi tristique senectus et netus. In pellentesque massa placerat duis ultricies lacus sed turpis tincidunt. Tempor commodo ullamcorper a lacus vestibulum sed. Imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper. Tempor id eu nisl nunc mi ipsum faucibus vitae. A erat nam at lectus urna duis convallis. Dolor sit amet consectetur adipiscing elit. Magna ac placerat vestibulum lectus mauris ultrices eros. Lacus vestibulum sed arcu non odio euismod. Feugiat in ante metus dictum at tempor commodo. Eros donec ac odio tempor.

Malesuada proin libero nunc consequat interdum varius sit amet mattis. Pharetra pharetra massa massa ultricies mi quis hendrerit dolor magna. Sed euismod nisi porta lorem mollis aliquam ut porttitor. In cursus turpis massa tincidunt dui. Ac feugiat sed lectus vestibulum mattis ullamcorper velit sed. Aliquam ultrices sagittis orci a scelerisque purus semper eget. Euismod quis viverra nibh cras pulvinar mattis. Elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique senectus. Semper viverra nam libero justo laoreet sit amet cursus. Neque volutpat ac tincidunt vitae semper. Mauris augue neque gravida in fermentum et sollicitudin ac orci. Et ligula ullamcorper malesuada proin libero. Ut sem nulla pharetra diam sit. A arcu cursus vitae congue mauris. Id nibh tortor id aliquet lectus proin nibh. Gravida neque convallis a cras semper auctor neque vitae tempus. Cursus vitae congue mauris rhoncus. Eleifend donec pretium vulputate sapien nec sagittis aliquam malesuada bibendum. Sit amet consectetur adipiscing elit ut aliquam purus sit amet. Porttitor massa id neque aliquam vestibulum morbi blandit.

Et ultrices neque ornare aenean euismod elementum. Sit amet consectetur adipiscing elit duis tristique sollicitudin nibh sit. Suspendisse in est ante in nibh. Rhoncus aenean vel elit scelerisque mauris pellentesque pulvinar pellentesque. Lorem ipsum dolor sit amet consectetur adipiscing elit ut. Non sodales neque sodales ut etiam sit. In metus vulputate eu scelerisque felis imperdiet proin. Bibendum arcu vitae elementum curabitur vitae nunc sed velit. Ut ornare lectus sit amet est placerat in egestas erat. Turpis egestas maecenas pharetra convallis posuere morbi. Facilisi etiam dignissim diam quis enim lobortis scelerisque fermentum dui. Rhoncus aenean vel elit scelerisque mauris. Auctor eu augue ut lectus arcu bibendum at varius. Quam viverra orci sagittis eu volutpat odio facilisis mauris sit. Velit sed ullamcorper morbi tincidunt ornare massa eget. Imperdiet massa tincidunt nunc pulvinar sapien. Morbi tristique senectus et netus et malesuada. Odio aenean sed adipiscing diam donec adipiscing.

Netus et malesuada fames ac turpis egestas. Iaculis nunc sed augue lacus viverra. Sit amet facilisis magna etiam tempor orci eu lobortis elementum. Mattis enim ut tellus elementum sagittis. Quis ipsum suspendisse ultrices gravida dictum fusce. Nullam vehicula ipsum a arcu cursus. Sed turpis tincidunt id aliquet risus feugiat in ante. Dignissim sodales ut eu sem. Quam viverra orci sagittis eu volutpat odio facilisis mauris sit. Fermentum posuere urna nec tincidunt praesent. Praesent tristique magna sit amet purus gravida quis blandit turpis. Pretium vulputate sapien nec sagittis. Nisi scelerisque eu ultrices vitae. Accumsan lacus vel facilisis volutpat est velit. Adipiscing vitae proin sagittis nisl rhoncus. Eleifend mi in nulla posuere sollicitudin aliquam ultrices sagittis.

Magnis dis parturient montes nascetur ridiculus mus mauris. A lacus vestibulum sed arcu non odio euismod. Pulvinar sapien et ligula ullamcorper malesuada proin libero nunc consequat. Suspendisse interdum consectetur libero id faucibus. Nam at lectus urna duis convallis convallis tellus. Massa sed elementum tempus egestas sed. Lorem ipsum dolor sit amet. Adipiscing bibendum est ultricies integer quis auctor. Proin fermentum leo vel orci porta non pulvinar. Iaculis eu non diam phasellus vestibulum lorem sed risus. Mattis molestie a iaculis at erat pellentesque adipiscing commodo elit. Sodales ut etiam sit amet nisl purus. Sed enim ut sem viverra aliquet. Tristique risus nec feugiat in fermentum posuere urna nec tincidunt. Urna porttitor rhoncus dolor purus non enim. Quisque id diam vel quam elementum. Id aliquet risus feugiat in ante metus dictum.''';

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: "tag1",
                  child: Image.asset(
                    "assets/test.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Hero(
                    tag: "tag2",
                    child: Text(
                      "Square Apple",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                )
              ],
            )),
        onTap: () {
          context.pushTransparentRoute(DismissiblePage(
            onDismissed: () {
              Navigator.of(context).pop();
            },
            direction: DismissiblePageDismissDirection.down,
            isFullScreen: false,
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Hero(
                      tag: 'tag1',
                      child: Image.asset(
                        "assets/test.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Hero(
                        tag: "tag2",
                        child: Text(
                          "Square Apple",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(fiveParagraphLorem),
                    )
                  ],
                ),
              ),
            ),
          ));
        },
      )
    ]);
  }
}

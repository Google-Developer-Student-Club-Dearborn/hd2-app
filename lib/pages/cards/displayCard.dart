import 'package:flutter/material.dart';

class DisplayCard extends StatelessWidget {
  const DisplayCard({
    super.key,
    required this.onTap,
    required this.image,
    required this.data,
    required this.heroTag,
    required this.heroText,
  });

  final VoidCallback onTap;
  final String image;
  final String data;
  final String heroTag;
  final String heroText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 8.0),
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: heroTag,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Hero(
                tag: heroText,
                child: Text(
                  data,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

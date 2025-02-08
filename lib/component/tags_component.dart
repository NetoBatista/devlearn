import 'package:flutter/material.dart';

class TagsComponent extends StatelessWidget {
  final List<String> tags;
  const TagsComponent({
    required this.tags,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: tags.map(
          (String tag) {
            return Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                tag,
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

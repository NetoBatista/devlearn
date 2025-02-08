import 'package:flutter/material.dart';

class DefaultBodyComponent extends StatelessWidget {
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final List<Widget> children;
  final ScrollController? scrollController;
  final MainAxisSize? mainAxisSize;
  final bool spaceEndPageDefault;
  const DefaultBodyComponent({
    required this.children,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.scrollController,
    this.mainAxisSize,
    this.spaceEndPageDefault = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          mainAxisSize: mainAxisSize ?? MainAxisSize.max,
          spacing: 8,
          children: children,
        ),
      ),
    );
  }
}

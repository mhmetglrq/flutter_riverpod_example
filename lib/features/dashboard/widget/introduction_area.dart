import 'package:flutter/material.dart';
import 'package:flutter_riverpod_example/config/extension/context_extension.dart';

class IntroductionArea extends StatelessWidget {
  const IntroductionArea({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Welcome Back $name 👋',
          style: context.textTheme.labelMedium?.copyWith(
            fontSize: context.dynamicHeight(0.015),
          ),
        ),
        Text(
          'Book your Favorite Movie!',
          style: context.textTheme.labelMedium?.copyWith(
            fontSize: context.dynamicHeight(0.016),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod_example/config/extension/context_extension.dart';

class AlignedTitle extends StatelessWidget {
  const AlignedTitle({
    super.key,
    required this.title,
    required this.alignment,
  });
  final String title;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingVerticalLow,
      child: Align(
        alignment: alignment,
        child: Text(
          title,
          style: context.textTheme.labelMedium?.copyWith(
            fontSize: context.dynamicHeight(0.025),
          ),
        ),
      ),
    );
  }
}

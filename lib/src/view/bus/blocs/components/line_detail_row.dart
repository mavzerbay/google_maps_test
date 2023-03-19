import 'package:flutter/material.dart';

import '../../../../core/init/extensions/context.extension.dart';

class LineDetailRow extends StatelessWidget {
  const LineDetailRow({
    Key? key,
    required this.title,
    this.value,
  }) : super(key: key);

  final String title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return value != null && value!.isNotEmpty
        ? Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: context.textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  value!,
                  style: context.textTheme.labelLarge,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/constants/app_colors.dart';
import 'package:flutter_assignment/core/util/extension.dart';
import 'package:styled_widget/styled_widget.dart';

class VideoSourceWidget extends StatelessWidget {
  final int sourceType;

  const VideoSourceWidget({
    super.key,
    required this.sourceType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 22,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
              color: sourceType == 0 ? youTubeBgColor : fbBgColor,
              borderRadius: const BorderRadius.all(Radius.circular(16))),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                sourceType == 0
                    ? CupertinoIcons.play_rectangle_fill
                    : Icons.facebook,
                size: 12,
                color: Colors.white,
              ),
              4.horizontalSpace,
              Text(
                sourceType == 0 ? 'Youtube' : 'Facebook',
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
        4.horizontalSpace,
        Text(
          '1 hour ago',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodySmall,
        ).alignment(Alignment.centerRight).expanded(flex: 2),
      ],
    );
  }
}

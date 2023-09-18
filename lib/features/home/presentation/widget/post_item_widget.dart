import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/constants/app_colors.dart';
import 'package:flutter_assignment/core/util/extension.dart';
import 'package:flutter_assignment/features/home/presentation/widget/video_player_widget.dart';
import 'package:flutter_assignment/features/home/presentation/widget/video_source_widget.dart';
import '../../../../core/routes/app_router.gr.dart';
import '../../data/model/post_model.dart';

class PostItemWidget extends StatefulWidget {
  final PostModel postModel;
  final int sourceType;

  const PostItemWidget({
    super.key,
    required this.postModel,
    required this.sourceType,
  });

  @override
  State<PostItemWidget> createState() => _PostItemWidgetState();
}

class _PostItemWidgetState extends State<PostItemWidget> {
  late VideoPlayerController controller;

  @override
  void initState() {
    controller =
        VideoPlayerController.networkUrl(Uri.parse(widget.postModel.videoUrl));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.pause();
        context.router.push(PostDetailRoute(
            postModel: widget.postModel, sourceType: widget.sourceType));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(color: borderColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.postModel.title?.capitalizeFirst ?? 'n/a',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline),
            ),
            Column(
              children: [
                10.verticalSpace,
                VideoSourceWidget(sourceType: widget.sourceType),
                10.verticalSpace,
                VideoPlayerWidget(
                  videoUrl: widget.postModel.videoUrl,
                  thumbnail: widget.postModel.thumbnail,
                  controller: controller,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/util/extension.dart';
import 'package:flutter_assignment/core/widgets/base_view.dart';
import 'package:flutter_assignment/core/widgets/loading_widget.dart';
import 'package:flutter_assignment/features/home/data/model/post_model.dart';
import 'package:styled_widget/styled_widget.dart';

import '../widget/video_source_widget.dart';

@RoutePage()
class PostDetailPage extends StatefulWidget {
  final PostModel postModel;
  final int sourceType;

  const PostDetailPage(
      {super.key, required this.postModel, required this.sourceType});

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.postModel.videoUrl))
          ..initialize().then((_) {
            setState(() {});
          });
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: videoPlayerController,
      customVideoPlayerSettings: CustomVideoPlayerSettings(
        thumbnailWidget: CachedNetworkImage(
          imageUrl: widget.postModel.thumbnail,
          fit: BoxFit.fitWidth,
        ),
        settingsButton: const SizedBox(),
        alwaysShowThumbnailOnVideoPaused: true,
        enterFullscreenButton: const Icon(
          Icons.fullscreen,
          color: Colors.white,
        ),
        exitFullscreenButton: const Icon(
          Icons.fullscreen_exit,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _customVideoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Post',
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.share),
        )
      ],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          videoPlayerController.value.isInitialized
              ? CustomVideoPlayer(
                  customVideoPlayerController: _customVideoPlayerController,
                )
              : const LoadingWidget(),
          ListView(
            padding: const EdgeInsets.all(16),
            children: [
              VideoSourceWidget(sourceType: widget.sourceType),
              8.verticalSpace,
              Text(
                widget.postModel.title?.capitalizeFirst ?? 'n/a',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              16.verticalSpace,
              Text(
                widget.postModel.body!.capitalizeFirst,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ).expanded(),
        ],
      ),
    );
  }
}

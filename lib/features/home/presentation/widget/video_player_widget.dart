import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/constants/app_colors.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final String thumbnail;
  final VideoPlayerController controller;

  const VideoPlayerWidget({
    super.key,
    required this.videoUrl,
    required this.thumbnail,
    required this.controller,
  });

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    widget.controller.initialize().then((_) {
      setState(() {});
      widget.controller.addListener(() {
        if (widget.controller.value.isPlaying) {
          setState(() {
            _isPlaying = true;
          });
        } else if (!widget.controller.value.isPlaying &&
            widget.controller.value.position ==
                widget.controller.value.duration) {
          setState(() {
            _isPlaying = false;
          });
        } else {
          setState(() {
            _isPlaying = false;
          });
        }
      });
    });
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 124,
          child: _isPlaying
              ? VideoPlayer(widget.controller)
              : CachedNetworkImage(
                  imageUrl: widget.thumbnail,
                  fit: BoxFit.cover,
                ),
        ),
        Positioned.fill(
          child: InkWell(
            onTap: () {
              setState(() {
                _isPlaying
                    ? widget.controller.pause()
                    : widget.controller.play();
              });
            },
            child: CircleAvatar(
              radius: 27,
              backgroundColor: Colors.white,
              child: Icon(
                _isPlaying ? Icons.pause : Icons.play_arrow,
                color: playButtonColor,
              ),
            ).alignment(Alignment.center),
          ),
        )
      ],
    );
  }
}

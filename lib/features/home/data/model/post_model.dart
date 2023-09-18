import 'dart:math';

import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;
  final String thumbnail;
  final String videoUrl;

  PostModel({
    this.userId,
    this.id,
    this.title,
    this.body,
    this.thumbnail =
        'https://pic.pikbest.com/best/video_preview_img/1912/1466809.jpg!sw800',
    this.videoUrl = 'https://pic.pikbest.com/18/34/76/56R888piCFHq.mp4',
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}

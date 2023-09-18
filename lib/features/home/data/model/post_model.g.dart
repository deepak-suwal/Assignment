// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      userId: json['userId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      thumbnail: json['thumbnail'] as String? ??
          'https://pic.pikbest.com/best/video_preview_img/1912/1466809.jpg!sw800',
      videoUrl: json['videoUrl'] as String? ??
          'https://pic.pikbest.com/18/34/76/56R888piCFHq.mp4',
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'thumbnail': instance.thumbnail,
      'videoUrl': instance.videoUrl,
    };

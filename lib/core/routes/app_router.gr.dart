// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:flutter_assignment/features/home/data/model/post_model.dart'
    as _i5;
import 'package:flutter_assignment/features/home/presentation/pages/home_page.dart'
    as _i1;
import 'package:flutter_assignment/features/home/presentation/pages/post_detail_page.dart'
    as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    PostDetailRoute.name: (routeData) {
      final args = routeData.argsAs<PostDetailRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.PostDetailPage(
          key: args.key,
          postModel: args.postModel,
          sourceType: args.sourceType,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PostDetailPage]
class PostDetailRoute extends _i3.PageRouteInfo<PostDetailRouteArgs> {
  PostDetailRoute({
    _i4.Key? key,
    required _i5.PostModel postModel,
    required int sourceType,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          PostDetailRoute.name,
          args: PostDetailRouteArgs(
            key: key,
            postModel: postModel,
            sourceType: sourceType,
          ),
          initialChildren: children,
        );

  static const String name = 'PostDetailRoute';

  static const _i3.PageInfo<PostDetailRouteArgs> page =
      _i3.PageInfo<PostDetailRouteArgs>(name);
}

class PostDetailRouteArgs {
  const PostDetailRouteArgs({
    this.key,
    required this.postModel,
    required this.sourceType,
  });

  final _i4.Key? key;

  final _i5.PostModel postModel;

  final int sourceType;

  @override
  String toString() {
    return 'PostDetailRouteArgs{key: $key, postModel: $postModel, sourceType: $sourceType}';
  }
}

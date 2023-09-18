import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/constants/strings.dart';
import 'package:flutter_assignment/core/util/extension.dart';
import 'package:flutter_assignment/core/widgets/base_view.dart';
import 'package:flutter_assignment/features/home/presentation/widget/post_list_widget.dart';
import 'package:styled_widget/styled_widget.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: video,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.share),
        )
      ],
      body: Padding(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 16,
        ),
        child: DefaultTabController(
          length: tabBarLabel.length,
          child: Column(
            children: [
              Material(
                elevation: 8,
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.only(bottom: 4),
                  child: TabBar(
                    tabs: List.generate(
                      tabBarLabel.length,
                      (index) => Tab(
                        text: tabBarLabel[index],
                      ),
                    ),
                  ),
                ),
              ),
              8.verticalSpace,
              TabBarView(
                children: List.generate(
                  tabBarLabel.length,
                  (index) => const PostListWidget(),
                ),
              ).expanded()
            ],
          ),
        ),
      ),
    );
  }
}

final tabBarLabel = ['Trending', 'Featured', 'Latest'];

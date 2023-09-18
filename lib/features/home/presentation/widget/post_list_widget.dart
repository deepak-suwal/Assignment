import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/injection/injection.dart';
import 'package:flutter_assignment/features/home/presentation/widget/post_item_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/no_data_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../bloc/home_bloc.dart';

class PostListWidget extends StatelessWidget {
  const PostListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>(),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: BlocBuilder<HomeBloc, HomeState>(
          bloc: getIt<HomeBloc>()..add(FetchPostEvent()),
          builder: (context, state) {
            return switch (state) {
              FetchPostLoadingState() => const LoadingWidget(),
              FetchPostLoadedState() => GridView.builder(
                  shrinkWrap: true,
                  itemCount: state.postList.length,
                  padding: const EdgeInsets.only(bottom: 8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    mainAxisExtent: 240,
                  ),
                  itemBuilder: (ctx, index) {
                    return PostItemWidget(
                      sourceType: index % 2 == 0 ? 0 : 1,
                      postModel: state.postList[index],
                    );
                  },
                ),
              FetchPostFailureState() => const NoDataWidget(),
            };
          },
        ),
      ),
    );
  }
}

part of 'home_bloc.dart';

@immutable
sealed class HomeState {
  const HomeState();
}

class FetchPostLoadingState extends HomeState {
  const FetchPostLoadingState();
}

class FetchPostLoadedState extends HomeState {
  final List<PostModel> postList;

  const FetchPostLoadedState(this.postList) : super();
}

class FetchPostFailureState extends HomeState {
  final String error;

  const FetchPostFailureState(this.error);
}

import 'package:flutter/material.dart';
import 'package:flutter_assignment/features/home/domain/controller/i_home_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/post_model.dart';

part 'home_event.dart';

part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  IHomeController controller;

  HomeBloc(this.controller) : super(const FetchPostLoadingState()) {
    on<HomeEvent>((event, emit) async {
      if (event is FetchPostEvent) {
        emit(const FetchPostLoadingState());
        final response = await controller.fetchPosts();
        if (response.$2 == 200) {
          emit(FetchPostLoadedState(response.$1));
          return;
        }
        emit(const FetchPostFailureState('Error occurred'));
      }
    });
  }
}

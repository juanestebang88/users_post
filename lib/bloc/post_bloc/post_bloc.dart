import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter_application_ceiba/models/post_model.dart';
import 'package:flutter_application_ceiba/repositories/post_api_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {

  final PostAPIRepository _postRepository;

  PostBloc(this._postRepository) : super(PostLoadingState()) {
    on<LoadPostEvent>((event, emit) async{
      emit(PostLoadingState());
      try {
        final posts = await _postRepository.getPostByUser(event.id);
        emit(PostLoadedState(posts));
      } catch (e) {
        emit(PostErrorState(e.toString() ));
      }
    });
  }
}

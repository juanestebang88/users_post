part of 'post_bloc.dart';

@immutable
abstract class PostState extends Equatable {}

class PostLoadingState extends PostState {
  @override
  List<Object> get props => [];
}

class PostLoadedState extends PostState {

  PostLoadedState(this.posts);
  final List<PostModel>  posts;

  @override
  List<Object> get props => [posts];
}

class PostErrorState extends PostState {
  PostErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}

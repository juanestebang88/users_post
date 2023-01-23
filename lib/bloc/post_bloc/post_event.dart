part of 'post_bloc.dart';

@immutable
abstract class PostEvent extends Equatable {
  const PostEvent({required this.id});

  final String id;
}

class LoadPostEvent extends PostEvent {
  const LoadPostEvent({required super.id});

  @override
  List<Object> get props => [id];
}
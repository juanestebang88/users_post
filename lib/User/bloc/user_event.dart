part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();
}

class LoadUserEvent extends UserEvent {
  @override
  List<Object> get props => [];
}

class SearchUserEvent extends UserEvent {
    const SearchUserEvent(this.name);
  final String  name;

  @override
  List<Object> get props => [name];
}



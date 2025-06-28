import 'package:equatable/equatable.dart';
import 'package:seek_helpers_task/core/core.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<User> users;


  const UserLoaded(this.users, );

  @override
  List<Object> get props => [users];
}

class UserError extends UserState {
  final String message;

  const UserError(this.message);

  @override
  List<Object> get props => [message];
}

class UserAdding extends UserState {}

class UserAdded extends UserState {
  final User user;

  const UserAdded(this.user);

  @override
  List<Object> get props => [user];
}

class UserAddError extends UserState {
  final String message;

  const UserAddError(this.message);

  @override
  List<Object> get props => [message];
}
import 'package:equatable/equatable.dart';
import 'package:seek_helpers_task/core/core.dart';


abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUsers extends UserEvent {}

class AddUser extends UserEvent {
  final User user;

  const AddUser(this.user);

  @override
  List<Object> get props => [user];
}

class RefreshUsers extends UserEvent {}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seek_helpers_task/core/core.dart';
import 'package:seek_helpers_task/features/user/data/user_repository.dart';
import 'bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitial()) {
    on<LoadUsers>(_onLoadUsers);
    on<AddUser>(_onAddUser);
  }

  Future<void> _onLoadUsers(LoadUsers event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      // Fetch users from the repository
      final users = await userRepository.fetchUsers();
      emit(UserLoaded(users));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onAddUser(AddUser event, Emitter<UserState> emit) async {
    try {
      // Get current users list from the current state
      List<User> currentUsers = [];
      if (state is UserLoaded) {
        currentUsers = List<User>.from((state as UserLoaded).users);
      }

      emit(UserLoading());

      final newUser = event.user;

      final updatedUsers = <User>[...currentUsers, newUser];

      // Emit success state for snackbar notification
      emit(UserAdded(newUser));

      // Wait briefly to show success message
      await Future.delayed(const Duration(milliseconds: 1000));

      // Emit the updated users list to refresh the UI
      emit(UserLoaded(updatedUsers));
    } catch (error) {
      emit(UserError(error.toString()));
    }
  }
}

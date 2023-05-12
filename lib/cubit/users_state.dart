part of 'users_cubit.dart';

abstract class UsersState extends Equatable {
  const UsersState();
}

class UsersInitial extends UsersState {
  @override
  List<Object> get props => [];
}

class UsersLoadingState extends UsersState {
  @override
  List<Object> get props => [];
}

class UsersLoadedState extends UsersState {
  final List<UsersModel> usersModel;
  const UsersLoadedState(this.usersModel);

  @override
  List<Object> get props => [usersModel];
}

class UsersErrorState extends UsersState {
  final String errorMsg;
  const UsersErrorState(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}

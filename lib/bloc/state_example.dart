abstract class HomeState {}

class InitialState extends HomeState {}

class LoadingState extends HomeState {}

class SuccessState extends HomeState {
  final List users;
  SuccessState(this.users);
}

class ErrorState extends HomeState {}

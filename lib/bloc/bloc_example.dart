import 'dart:io';

import 'package:block_example_ibrohim/bloc/event_example.dart';
import 'package:block_example_ibrohim/bloc/state_example.dart';
import 'package:block_example_ibrohim/repositories/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.userRepository) : super(InitialState());

  final UserRepository userRepository;

  List users = [];
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetDataEvent) {
      Response res = await UserRepository.instance.getUsers();
      if (res.statusCode == HttpStatus.ok) {
        users = res.data;
        yield SuccessState(users);
      } else {
        print(res.statusCode);
      }
    } else if (event is ClearListEvent) {
      print(users[event.id]["name"]);
      yield SuccessState(users);
    } else {
      yield ErrorState();
    }
  }
}

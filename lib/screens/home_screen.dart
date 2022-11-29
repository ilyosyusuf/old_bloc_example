import 'package:block_example_ibrohim/bloc/bloc_example.dart';
import 'package:block_example_ibrohim/bloc/event_example.dart';
import 'package:block_example_ibrohim/bloc/state_example.dart';
import 'package:block_example_ibrohim/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HOmeScreen extends StatefulWidget {
  const HOmeScreen({Key? key}) : super(key: key);

  @override
  State<HOmeScreen> createState() => _HOmeScreenState();
}

class _HOmeScreenState extends State<HOmeScreen> {
  final HomeBloc homeBloc = HomeBloc(UserRepository.instance);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeBloc.add(GetDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: homeBloc,
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(child: CircularProgressIndicator.adaptive());
          } else if (state is SuccessState) {
            return Column(
              children: [
                SizedBox(
                  height: 500,
                  child: ListView.builder(
                    itemCount: state.users.length,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () {
                          homeBloc.add(ClearListEvent(i));
                        },
                        child: ListTile(title: Text("${state.users[i]["name"]}")));
                    },
                  ),
                ),
                // ElevatedButton(onPressed: () {
                //   homeBloc.add(ClearListEvent());
                // }, child: Text("Press"))
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

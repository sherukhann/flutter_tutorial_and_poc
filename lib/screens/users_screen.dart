import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/cubit/users_cubit.dart';

import '../bloc/products_bloc.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {

  @override
  void initState() {
    context.read<UsersCubit>().onLoadUsers();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users List'),
      ),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is UsersLoadingState) {
            // Loading state
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is UsersLoadedState) {
            // success state
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(state.usersModel[index].id.toString()),
                  title: Text(state.usersModel[index].username.toString()),
                  subtitle: Text(
                      state.usersModel[index].name.toString()),
                );
              },
              itemCount: state.usersModel.length,
            );
          } else if (state is UsersErrorState) {
            // error state
            return Center(
              child: Text(state.errorMsg),
            );
          } else {
            return const Text('SomeThing Went Wrong!');
          }
        },
      ),
    );
  }
}

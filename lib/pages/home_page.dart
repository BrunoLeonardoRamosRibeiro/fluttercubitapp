import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/pages/bloc/home_bloc.dart';
import 'package:flutter_cubit/pages/bloc/home_state.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo Bloc'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: BlocProvider.of<HomeBloc>(context),
        builder: (context, state) {

          if (state is HomeStateLoaded){
            return ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text(state.list[index]),
                );
              },
            );
          }

          if (state is HomeErrorState){
            return Center(child: Text(state.message));
          }

          if (state is HomeStateEmpty) {
            return Center(child: Text('Sem dados para apresentar!'));
          }
          return Center(child: CircularProgressIndicator());

        },
      ),
    );
  }
}


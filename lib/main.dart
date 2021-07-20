import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/pages/bloc/home_bloc.dart';
import 'package:flutter_cubit/pages/bloc/home_event.dart';
import 'package:flutter_cubit/pages/bloc/home_state.dart';
import 'package:flutter_cubit/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(HomeLoadingState())..add(HomeFetchList()),
        child: HomePage(),
      ),
    );
  }
}

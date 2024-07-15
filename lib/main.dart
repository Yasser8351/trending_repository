import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/service/graph_qL_service.dart';
import 'package:flutter_task/bloc/user_bloc.dart';
import 'package:flutter_task/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        final graphQLService = GraphQLService();

    return MaterialApp(
      title: 'Flutter GitHub List of Trending Repository',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => UserBloc(graphQLService)..add(FetchUsersEvent()),
        child:const HomeScreen(),
      ),
    );
  }
}


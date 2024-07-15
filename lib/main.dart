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




/*
echo "# trending_repository" >> README.md
git init
git add .
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/Yasser8351/trending_repository.git
git push -u origin main
*/
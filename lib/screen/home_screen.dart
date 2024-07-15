

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/bloc/user_bloc.dart';
import 'package:flutter_task/widgets/home_widget.dart';
import 'package:flutter_task/widgets/try_again_widget.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Trending Repository'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserLoaded) {
                       

            return  HomeWidget(trendingRepository: state.trendingRepository);
          } else if (state is UserError) {
            
            return TryAgainWidget(errorMessage: state.message);
          }
          return const Center(child: Text('Press the button to fetch trending Repository.'));
        },
      ),
    );
  }
}



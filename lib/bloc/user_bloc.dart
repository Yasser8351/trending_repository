// ignore: depend_on_referenced_packages
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter_task/models/graph_qlL_response.dart';
import 'package:flutter_task/service/graph_qL_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:equatable/equatable.dart';



part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GraphQLService graphQLService;

  UserBloc(this.graphQLService) : super(UserInitial()) {
    on<FetchUsersEvent>(_onFetchUsers);
  }

  Future<void> _onFetchUsers(FetchUsersEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());

    final client = graphQLService.getClient();
    final QueryResult result = await client.query(
      QueryOptions(document: gql(graphQLService.getRepositoriesQuery)),
    );

      Map<String, dynamic> responseJson = jsonDecode(jsonString);

  GraphQLResponse response = GraphQLResponse.fromJson(responseJson);
    

        // Accessing the error message
    if (result.hasException) {



   if (response.errorMessage != null && response.errorMessage!.linkException != null) {
    String errorMessage = response.errorMessage!.linkException!.message ?? "Unknown Error";

          emit(UserError(errorMessage.toString()));

  } else{
      emit(UserError(result.exception.toString()));

  }

 
    } else {
       final List trendingRepository = result.data!['search']['edges'];


      emit(UserLoaded(trendingRepository));
    }
  }
}


 String jsonString = '''
    {
      "errorMessage": {
        "linkException": {
          "message": "Not Found",
          "documentation_url": "https://docs.github.com/rest",
          "status": 404
        },
        "graphqlErrors": []
      }
    }
  ''';

  
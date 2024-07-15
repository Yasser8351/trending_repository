import 'package:flutter_task/models/operation_exception.dart';

class GraphQLResponse {
  final OperationException? errorMessage;

  GraphQLResponse({this.errorMessage});

  factory GraphQLResponse.fromJson(Map<String, dynamic> json) {
    return GraphQLResponse(
      errorMessage: json['errorMessage'] != null
          ? OperationException.fromJson(json['errorMessage'])
          : null,
    );
  }
}





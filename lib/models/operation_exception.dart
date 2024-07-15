
import 'package:flutter_task/models/server_exception_model.dart';

class OperationException {
  final ServerException? linkException;

  OperationException({this.linkException});

  factory OperationException.fromJson(Map<String, dynamic> json) {
    return OperationException(
      linkException: json['linkException'] != null
          ? ServerException.fromJson(json['linkException'])
          : null,
    );
  }
}
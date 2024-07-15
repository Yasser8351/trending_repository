class ServerException {
  final String? message;
  final String? documentationUrl;
  final int? status;

  ServerException({this.message, this.documentationUrl, this.status});

  factory ServerException.fromJson(Map<String, dynamic> json) {
    return ServerException(
      message: json['message'],
      documentationUrl: json['documentation_url'],
      status: json['status'],
    );
  }
}
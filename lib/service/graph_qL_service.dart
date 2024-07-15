// ignore: file_names
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  final String _token = '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';
  final String _apiUrl = 'https://api.github.com/graphql';

  GraphQLClient getClient() {
    final HttpLink httpLink = HttpLink(_apiUrl);

    final AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer $_token',
    );

    final Link link = authLink.concat(httpLink);

    return GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link: link,
    );
  }



  String getRepositoriesQuery = """
{
  search(query: "stars:>10000", type: REPOSITORY, first: 10) {
    edges {
      node {
        ... on Repository {
          name
          owner {
            login
          }
          description
          stargazerCount
          url
        }
      }
    }
  }
}
""";

  
}

  

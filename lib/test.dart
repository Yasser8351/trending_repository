
/*

https://chatgpt.com/share/ed45271e-9127-45d7-bcb5-951527c3fef2

Yasser Abubaker <yasser8351@gmail.com‏>
12:52 م ‎(قبل 8 دقائق)‎
yasser.abubaker8351


للحصول على قائمة المستخدمين من GraphQL GitHub API، ستحتاج إلى القيام بعدة خطوات:

1. **إنشاء رمز وصول شخصي (Personal Access Token):**
   - قم بتسجيل الدخول إلى حسابك على GitHub.
   - اذهب إلى إعدادات حسابك.
   - ضمن قسم "Developer settings"، اختر "Personal access tokens".
   - أنشئ رمزًا جديدًا مع الأذونات المطلوبة (مثل `repo` و `user`).

2. **إرسال استعلام GraphQL:**
   - قم بكتابة استعلام GraphQL للحصول على قائمة المستخدمين.
   - استخدم `curl` أو أي أداة أخرى مثل Postman لإرسال الاستعلام إلى GraphQL GitHub API.

إليك مثال على استعلام GraphQL للحصول على قائمة بالمستخدمين:

```graphql
{
  search(query: "type:user", type: USER, first: 10) {
    edges {
      node {
        ... on User {
          login
          name
          url
        }
      }
    }
  }
}
```

وهذا مثال لاستخدام `curl` لإرسال الاستعلام:

```bash
curl -H "Authorization: bearer YOUR_ACCESS_TOKEN" -X POST -d '{"query": "{ search(query: \"type:user\", type: USER, first: 10) { edges { node { ... on User { login name url } } } } }"}' https://api.github.com/graphql
```

قم بتبديل `YOUR_ACCESS_TOKEN` برمز الوصول الشخصي الخاص بك.

### شرح الخطوات:

1. **إنشاء رمز وصول شخصي:**
   - انتقل إلى [GitHub Personal Access Tokens](https://github.com/settings/tokens).
   - أنشئ رمزًا جديدًا مع الأذونات المطلوبة.

2. **كتابة استعلام GraphQL:**
   - الاستعلام يستخدم الدالة `search` للبحث عن المستخدمين.
   - يستخدم `query` مع `type:user` للبحث عن المستخدمين فقط.
   - تحديد عدد النتائج باستخدام `first: 10`.

3. **إرسال الاستعلام باستخدام `curl`:**
   - استخدم `curl` لإرسال طلب HTTP POST إلى GraphQL GitHub API.
   - أضف رأس التفويض مع رمز الوصول الشخصي.

بهذه الطريقة، يمكنك الحصول على قائمة المستخدمين من GraphQL GitHub API.


*/













/*


كيف احصل علي list of user from GraphQL gitbuh api
ChatGPT
للحصول على قائمة المستخدمين من GraphQL GitHub API، ستحتاج إلى القيام بعدة خطوات:

إنشاء رمز وصول شخصي (Personal Access Token):

قم بتسجيل الدخول إلى حسابك على GitHub.
اذهب إلى إعدادات حسابك.
ضمن قسم "Developer settings"، اختر "Personal access tokens".
أنشئ رمزًا جديدًا مع الأذونات المطلوبة (مثل repo و user).
إرسال استعلام GraphQL:

قم بكتابة استعلام GraphQL للحصول على قائمة المستخدمين.
استخدم curl أو أي أداة أخرى مثل Postman لإرسال الاستعلام إلى GraphQL GitHub API.
إليك مثال على استعلام GraphQL للحصول على قائمة بالمستخدمين:

graphql
Copy code
{
  search(query: "type:user", type: USER, first: 10) {
    edges {
      node {
        ... on User {
          login
          name
          url
        }
      }
    }
  }
}
وهذا مثال لاستخدام curl لإرسال الاستعلام:

bash
Copy code
curl -H "Authorization: bearer YOUR_ACCESS_TOKEN" -X POST -d '{"query": "{ search(query: \"type:user\", type: USER, first: 10) { edges { node { ... on User { login name url } } } } }"}' https://api.github.com/graphql
قم بتبديل YOUR_ACCESS_TOKEN برمز الوصول الشخصي الخاص بك.

شرح الخطوات:
إنشاء رمز وصول شخصي:

انتقل إلى GitHub Personal Access Tokens.
أنشئ رمزًا جديدًا مع الأذونات المطلوبة.
كتابة استعلام GraphQL:

الاستعلام يستخدم الدالة search للبحث عن المستخدمين.
يستخدم query مع type:user للبحث عن المستخدمين فقط.
تحديد عدد النتائج باستخدام first: 10.
إرسال الاستعلام باستخدام curl:

استخدم curl لإرسال طلب HTTP POST إلى GraphQL GitHub API.
أضف رأس التفويض مع رمز الوصول الشخصي.
بهذه الطريقة، يمكنك الحصول على قائمة المستخدمين من GraphQL GitHub API.

اكتب برنامج flutter باستخدام مكتبة Bloc لجلب بيانات لسه 10 مستخدمين وgithub GrahQL api
ChatGPT
لبناء تطبيق Flutter يستخدم مكتبة Bloc لجلب بيانات المستخدمين من GitHub GraphQL API، اتبع الخطوات التالية:

إعداد المشروع وإضافة الحزم:

أنشئ مشروع Flutter جديد.
أضف الحزم الضرورية في pubspec.yaml:
yaml
Copy code
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.0.0
  graphql_flutter: ^5.0.0
  http: ^0.13.3
إعداد Bloc وGraphQL Client:

أنشئ ملف جديد يسمى user_bloc.dart لإدارة الحالة باستخدام Bloc.
أنشئ ملف آخر يسمى graphql_service.dart لإعداد GraphQL Client.
كتابة استعلام GraphQL:

في graphql_service.dart:
dart
Copy code
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  final String _token = 'YOUR_ACCESS_TOKEN';
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

  String getUsersQuery = """
  {
    search(query: "type:user", type: USER, first: 10) {
      edges {
        node {
          ... on User {
            login
            name
            url
          }
        }
      }
    }
  }
  """;
}
إعداد Bloc:

في user_bloc.dart:

dart
Copy code
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'graphql_service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GraphQLService graphQLService;

  UserBloc(this.graphQLService) : super(UserInitial()) {
    on<FetchUsersEvent>(_onFetchUsers);
  }

  Future<void> _onFetchUsers(FetchUsersEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());

    final client = graphQLService.getClient();
    final QueryResult result = await client.query(
      QueryOptions(document: gql(graphQLService.getUsersQuery)),
    );

    if (result.hasException) {
      emit(UserError(result.exception.toString()));
    } else {
      final List users = result.data!['search']['edges'];
      emit(UserLoaded(users));
    }
  }
}
في user_event.dart:

dart
Copy code
part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class FetchUsersEvent extends UserEvent {}
في user_state.dart:

dart
Copy code
part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List users;

  const UserLoaded(this.users);

  @override
  List<Object> get props => [users];
}

class UserError extends UserState {
  final String message;

  const UserError(this.message);

  @override
  List<Object> get props => [message];
}
إنشاء واجهة المستخدم واستخدام Bloc:

في main.dart:
dart
Copy code
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'graphql_service.dart';
import 'user_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final graphQLService = GraphQLService();

    return MaterialApp(
      title: 'Flutter GitHub Users',
      home: BlocProvider(
        create: (context) => UserBloc(graphQLService)..add(FetchUsersEvent()),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GitHub Users'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UserLoaded) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index]['node'];
                return ListTile(
                  title: Text(user['login']),
                  subtitle: Text(user['name'] ?? ''),
                  onTap: () {
                    launch(user['url']);
                  },
                );
              },
            );
          } else if (state is UserError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text('Press the button to fetch users.'));
        },
      ),
    );
  }
}
تشغيل التطبيق:

تأكد من وضع رمز الوصول الشخصي في graphql_service.dart.
شغل التطبيق باستخدام الأمر flutter run.
بهذه الطريقة، يمكنك بناء تطبيق Flutter يستخدم مكتبة Bloc لجلب بيانات المستخدمين من GitHub GraphQL API.
*/





/*

To fetch repositories from GitHub using Flutter, you can use the `http` package to send a POST request to GitHub's GraphQL endpoint. Here's how you can implement this:

1. **Add Dependencies**: Open your `pubspec.yaml` file and add the `http` package dependency:

   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     http: ^0.13.3
   ```

   Then, run `flutter pub get` to install the package.

2. **Create GraphQL Query**: Define your GraphQL query to fetch repositories. Here's an example query:

   ```dart
   String query = """
   {
     search(query: "is:public", type: REPOSITORY, first: 100) {
       nodes {
         ... on Repository {
           name
           owner {
             login
           }
           stargazers {
             totalCount
           }
           description
           url
         }
       }
     }
   }
   """;
   ```

3. **Make HTTP Request**: Use the `http` package to send a POST request to GitHub's GraphQL endpoint. Replace `'your_access_token_here'` with your GitHub personal access token:

   ```dart
   import 'dart:convert';
   import 'package:flutter/material.dart';
   import 'package:http/http.dart' as http;

   void main() {
     runApp(MyApp());
   }

   class MyApp extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
       return MaterialApp(
         home: Scaffold(
           appBar: AppBar(
             title: Text('GitHub Repositories'),
           ),
           body: Center(
             child: FutureBuilder(
               future: fetchRepositories(),
               builder: (context, snapshot) {
                 if (snapshot.connectionState == ConnectionState.waiting) {
                   return CircularProgressIndicator();
                 } else if (snapshot.hasError) {
                   return Text('Error: ${snapshot.error}');
                 } else {
                   // Display the list of repositories
                   List repositories = snapshot.data;
                   return ListView.builder(
                     itemCount: repositories.length,
                     itemBuilder: (context, index) {
                       var repo = repositories[index];
                       return ListTile(
                         title: Text(repo['name']),
                         subtitle: Text(repo['owner']['login']),
                         trailing: Text('${repo['stargazers']['totalCount']} stars'),
                         onTap: () {
                           // Handle tapping on a repository item
                           // For example, open the repository URL
                         },
                       );
                     },
                   );
                 }
               },
             ),
           ),
         ),
       );
     }
   }

   Future<List<dynamic>> fetchRepositories() async {
     String query = """
     {
       search(query: "is:public", type: REPOSITORY, first: 100) {
         nodes {
           ... on Repository {
             name
             owner {
               login
             }
             stargazers {
               totalCount
             }
             description
             url
           }
         }
       }
     }
     """;

     final response = await http.post(
       Uri.parse('https://api.github.com/graphql'),
       headers: {
         'Authorization': 'Bearer your_access_token_here',
         'Content-Type': 'application/json',
       },
       body: jsonEncode({'query': query}),
     );

     if (response.statusCode == 200) {
       Map<String, dynamic> jsonResponse = jsonDecode(response.body);
       List<dynamic> repositories = jsonResponse['data']['search']['nodes'];
       return repositories;
     } else {
       throw Exception('Failed to load repositories');
     }
   }
   ```

4. **Display Results**: Use `FutureBuilder` widget to handle asynchronous fetching of data and display the list of repositories. Each repository item is displayed using `ListTile`.

5. **Replace Token**: Replace `'your_access_token_here'` with your actual GitHub personal access token obtained from GitHub Developer settings.

This Flutter code provides a basic implementation to fetch and display repositories from GitHub using GraphQL. Make sure to handle errors and exceptions as per your application's requirements.
*/





/*

لجلب قائمة بالمستودعات الشهيرة (Trending Repositories) من GitHub باستخدام Flutter ومكتبة Bloc، يمكنك اتباع نفس الخطوات التي استخدمناها لجلب بيانات المستخدمين، مع بعض التعديلات في الاستعلام GraphQL وفي طريقة عرض البيانات في واجهة المستخدم.

### تعديل الاستعلام GraphQL

قم بتعديل الاستعلام في `graphql_service.dart` ليكون متجهًا نحو البحث عن المستودعات بدلاً من المستخدمين:

```dart
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
```

### تعديل Bloc لجلب المستودعات

في `user_bloc.dart`، قم بتعديل الأحداث والحالات لتناسب الاستعلام الجديد وبيانات المستودعات:

#### في user_event.dart:

```dart
class FetchRepositoriesEvent extends UserEvent {}
```

#### في user_state.dart:

```dart
class RepositoriesLoaded extends UserState {
  final List repositories;

  const RepositoriesLoaded(this.repositories);

  @override
  List<Object> get props => [repositories];
}
```

#### في UserBloc:

```dart
import 'graphql_service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GraphQLService graphQLService;

  UserBloc(this.graphQLService) : super(UserInitial()) {
    on<FetchUsersEvent>(_onFetchUsers);
    on<FetchRepositoriesEvent>(_onFetchRepositories);
  }

  Future<void> _onFetchRepositories(FetchRepositoriesEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());

    final client = graphQLService.getClient();
    final QueryResult result = await client.query(
      QueryOptions(document: gql(graphQLService.getRepositoriesQuery)),
    );

    if (result.hasException) {
      emit(UserError(result.exception.toString()));
    } else {
      final List repositories = result.data!['search']['edges'];
      emit(RepositoriesLoaded(repositories));
    }
  }
}
```

### تعديل واجهة المستخدم

#### في main.dart:

```dart
import 'user_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final graphQLService = GraphQLService();

    return MaterialApp(
      title: 'Flutter GitHub Repositories',
      home: BlocProvider(
        create: (context) => UserBloc(graphQLService)..add(FetchRepositoriesEvent()),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GitHub Trending Repositories'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is RepositoriesLoaded) {
            return ListView.builder(
              itemCount: state.repositories.length,
              itemBuilder: (context, index) {
                final repository = state.repositories[index]['node'];
                return ListTile(
                  title: Text(repository['name']),
                  subtitle: Text(repository['description'] ?? ''),
                  trailing: Text('${repository['stargazerCount']} stars'),
                  onTap: () {
                    launch(repository['url']);
                  },
                );
              },
            );
          } else if (state is UserError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text('Press the button to fetch repositories.'));
        },
      ),
    );
  }
}
```

### ملاحظات أخيرة

- تأكد من تعديل `graphql_service.dart` لاستخدام الاستعلام الجديد `getRepositoriesQuery`.
- استخدم نفس النهج لإضافة الاستعلامات والتغييرات اللازمة في كل مكان (مثل تعديل `UserEvent` و `UserState`) حسب احتياجاتك الخاصة.
- لا تنسى استبدال `YOUR_ACCESS_TOKEN` برمز الوصول الشخصي الخاص بك.

باستخدام هذه الخطوات، يمكنك بناء تطبيق Flutter يستخدم مكتبة Bloc لجلب بيانات المستودعات الشهيرة من GitHub GraphQL API وعرضها في واجهة المستخدم بطريقة سهلة ومنظمة.




//////////////////////////////////
///


In Flutter, if you want to access the error message from the response you provided, which seems to be in GraphQL format, you would typically parse the response and extract the relevant error information. Here’s how you can do it:

Assuming you have a GraphQL response object similar to what you provided:

```dart
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
```

Let's say you have a JSON response in a variable `responseJson`, you can parse it using the classes defined above:

```dart
import 'dart:convert';

void main() {
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

  Map<String, dynamic> responseJson = jsonDecode(jsonString);

  GraphQLResponse response = GraphQLResponse.fromJson(responseJson);

  // Accessing the error message
  if (response.errorMessage != null && response.errorMessage!.linkException != null) {
    String errorMessage = response.errorMessage!.linkException!.message ?? "Unknown Error";
    print("Error Message: $errorMessage");
  } else {
    print("No error message found in the response.");
  }
}
```

In this example:

- We define classes (`ServerException`, `OperationException`, `GraphQLResponse`) to represent the structure of the JSON response.
- We parse the JSON string into a Dart `Map`.
- We use `fromJson` methods in each class to convert the JSON data into Dart objects.
- Finally, we access the `errorMessage` and `linkException` fields to retrieve the error message (`"Not Found"` in this case).

This approach assumes you have control over the structure of your GraphQL response and are able to define corresponding Dart classes for easy parsing and access of data. Adjustments may be necessary based on your specific GraphQL schema and response structure.
///
///
///
///
*/
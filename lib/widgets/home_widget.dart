import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key, this.trendingRepository});
  final dynamic trendingRepository;

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
              itemCount: trendingRepository.length,
              itemBuilder: (context, index) {
                final repository = trendingRepository[index]['node'];
                return ListTile(
                  title: Text(repository['name']),
                  subtitle: Text(repository['description'] ?? ''),
                  trailing: Text('${repository['stargazerCount']} stars'),
                
                );
              },
            );
  }
}

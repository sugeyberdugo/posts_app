import 'package:flutter/material.dart';
import 'models/map.dart';

class Home extends StatelessWidget {
  const Home({required this.dato});

  final List<Posts> dato;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dato.length,
      itemBuilder: (context, int i) {
        final user = dato[i];
        return ListTile(
          title: Text('ID: ${user.id} User ID: ${user.userId}'),
          isThreeLine: true,
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.0),
              Text(
                'Titulo: ${user.title}',
                style: TextStyle(color: Color.fromARGB(255, 7, 143, 255)),
              ),
              SizedBox(height: 10.0),
              Text(
                'Body: ${user.body}',
                style: TextStyle(color: Color.fromARGB(255, 60, 94, 74)),
              ),
              VerticalDivider(
                color: Color.fromARGB(255, 107, 21, 21),
                thickness: 80,
                indent: 20,
                endIndent: 30,
              ),
            ],
          ),
          trailing: Image.network(
              'https://as1.ftcdn.net/v2/jpg/03/53/11/00/1000_F_353110097_nbpmfn9iHlxef4EDIhXB1tdTD0lcWhG9.jpg'),
        );
      },
    );
  }
}

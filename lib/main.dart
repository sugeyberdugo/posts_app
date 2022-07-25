import 'package:flutter/material.dart';
import 'package:lista_jsonplace/models/map.dart';
import 'home.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

void main() {
  runApp(MiApp());
}

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppPosts',
      home: Build(),
    );
  }
}

Future<List<Posts>> getPosts(http.Client client) async {
  final respuesta =
      await client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  // La función de cómputo se usa para ejecutar "parsePosts" en un aislamiento separado
  return compute(parsePosts, respuesta.body);
}

class Build extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: FutureBuilder<List<Posts>>(
        future: getPosts(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Home(dato: snapshot.data!);
          }
        },
      ),
    );
  }
}

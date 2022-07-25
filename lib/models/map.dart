import 'dart:convert';

// Función que convierte un cuerpo de respuesta "bodyRespuesta" en List<Posts>.
List<Posts> parsePosts(String bodyRespuesta) {
  final parsed = jsonDecode(bodyRespuesta).cast<Map<String, dynamic>>();

  return parsed.map<Posts>((json) => Posts.fromJson(json)).toList();
}

class Posts {
  final int userId;
  final int id;
  final String title;
  final String body;

  const Posts({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Posts.fromJson(Map<String, dynamic> map) {
    return Posts(
      userId: map['userId'],
      id: map['id'],
      title: map['title'],
      body: map['body'],
    );
  }
}

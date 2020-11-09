import 'dart:convert';
import 'package:http/http.dart' as http;

class Post {
  dynamic data;
  Post.fromJson(this.data);
}

class FetchPostRequestException implements Exception {
  String cause;
  FetchPostRequestException(this.cause);
}

class MyRepository {
  final http.Client client;

  MyRepository(this.client);

  Future<Post> fetchPost(
      {String requestString =
          'https://jsonplaceholder.typicode.com/posts/1'}) async {
    /*final response = await client.get(requestString);
    final decodedResponse = jsonDecode(response.body);

    return Post.fromJson(decodedResponse);*/
    //3
    /*final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      return Post.fromJson(jsonDecode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }*/

    //4*/
    final response = await client.get(requestString);

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      return Post.fromJson(jsonDecode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw FetchPostRequestException('Not not found');
    }
  }
}

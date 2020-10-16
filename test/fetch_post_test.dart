import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_testing_demo2/fetch_post.dart';

// Create a MockClient using the Mock class provided by the Mockito package.
// Create new instances of this class in each test.
class MockClient extends Mock implements http.Client {}

main() {
  var client;

  setUp(() {
    client = MockClient();
  });

  group('fetchPost', () {
    final requestString = 'https://jsonplaceholder.typicode.com/posts/1';

    test('returns a Post if the http call completes successfully', () async {
      //Arrange
      when(client.get(requestString))
          .thenAnswer((_) async => http.Response('{"title": "Test"}', 200));
      //Act
      var response = await fetchPost(client, requestString: requestString);
      //Assert
      //https://stackoverflow.com/questions/13298969/how-do-you-unittest-exceptions-in-dart
      expect(response, isA<Post>());
      expect(response.data['title'], "Test");
    });

    /*test('throws an exception if the http call completes with an error', () {
      //Arrange
      when(client.get(requestString))
          .thenAnswer((_) async => http.Response('Not found', 404));
      //Act

      //Assert
      expect(fetchPost(client, requestString: requestString), throwsException);
    });*/
  });
}

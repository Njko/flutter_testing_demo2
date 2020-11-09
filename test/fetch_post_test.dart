import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_testing_demo2/my_repository.dart';
import 'package:matcher/matcher.dart' as matcher;

// Create a MockClient using the Mock class provided by the Mockito package.
// Create new instances of this class in each test.
class MockClient extends Mock implements http.Client {}

main() {
  http.Client client;
  MyRepository testRepository;

  setUp(() {
    client = MockClient();
    testRepository = MyRepository(client);
  });

  group('fetchPost', () {
    final requestString = 'https://jsonplaceholder.typicode.com/posts/1';

    test('returns a Post if the http call completes successfully', () async {
      //Arrange
      when(client.get(any))
          .thenAnswer((_) async => http.Response('{"title": "Test"}', 200));
      //Act
      var response =
          await testRepository.fetchPost(requestString: requestString);
      //Assert
      //https://stackoverflow.com/questions/13298969/how-do-you-unittest-exceptions-in-dart
      expect(response, isA<Post>());
      verify(client.get('https://jsonplaceholder.typicode.com/posts/1'));
    });

    test('returns data call completes successfully', () async {
      //Arrange
      when(client.get(any))
          .thenAnswer((_) async => http.Response('{"title": "Test"}', 200));
      //Act
      var response =
          await testRepository.fetchPost(requestString: requestString);
      //Assert
      expect(response.data['title'], "Test");
    });

    test('throws an exception if the http call completes with an error', () {
      //Arrange
      when(client.get(requestString))
          .thenAnswer((_) async => http.Response('Not found', 404));
      //Act

      //Assert
      expect(testRepository.fetchPost(requestString: requestString),
          throwsA(const matcher.TypeMatcher<FetchPostRequestException>()));
    });
  });
}

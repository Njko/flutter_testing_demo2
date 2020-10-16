# flutter_testing_demo2

A project to illustrate mock testing and code coverage

## Fetch Post using mocks

The test class test/fetch_post_test.dart has 1 group with 2 tests to illustrate how to mock a HTTP client class.
The steps in the tested class fetch_post.dart illustrates how you can build your classe using a TDD approach.

## Code coverage

https://stackoverflow.com/questions/50789578/how-can-the-code-coverage-data-from-flutter-tests-be-displayed#:~:text=You%20can%20view%20the%20code,also%20with%20specific%20line%20highlighting.

Based on Lcov: http://ltp.sourceforge.net/coverage/lcov.php

* run "flutter test --coverage" to generate lcov file at /coverage by default

### HTML reports

* install lcov (and restart your terminal to have access to genhtml command)
* run "genhtml coverage/lcov.info -o covergage/html"

### VSCode plugin

* https://github.com/markis/vscode-code-coverage
* Search in marketplace "Code Coverage" author is "Markis Taylor"
/// API request methods
/// these values used in NetworkService class to define the request type/method
enum APIRequestMethod {
  GET('get'),
  POST('post');

  final String value;

  const APIRequestMethod(this.value);
}

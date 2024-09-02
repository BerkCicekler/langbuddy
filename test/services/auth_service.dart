/*import 'package:flutter_test/flutter_test.dart';
import 'package:langbuddy/product/models/base_response_model.dart';
import 'package:langbuddy/product/models/user.dart';
import 'package:langbuddy/product/services/authentication/auth_service.dart';
import 'package:langbuddy/product/services/authentication/iAuth_request.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRequest extends Mock implements IAuthMethod {}

void main() {
  late final MockAuthRequest mockAuthRequest;
  late final AuthService authService;

  final userJSON = <String, dynamic>{
    'userName': 'test',
    'email': 'example@gmail.com',
    'learningLanguage': 'tr',
    'nativeLanguage': 'en',
  };

  setUpAll(() {
    mockAuthRequest = MockAuthRequest();
    authService = AuthService(authRequestService: mockAuthRequest);
  });

  test('Initial values are correct', () {
    expect(authService.isAuthenticated, false);
    expect(authService.user, User.empty());
  });

  void _answerSuccessLoginAndRegisterRequest() {
    when(() => mockAuthRequest.login({})).thenAnswer((_) async {
      return BaseResponse(200, userJSON);
    });
    when(() => mockAuthRequest.register({})).thenAnswer((_) async {
      return BaseResponse(201, userJSON);
    });
  }

  void _answerFailedLoginAndRegisterRequest() {
    when(() => mockAuthRequest.login({})).thenAnswer((_) async {
      return BaseResponse(400, {});
    });
    when(() => mockAuthRequest.register({})).thenAnswer((_) async {
      return BaseResponse(400, {});
    });
  }

  group('Authentication', () {
    test('Login method using AuthRequest login function', () async {
      _answerSuccessLoginAndRegisterRequest();
      await authService.login({});
      verify(() => mockAuthRequest.login({})).called(1);
    });
    test('Register method using AuthRequest register function', () async {
      _answerSuccessLoginAndRegisterRequest();
      await authService.register({});
      verify(() => mockAuthRequest.register({})).called(1);
    });

    test('Authentication occurred after successful login', () async {
      _answerSuccessLoginAndRegisterRequest();
      await authService.login({});
      expect(authService.isAuthenticated, true);
      expect(authService.user, isNot(User.empty()));
    });

    test('Authentication occurred after successful register', () async {
      _answerSuccessLoginAndRegisterRequest();
      await authService.register({});
      expect(authService.isAuthenticated, true);
      expect(authService.user, isNot(User.empty()));
    });

    test('''
isAuthenticated and user variable are 
    default values after logout''', () async {
      _answerSuccessLoginAndRegisterRequest();
      await authService.login({});
      authService.logout();
      expect(authService.isAuthenticated, false);
      expect(authService.user, User.empty());
    });
  });

  test('Authentication is not occurred after login fail ', () async {
    _answerFailedLoginAndRegisterRequest();
    await authService.login({});
    expect(authService.isAuthenticated, false);
    expect(authService.user, User.empty());
  });

  test('Authentication is not occurred after register fail ', () async {
    _answerFailedLoginAndRegisterRequest();
    await authService.register({});
    expect(authService.isAuthenticated, false);
    expect(authService.user, User.empty());
  });
}
*/
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_share_app/Entities/user_entity/user_entity.dart';
import 'package:image_share_app/repositories/sign_in_repositories/sign_in_page_repository.dart';
import 'package:mockito/mockito.dart';

void main() {
  group('SignInPageRepositoryのテスト', () {
    // MOCK
    final _googleSignIn = MockGoogleSignIn();
    final _auth = MockFirebaseAuth();

    // テスト対象クラス
    final _repository = SignInPageRepository();

    test('loginWithGoogleのテスト signInできないver', () async {
      when(_googleSignIn.signInSilently())
          .thenAnswer((_) => Future.value(null));
      when(_googleSignIn.signIn()).thenAnswer((_) => Future.value(null));

      UserEntity _user = await _repository.loginWithGoogle();

      expect(_user, null);
    });

    test('loginWithGoogleのテスト signInしたがuserがいない', () async {
      when(_googleSignIn.signInSilently())
          .thenAnswer((_) => Future.value(MockGoogleSignInAccount()));

      UserEntity _user = await _repository.loginWithGoogle();

      expect(_user, null);
    });

    test('loginWithGoogleのテスト sigInしたがfirebaseにuserが見つからない', () async {
      final _credential = MockAuthCredential();

      when(_auth.signInWithCredential(_credential))
          .thenAnswer((_) => Future.value(MockAuthResult()));

      UserEntity _user = await _repository.loginWithGoogle();

      expect(_user, null);
    });
  });
}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

class MockFirebaseUser extends Mock implements FirebaseUser {
  final String email;
  final String uid;
  final String displayName;
  MockFirebaseUser(this.email, this.uid, this.displayName);
}

class MockAuthResult extends Mock implements AuthResult {
  final FirebaseUser user;

  MockAuthResult({this.user});
}

class MockGoogleSignInAuthentication extends Mock
    implements GoogleSignInAuthentication {}

class MockAuthCredential extends Mock implements AuthCredential {}

class MockGoogleAuthProvider extends Mock implements GoogleAuthProvider {}

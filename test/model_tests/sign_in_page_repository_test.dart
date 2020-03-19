
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_share_app/Entities/user_entity/user_entity.dart';
import 'package:image_share_app/repositories/sign_in_repositories/sign_in_page_repository.dart';
import 'package:mockito/mockito.dart';

void main() {

  group('SignInPageRepositoryのテスト', () {

    test('loginWithGoogleのテスト', () async {
      // MOCK
      final _googleSignIn = MockGoogleSignIn();
      final _auth = MockFirebaseAuth();

      // テスト対象クラス
      final _repository = SignInPageRepository();

      when(_googleSignIn.signInSilently()).thenAnswer((_) => null);
      when(_googleSignIn.signIn()).thenAnswer((_) => null);

      UserEntity _user = await _repository.loginWithGoogle();

      expect(_user, null);



    });

  });
}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

class MockFirebaseUser extends Mock implements FirebaseUser {}

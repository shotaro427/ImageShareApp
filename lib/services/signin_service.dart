import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_share_app/model/entities/user.entity.dart';
import 'package:image_share_app/services/index.dart';

class AppStartService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = FirestoreService();

  // Googleアカウントでログインする
  Future<UserState> loginWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    // 現在のログインユーザー
    GoogleSignInAccount googleCurrentUser = _googleSignIn.currentUser;

    // SignInしていなかったら、SignInする
    if (googleCurrentUser == null)
      googleCurrentUser = await _googleSignIn.signInSilently();
    if (googleCurrentUser == null)
      googleCurrentUser = await _googleSignIn.signIn();
    if (googleCurrentUser == null) return null;

    GoogleSignInAuthentication googleAuth =
        await googleCurrentUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser _user =
        (await _auth.signInWithCredential(credential)).user;

    if (_user == null || _user.uid.isEmpty)
      throw Exception('Firebase user is null');

    return await _firestoreService.getUser(_user.uid);
  }

  // Appleでログインする
  Future<UserState> loginWithApple() async {
    final AuthorizationResult _result = await AppleSignIn.performRequests([
      const AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
    ]);

    _validateStatus(_result);

    final AppleIdCredential appleIdCredential = _result.credential;

    OAuthProvider oAuthProvider = const OAuthProvider(providerId: "apple.com");
    final AuthCredential credential = oAuthProvider.getCredential(
      idToken: String.fromCharCodes(appleIdCredential.identityToken),
      accessToken: String.fromCharCodes(appleIdCredential.authorizationCode),
    );

    final FirebaseUser _user =
        (await _auth.signInWithCredential(credential)).user;

    if (_user == null || _user.uid.isEmpty)
      throw Exception('Firebase user is null');

    return await _firestoreService.getUser(_user.uid);
  }

  // メールアドレスでログインする
  Future<UserState> loginWithMailAdress(String email, String password) async {
    // ログイン
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;

    final UserState _user = UserState(email: user.email, uid: user.uid);

    if (_user == null || _user.uid.isEmpty)
      throw Exception('Firebase user is null');

    return await _firestoreService.getUser(_user.uid);
  }

  // メールアドレスで登録する
  Future<UserState> signupWithMailAdress(String email, String password) async {
    // 新しくfirebaseAuthに登録
    AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final FirebaseUser _firebaseUser = result.user;
    final UserState _user =
        UserState(email: _firebaseUser.email, uid: _firebaseUser.uid);

    return _user;
  }

  void _validateStatus(AuthorizationResult result) {
    if (result.status == AuthorizationStatus.error) {
      throw PlatformException(
        code: 'ERROR_AUTHORIZATION_DENIED',
        message: result.error.toString(),
      );
    }
    if (result.status == AuthorizationStatus.cancelled) {
      throw PlatformException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }
  }

  // ログアウトする
  Future<void> logout() async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    await Future.wait([
      _firebaseAuth.signOut(),
      GoogleSignIn().signOut(),
    ]);
  }
}

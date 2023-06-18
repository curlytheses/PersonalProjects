import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final _firebaseAuth = FirebaseAuth.instance;
  User? get currentuser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String pass,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: pass,
    );
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String pass,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: pass);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

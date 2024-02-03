import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:new_project/app/app.locator.dart';
import 'package:new_project/app/models/user_model.dart';
import 'package:new_project/services/user_service.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fs = FirebaseFirestore.instance;
  final UserService _userService = locator<UserService>();
  Logger log = Logger();

  String? _firstTimeUser;
  String? get firstTimeUser => _firstTimeUser;

  String? _userId;
  String? get userId => _userId;
  set userId(String? value) {
    _userId = value;
    log.i('userId set to $value');
  }

  String? _userEmail;
  String? get userEmail => _userEmail;
  set userEmail(String? value) {
    _userEmail = value;
    log.i('userEmail set to $value');
  }

  Future<void> registerUserWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      _userId = userCredential.user!.uid;
      _userEmail = userCredential.user!.email;
      await upsertGoogleUser(email: _userEmail!, uid: _userId!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log.i('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log.i('The account already exists for that email.');
      }
    } catch (e) {
      log.i(e);
    }
  }

  //Login with email and password

  Future<String?> loginUserWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      log.i(userCredential.user!.uid);
      _userService.userModel =
          await getUserDetailsById(userCredential.user!.uid);
      return 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log.i('User with that email not found.');
        return 'user-not-found';
      } else if (e.code == 'wrong-password') {
        log.i('Wrong password provided for that email.');
        return 'wrong-password';
      }
    } catch (e) {
      log.i(e);
      return 'error';
    }
    return null;
  }

  //Logout
  Future<void> logout() async {
    await _auth.signOut();
  }

  //Get current user details
  Future<UserModel?> getUserDetailsById(String id) async {
    var usr = UserModel.fromJson((await _fs.doc('/user/$id').get()).data()!);
    return usr;
  }

  //Save User in Firestore
  Future<void> upsertGoogleUser(
      {required String uid, required String email}) async {
    // set user record
    var newUserPayload = UserModel(
      uid: uid,
      firstName: '',
      lastName: '',
      email: email,
      imageName: '',
      imageUrl: '',
    ).toJson();

    await _fs.doc('/user/$uid').set(newUserPayload);

    // set the user object in user service
    _userService.userModel = UserModel.fromJson(newUserPayload);

    return;
  }

}

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static String verifyId = "";

  //to send app oth to user
  static Future sendOtp({
    required String phone,
    required Function errorStep,
    required Function nextStep,
  }) async {
    await _firebaseAuth
        .verifyPhoneNumber(
            timeout: const Duration(seconds: 30),
            phoneNumber: "+994$phone",
            verificationCompleted: (phoneAuthCredential) async {
              return;
            },
            verificationFailed: (error) async {
              return;
            },
            codeSent: (verificationId, forceResendingToken) async {
              verifyId = verificationId;
              nextStep();
            },
            codeAutoRetrievalTimeout: ((verificationId) async {
              return;
            }))
        .onError((error, stackTrace) {
      errorStep();
    });
  }

  //verify the otp code and login
  static Future loginWithOtp({required String otp}) async {
    final cred =
        PhoneAuthProvider.credential(verificationId: verifyId, smsCode: otp);

    try {
      final user = await _firebaseAuth.signInWithCredential(cred);
      if (user.user != null) {
        return "Sucess";
      } else {
        return "Error in Otp login";
      }
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } catch (e) {
      return e.toString();
    }
  }

  //to logout the user
  static Future logout() async {
    await _firebaseAuth.signOut();
  }

  //check whether the user id logged in or not
  static Future<bool> isLogged() async {
    var user = _firebaseAuth.currentUser;
    return user != null;
  }
}

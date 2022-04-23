import 'package:awsbasimtask/screens/otpScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService {
loginWithPhone (String phone) async {

  await FirebaseAuth.instance.verifyPhoneNumber(
  phoneNumber: phone,
  verificationCompleted: (PhoneAuthCredential credential) {},
  verificationFailed: (FirebaseAuthException e) {},
  codeSent: (String verificationId, int? resendToken) {
    Get.to(()=> Otp());
  },
  codeAutoRetrievalTimeout: (String verificationId) {},
);
}

  loginWithEmail(String email) async {
try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: "password",
  );
  credential.user?.sendEmailVerification();
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
  }
}
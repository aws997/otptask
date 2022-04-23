import 'package:awsbasimtask/screens/loginScreen.dart';
import 'package:awsbasimtask/screens/otpScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
// import 'package:firebase_auth/firebase_auth.dart';
Color green=Color(0xffC5FF29);
void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(home: Login());
  }
}
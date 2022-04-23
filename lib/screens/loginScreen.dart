import 'package:awsbasimtask/main.dart';
import 'package:awsbasimtask/services/authService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controller = TextEditingController();
  AuthService service=AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading:     BackButton(
          color: Colors.black,
        ) ,
        centerTitle: true,
        title:     Text(
                 "Connect your wallet",
                 style: TextStyle(
                   fontSize: 28,
                   color: Colors.black,
                   fontWeight: FontWeight.bold
                 ),
               ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20
          ),
          child: Column(
            children: [
              
             Text("We'll send you a confirmation code",
                 style: TextStyle(
                             fontSize: 16,
                            //  fontWeight: FontWeight.bold
                           ),
                 ),
Expanded(
  child:   Container(
  
    
  
  ),
),
                 TextField(
                   controller: controller,
                   decoration: InputDecoration(
                     label: Text("Phone number or Email"),
                     border: OutlineInputBorder(

                     )
                   ),
                 )
              ,
              SizedBox(height: 18,),
              MaterialButton(
                height: 57,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
                minWidth: double.infinity,
                onPressed: (){
                  String _text=controller.text;
if(GetUtils.isEmail(_text))
{
service.loginWithEmail(_text);
}else if(GetUtils.isPhoneNumber(_text))
{
  print("phone");
service.loginWithPhone(_text);
}
else {
  print(_text);
}
              },
              color: green,
              elevation: 0,
              child: Text("Continue",
              style: TextStyle(
                fontSize: 18
              ),),),
              SizedBox(
                height: 18,
              ),
           Text("By signing up I agree to Zëdfi’s Privacy Policy and Terms of Use and allow Zedfi to use your information for future Marketing purposes.",
           style: TextStyle(color: Colors.grey[600]),)
            ],
          ),
        ),
      ),
    );
  }
}
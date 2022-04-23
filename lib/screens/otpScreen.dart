import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'dart:async';


class Otp extends StatefulWidget {
  const Otp({ Key? key }) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {

  
late Timer _timer;
int _start = 60;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
void startTimer() {
  const oneSec = const Duration(seconds: 1);
  _timer = new Timer.periodic(
    oneSec,
    (Timer timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    },
  );
}

@override
void dispose() {
  _timer.cancel();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading:     BackButton(
        //   color: Colors.black,
        // ) ,
        centerTitle: true,
        title:     Text(
                 "We've sent you a code",
                 style: TextStyle(
                   fontSize: 28,
                   color: Colors.black,
                   fontWeight: FontWeight.bold
                 ),
               ),
      ),
      body: Center(child: Column(children: [
        Text("Enter the confirmation code below ",
        style: TextStyle(fontSize: 16)),
Expanded(child: SizedBox(),),
        OTPTextField(
          onChanged: (s){

          },
  length: 6,
  width: MediaQuery.of(context).size.width,
  fieldWidth: 48,
  style: TextStyle(
    fontSize: 17
  ),
  textFieldAlignment: MainAxisAlignment.center,
  fieldStyle: FieldStyle.box,
  onCompleted: (pin) {
    print("Completed: " + pin);
  },
),
SizedBox(
  height: 10,
),
RichText(
  text: TextSpan(
    text: '',
    style:TextStyle(fontSize: 14,color: Colors.black),
    children:   <TextSpan>[
            TextSpan(text: 'Didn’t recieve a code? '),
      TextSpan(text: 'Wait for ${60- _timer.tick} sec', style: TextStyle(fontWeight: FontWeight.bold)),

    ],
  ),
),
Expanded(child: SizedBox(),),

      ],)),
    );
  }
}
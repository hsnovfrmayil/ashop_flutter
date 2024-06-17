// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:shopapp/firebase/controller/auth_service.dart';

// class HomePage extends StatelessWidget {
//   HomePage({super.key});
//   TextEditingController _phoneController = TextEditingController();
//   TextEditingController _otpController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   final _formKey1 = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: SingleChildScrollView(
//           child: Container(
//             height: MediaQuery.of(context).size.height,
//             child: Center(
//               child: Column(
//                 children: [
//                   SvgPicture.asset(
//                     "assets/images/woman_mobile.svg",
//                   ),
//                   const Text(
//                     "Hi, welcome back",
//                     style: TextStyle(
//                       fontSize: 32,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   Text("Enter you phone number to continue..."),
//                   Form(
//                     key: _formKey,
//                     child: TextFormField(
//                       controller: _phoneController,
//                       keyboardType: TextInputType.phone,
//                       decoration: InputDecoration(
//                         prefixText: '+994',
//                         labelText: 'Enter you phone number',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(32),
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value!.length != 9) {
//                           return "Invalid phone number";
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     width: double.infinity,
//                     height: 50,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           AuthService.sendOtp(
//                               phone: _phoneController.text,
//                               errorStep: () => ScaffoldMessenger.of(context)
//                                       .showSnackBar(SnackBar(
//                                     content: Text(
//                                       "Error in sending OTP",
//                                       style: TextStyle(color: Colors.white),
//                                     ),
//                                     backgroundColor: Colors.red,
//                                   )),
//                               nextStep: () {
//                                 showDialog(
//                                     context: context,
//                                     builder: (context) => AlertDialog(
//                                           title: Text("OTP Verification"),
//                                           content: Column(
//                                             children: [
//                                               Text("Enter 6 digit OTP"),
//                                               SizedBox(
//                                                 height: 12,
//                                               ),
//                                               Form(
//                                                 key: _formKey1,
//                                                 child: TextFormField(
//                                                   keyboardType:
//                                                       TextInputType.number,
//                                                   controller: _otpController,
//                                                   decoration: InputDecoration(
//                                                     labelText:
//                                                         'Enter you phone number',
//                                                     border: OutlineInputBorder(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               32),
//                                                     ),
//                                                   ),
//                                                   validator: (value) {
//                                                     if (value!.length != 6) {
//                                                       return "Invalid OTP";
//                                                     }
//                                                     return null;
//                                                   },
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ));
//                               });
//                         }
//                       },
//                       child: Text("Send OTP"),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.yellow,
//                         foregroundColor: Colors.black,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }

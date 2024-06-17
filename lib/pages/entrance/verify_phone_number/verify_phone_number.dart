import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopapp/pages/main/entrance_base.dart';
import 'package:shopapp/provider/constants/continue_button_color_check.dart';
import 'package:shopapp/provider/constants/search_icon.dart';
import 'package:shopapp/provider/constants/search_text.dart';

class VerifyPhoneNumber extends ConsumerWidget {
  VerifyPhoneNumber({super.key});
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  bool checkButtonColor = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              ref.read(searchIconProvider.notifier).update((state) => false);
              ref.read(searchTextProvider.notifier).update((state) => "");
              print(ref.watch(searchTextProvider));
              Navigator.pop(context);
            },
            icon: const Icon(
              CupertinoIcons.clear,
              color: Colors.black,
            )),
        centerTitle: true,
        title: const Text(
          'Choose a country',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Enter the verification code sent via ",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "(+1) 123 456 789",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.red),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OtpInput(_fieldOne, true),
                        OtpInput(_fieldTwo, false),
                        OtpInput(_fieldThree, false),
                        OtpInput(_fieldFour, false),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ref.watch(continueButtonColorCheck)
                            ? Color.fromRGBO(243, 92, 86, 1.0)
                            : Color.fromRGBO(200, 200, 211, 1.0),
                        padding: EdgeInsets.all(12.0),
                      ),
                      onPressed: () {
                        ref
                            .read(continueButtonColorCheck.notifier)
                            .update((state) => true);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EntranceBase()));
                      },
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Center(
                    child: Text(
                      "Request a new verification code 1:38",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Resend verification code?",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(243, 92, 86, 1.0)),
                    )),
                const SizedBox(height: 15),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 50,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Colors.red,
        decoration: const InputDecoration(
            filled: true,
            fillColor: Color(0xFFF0F1F5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}

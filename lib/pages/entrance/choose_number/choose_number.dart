import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopapp/pages/entrance/choose_number/choose_country.dart';
import 'package:shopapp/pages/entrance/dope_animations/dope_animations.dart';
import 'package:shopapp/pages/entrance/verify_phone_number/verify_phone_number.dart';
import 'package:shopapp/provider/constants/choose_country_key.dart';
import 'package:shopapp/provider/constants/choose_country_url.dart';

class ChooseNumberPage extends ConsumerWidget {
  const ChooseNumberPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double globalWidth = MediaQuery.of(context).size.width;
    double globalHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        elevation: 0,
        title: const Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.chevron_back,
            color: Colors.black,
            size: 24,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
            child: Container(
              padding: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xffd9d9d9),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 16, top: 16),
                    child: const Text(
                      'Telephone number',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(117, 117, 158, 1.0)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 40, top: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 11.5),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(240, 241, 245, 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ChooseCountryPage()));
                            },
                            child: SizedBox(
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    ref.watch(chooseCountryUrl).toString(),
                                    width: 24,
                                    height: 24,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    ref.watch(chooseCountryKey).toString(),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(width: 23),
                                  const SizedBox(
                                    height: 20,
                                    child: Text(
                                      '|',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DopeExtraButtonWidget(
                    globalWidth: globalWidth,
                    globalHeight: globalHeight,
                    buttonText: 'Continue',
                    func: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => VerifyPhoneNumber(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopapp/pages/entrance/choose_number/choose_number.dart';
import 'package:shopapp/pages/entrance/dope_animations/dope_pages/dope_page_one.dart';
import 'package:shopapp/pages/entrance/dope_animations/dope_pages/dope_page_three.dart';
import 'package:shopapp/pages/entrance/dope_animations/dope_pages/dope_page_two.dart';
import 'package:shopapp/provider/constants/dope_answer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DopeAnimationsPage extends ConsumerWidget {
  DopeAnimationsPage({super.key});
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double globalWidth = MediaQuery.of(context).size.width;
    double globalHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              ref.read(dopeProvider.notifier).update((state) => (index == 2));
            },
            children: const [
              DopePageOne(),
              DopePageTwo(),
              DopePageThree(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: globalHeight * 0.074),
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      activeDotColor: Color.fromRGBO(243, 92, 86, 1),
                    ),
                  ),
                ),
                DopeExtraButtonWidget(
                  globalWidth: globalWidth,
                  globalHeight: globalHeight,
                  buttonText: 'Get Started!',
                  func: () {
                    if (!ref.watch(dopeProvider)) {
                      _controller.nextPage(
                          duration: const Duration(microseconds: 500),
                          curve: Curves.easeIn);
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ChooseNumberPage()));
                    }
                  },
                ),
                SizedBox(
                  height: globalHeight * 0.07,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DopeExtraButtonWidget extends StatelessWidget {
  const DopeExtraButtonWidget({
    super.key,
    required this.globalWidth,
    required this.globalHeight,
    required this.func,
    required this.buttonText,
  });

  final double globalWidth;
  final double globalHeight;
  final VoidCallback func;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: globalWidth * 0.064),
      height: globalHeight * 0.054,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(243, 92, 86, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
        ),
        onPressed: () => func(),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

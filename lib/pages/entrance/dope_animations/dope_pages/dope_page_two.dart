import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopapp/pages/entrance/dope_animations/dope_pages/dope_page_one.dart';

class DopePageTwo extends StatelessWidget {
  const DopePageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    double globalWidth = MediaQuery.of(context).size.width;
    double globalHeight = MediaQuery.of(context).size.height;

    return Container(
      child: Column(
        children: [
          Expanded(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: globalHeight * 0.1,
                ),
                width: globalWidth,
                height: globalHeight * 0.43,
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      child: Container(
                        width: globalWidth,
                        height: globalHeight * 0.36,
                        child: SvgPicture.asset(
                          'assets/images/Path 4.svg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      top: globalHeight * 0.08,
                      right: globalWidth * 0.1,
                      child: Container(
                        width: globalWidth * 0.8,
                        height: globalHeight * 0.36,
                        child: SvgPicture.asset(
                          'assets/images/4.svg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ExtraTextDopeWidget(
                globalHeight: globalHeight,
                globalWidth: globalWidth,
                titleText: 'Fast shipping',
                extraText:
                    'Fast delivery is now simple and fast. Orders will be shipped quickly to you.',
              ),
            ],
          )),
        ],
      ),
    );
  }
}

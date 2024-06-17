import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopapp/pages/entrance/dope_animations/dope_pages/dope_page_one.dart';

class DopePageThree extends StatelessWidget {
  const DopePageThree({super.key});

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
                      left: 0,
                      child: Container(
                        width: globalWidth * 0.944,
                        height: globalHeight * 0.36,
                        child: SvgPicture.asset(
                          'assets/images/Path 5.svg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      top: globalHeight * 0.08,
                      right: globalWidth * 0.165,
                      child: Container(
                        width: globalWidth * 0.66,
                        height: globalHeight * 0.3,
                        child: SvgPicture.asset(
                          'assets/images/3.svg',
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
                titleText: 'Reflect and evaluate',
                extraText:
                    'The enthusiasm to contribute ideas from customers, helping the service more and more developed.',
              ),
            ],
          )),
        ],
      ),
    );
  }
}

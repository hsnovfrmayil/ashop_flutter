import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DopePageOne extends StatelessWidget {
  const DopePageOne({super.key});

  @override
  Widget build(BuildContext context) {
    double globalWidth = MediaQuery.of(context).size.width;
    double globalHeight = MediaQuery.of(context).size.height;

    return Container(
      child: Column(
        children: [
          ExtraDopePictureWidget(
            globalHeight: globalHeight,
            globalWidth: globalWidth,
            backWidth: globalWidth * 0.87,
            backHeight: globalHeight * 0.36,
            positionedTop: globalHeight * 0.08,
            positionedRight: globalWidth * 0.1,
            imageWidth: globalWidth * 0.8,
            imageHeight: globalHeight * 0.36,
            backUrl: 'assets/images/yellow_back_photo.svg',
            imageUrl: 'assets/images/woman_mobile.svg',
          ),
        ],
      ),
    );
  }
}

class ExtraDopePictureWidget extends StatelessWidget {
  const ExtraDopePictureWidget({
    super.key,
    required this.globalHeight,
    required this.globalWidth,
    required this.backWidth,
    required this.backHeight,
    required this.positionedTop,
    required this.positionedRight,
    required this.imageWidth,
    required this.imageHeight,
    required this.backUrl,
    required this.imageUrl,
  });

  final double globalHeight;
  final double globalWidth;
  final double backWidth;
  final double backHeight;
  final double positionedTop;
  final double positionedRight;
  final double imageWidth;
  final double imageHeight;
  final String backUrl;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                  width: backWidth,
                  height: backHeight,
                  child: SvgPicture.asset(
                    backUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: positionedTop,
                right: positionedRight,
                child: Container(
                  width: imageWidth,
                  height: imageHeight,
                  child: SvgPicture.asset(
                    imageUrl,
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
          titleText: 'Order fast',
          extraText:
              'Choosing fresh and delicious food right at home, simply select and order.',
        ),
      ],
    ));
  }
}

class ExtraTextDopeWidget extends StatelessWidget {
  const ExtraTextDopeWidget({
    super.key,
    required this.globalHeight,
    required this.globalWidth,
    required this.titleText,
    required this.extraText,
  });

  final double globalHeight;
  final double globalWidth;
  final String titleText;
  final String extraText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: globalHeight * 0.07),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: globalWidth * 0.144),
        child: Column(
          children: [
            Text(
              titleText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              extraText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.375,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

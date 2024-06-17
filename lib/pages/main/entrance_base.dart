import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class EntranceBase extends StatelessWidget {
  const EntranceBase({super.key});
  final List colorList = const [
    Color.fromRGBO(137, 226, 254, 1.0),
    Color.fromRGBO(245, 184, 136, 1.0),
    Color.fromRGBO(247, 217, 111, 1.0),
    Color.fromRGBO(187, 175, 254, 1.0),
    Color.fromRGBO(246, 189, 172, 1.0),
  ];
  final List iconList = const [
    "assets/images/shop.svg",
    "assets/images/smartphone.svg",
    "assets/images/b-comment (1).svg",
    "assets/images/salad.svg",
    "assets/images/shop.svg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 56),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 44,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(240, 241, 245, 1.0),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                            topLeft: Radius.circular(16),
                          ),
                        ),
                        child: const Row(
                          children: [
                            SizedBox(width: 12),
                            Icon(CupertinoIcons.search),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Search...',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.qrcode,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.bell_fill,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 141,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  width: double.infinity,
                  child: SvgPicture.asset(
                    "assets/images/banner foods.svg",
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 8),
                for (int i = 0; i < colorList.length; i++) ...[
                  ContainerWithOnlyRadius(
                    imageUrl: iconList[i],
                    color: colorList[i],
                  ),
                ]
              ],
            ),
          ),
          const SizedBox(height: 24),
          Stack(
            children: [
              Positioned(
                child: Container(
                  width: double.infinity,
                  child: SvgPicture.asset(
                    "assets/icons/combii.svg",
                    fit: BoxFit.fill,
                    color: Colors.grey[100],
                  ),
                ),
              ),
              Positioned(
                top: 24,
                left: 24,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/ashop.svg",
                                    width: 13,
                                    fit: BoxFit.fill,
                                  ),
                                  const SizedBox(width: 4),
                                  const Text(
                                    "Ashop",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 31),
                              SvgPicture.asset(
                                "assets/images/Group 111.svg",
                                height: 50,
                                fit: BoxFit.fill,
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Redeem points",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Member",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ContainerWithOnlyRadius extends StatelessWidget {
  const ContainerWithOnlyRadius({
    super.key,
    required this.imageUrl,
    required this.color,
  });
  final String imageUrl;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
        color: color,
      ),
      child: Center(
        child: Container(
          width: 24,
          height: 24,
          child: SvgPicture.asset(
            imageUrl,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

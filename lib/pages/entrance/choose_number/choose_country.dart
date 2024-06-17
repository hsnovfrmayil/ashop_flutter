import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopapp/constants/country_map.dart';
import 'package:shopapp/provider/constants/choose_country_key.dart';
import 'package:shopapp/provider/constants/choose_country_url.dart';
import 'package:shopapp/provider/constants/search_icon.dart';
import 'package:shopapp/provider/constants/search_text.dart';

class ChooseCountryPage extends ConsumerWidget {
  ChooseCountryPage({super.key});
  final searchController = TextEditingController();
  bool checkSearchIconStation = false;
  final _searchTextEditingController = TextEditingController();
  int count = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
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
          actions: [
            !ref.watch(searchIconProvider)
                ? IconButton(
                    onPressed: () {
                      ref
                          .read(searchIconProvider.notifier)
                          .update((state) => true);
                    },
                    icon:
                        const Icon(CupertinoIcons.search, color: Colors.black))
                : Container()
          ],
        ),
        body: Column(
          children: [
            ref.watch(searchIconProvider)
                ? Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(240, 241, 245, 1.0),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.only(top: 15, bottom: 15, left: 15),
                          child: Icon(
                            CupertinoIcons.search,
                            color: Color.fromRGBO(200, 200, 211, 1.0),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            onChanged: (value) {
                              ref
                                  .read(searchTextProvider.notifier)
                                  .update((state) => value);
                            },
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 15.0),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            searchController.clear();
                            ref
                                .read(searchTextProvider.notifier)
                                .update((state) => '');
                          },
                          child: const Padding(
                            padding:
                                EdgeInsets.only(top: 15, bottom: 15, right: 15),
                            child: Icon(
                              CupertinoIcons.clear_circled_solid,
                              color: Color.fromRGBO(200, 200, 211, 1.0),
                            ),
                          ),
                        ),
                      ],
                    ))
                : Container(),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  for (int i = 0; i < countryMap.length; i++) ...{
                    if (countryMap[i]['countryName']
                        .toString()
                        .toLowerCase()
                        .contains(
                            ref.watch(searchTextProvider).toLowerCase())) ...{
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: GestureDetector(
                          child: GestureDetector(
                            onTap: () {
                              ref.read(chooseCountryUrl.notifier).update(
                                    (state) => countryMap[i]['countryFlagUrl']
                                        .toString(),
                                  );
                              ref.read(chooseCountryKey.notifier).update(
                                    (state) =>
                                        countryMap[i]['countryKey'].toString(),
                                  );
                              Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 12),
                                      width: 24,
                                      height: 17,
                                      child: SvgPicture.asset(
                                        countryMap[i]['countryFlagUrl']
                                            .toString(),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      countryMap[i]['countryName'].toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                const Icon(
                                  CupertinoIcons.check_mark,
                                  size: 20,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        child: const Divider(
                          height: 1,
                          color: Colors.grey,
                        ),
                      )
                    }
                  },
                ],
              ),
            ),
          ],
        ));
  }
}

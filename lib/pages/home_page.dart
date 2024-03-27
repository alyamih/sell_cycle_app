import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sell_cycle_app/model/unnecessary_item.dart';
import 'package:sell_cycle_app/pages/add_faults_page.dart';
import 'package:sell_cycle_app/pages/add_item_page.dart';
import 'package:sell_cycle_app/pages/description_item_page.dart';
import 'package:sell_cycle_app/pages/news_page.dart';
import 'package:sell_cycle_app/pages/settings_page.dart';
import 'package:uuid/uuid.dart';

List<UnnecessaryItem> unnecessaryItems = [];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getSP(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE4E4E4),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 65, 16, 11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const SettingsPage()),
                  );
                },
                child: const Text(
                  'Settings',
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Color(0xFFFE764B),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => const NewsPage()),
                  );
                },
                child: const Text(
                  'News',
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Color(0xFFFE764B),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              InkWell(
                onTap: () {
                  currentUnnecessaryItem = UnnecessaryItem();
                  currentUnnecessaryItem.id = const Uuid().v1();
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => AddItemPage(
                              isEditMode: false,
                              id: currentUnnecessaryItem.id!,
                            )),
                  );
                },
                child: const Text(
                  'Add item',
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Color(0xFFFE764B),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  'Unnecessary items',
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      height: 1,
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.w900),
                ),
              )
            ],
          ),
        ),
        if (unnecessaryItems.isNotEmpty)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Row(
              children: [
                Text(
                  'Stats',
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Colors.black.withOpacity(0.4),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        if (unnecessaryItems.isNotEmpty)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 32),
                          child: Image.asset('assets/sofa.png'),
                        ),
                        Text(
                          'Item added',
                          style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: Colors.black.withOpacity(0.4),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          unnecessaryItems.length.toString(),
                          style: const TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 32),
                          child: Image.asset('assets/cost.png'),
                        ),
                        Text(
                          'Amount price item',
                          style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: Colors.black.withOpacity(0.4),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          totalPrice(),
                          style: const TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        if (unnecessaryItems.isNotEmpty)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Row(
              children: [
                Text(
                  'Items',
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Colors.black.withOpacity(0.4),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        unnecessaryItems.isNotEmpty
            ? Expanded(
                child: SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: getUnnecessaryItems(),
                )),
              )
            : Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 32),
                                child: Image.asset('assets/warn.png'),
                              ),
                              Text(
                                'If you have items that you no longer use or are ready to sell, add them here.',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    color: Colors.black.withOpacity(0.4),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              )
                            ]),
                      ),
                    )
                  ],
                ),
              )
      ]),
    );
  }

  String totalPrice() {
    int totalPrice = 0;
    for (var unnecessaryItem in unnecessaryItems) {
      totalPrice = totalPrice + unnecessaryItem.price!.toInt();
    }
    return '${totalPrice.toString()}\$';
  }

  Widget getUnnecessaryItems() {
    List<Widget> list = [];
    for (var unnecessaryItem in unnecessaryItems) {
      list.add(InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
                builder: (BuildContext context) => DescriptionItemPage(
                      currentItem: unnecessaryItem,
                    )),
          );
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: recordedImages
                      .where((element) => element.id == unnecessaryItem.id)
                      .isNotEmpty
                  ? getPhotos(unnecessaryItem)
                  : const Text(
                      'No photos',
                      style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    '${unnecessaryItem.price!.toStringAsFixed(0)}\$',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                  decoration: BoxDecoration(
                      color: const Color(0xFFFE764B).withOpacity(0.14),
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    unnecessaryItem.state!.text,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: Color(0xFFFE764B),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                unnecessaryItem.name!,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontFamily: 'SF Pro Text',
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Faults',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    color: Colors.black.withOpacity(0.4),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            getFaults(unnecessaryItem)
          ]),
        ),
      ));
      list.add(const SizedBox(
        height: 8,
      ));
    }
    return Column(
      children: list,
    );
  }

  Widget getPhotos(UnnecessaryItem item) {
    List<Widget> list = [];
    list.add(
      Expanded(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.file(
            fit: BoxFit.cover,
            File(
              recordedImages
                  .where((element) => element.id == item.id)
                  .first
                  .photo!,
            ),
            height: 167,
          ),
        ),
      ),
    );
    if (recordedImages.where((element) => element.id == item.id).length > 1) {
      list.add(const SizedBox(
        width: 8,
      ));
    }
    if (recordedImages.where((element) => element.id == item.id).length > 1) {
      list.add(
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                fit: BoxFit.cover,
                File(
                  recordedImages
                      .where((element) => element.id == item.id)
                      .elementAt(1)
                      .photo!,
                ),
                height: 167,
                width: 167,
              ),
            ),
            Container(
              height: 167,
              width: 167,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black.withOpacity(0.5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '+ ${(recordedImages.where((element) => element.id == item.id).length - 1).toString()}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
    list.add(const SizedBox(
      width: 8,
    ));

    return Row(
      children: list,
    );
  }

  Widget getFaults(UnnecessaryItem item) {
    List<Widget> list = [];
    for (var fault in faults.where((element) => element.id == item.id)) {
      list.add(
        Container(
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.06),
              borderRadius: BorderRadius.circular(8)),
          child: Text(
            fault.title!,
            textAlign: TextAlign.start,
            style: const TextStyle(
                fontFamily: 'SF Pro Text',
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ),
      );
      list.add(const SizedBox(
        width: 8,
      ));
    }
    return Row(
      children: list,
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sell_cycle_app/model/unnecessary_item.dart';
import 'package:sell_cycle_app/pages/add_faults_page.dart';
import 'package:sell_cycle_app/pages/add_item_page.dart';
import 'package:sell_cycle_app/pages/home_page.dart';

class DescriptionItemPage extends StatefulWidget {
  const DescriptionItemPage({super.key, required this.currentItem});
  final UnnecessaryItem currentItem;

  @override
  State<DescriptionItemPage> createState() => _DescriptionItemPageState();
}

class _DescriptionItemPageState extends State<DescriptionItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE4E4E4),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 60, 16, 17),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.chevron_left,
                      color: Color(0xFFFE764B),
                    ),
                    Text(
                      'Back',
                      style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          color: Color(0xFFFE764B),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  const Text(
                    'Unnecessary items',
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    widget.currentItem.name!,
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  currentUnnecessaryItem = widget.currentItem;
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => AddItemPage(
                              isEditMode: true,
                              id: currentUnnecessaryItem.id!,
                            )),
                  );
                },
                child: const Text(
                  'Edit',
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Color(0xFFFE764B),
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        recordedImages
                                .where((element) =>
                                    element.id == widget.currentItem.id)
                                .isEmpty
                            ? const Text(
                                'No photos',
                                style: TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              )
                            : recordedImages
                                        .where((element) =>
                                            element.id == widget.currentItem.id)
                                        .length ==
                                    1
                                ? Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: getPhotos(widget.currentItem),
                                  )
                                : SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: getPhotos(widget.currentItem),
                                    ),
                                  ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  widget.currentItem.name!,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      fontFamily: 'SF Pro Text',
                                      height: 1,
                                      color: Colors.black,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Row(
                                  children: [
                                    Container(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                      decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.06),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Text(
                                        '${widget.currentItem.price!.toStringAsFixed(0)}\$',
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
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                      decoration: BoxDecoration(
                                          color: const Color(0xFFFE764B)
                                              .withOpacity(0.14),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Text(
                                        widget.currentItem.state!.text,
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
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, top: 16),
                  child: Row(
                    children: [
                      Text(
                        'Faults',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            color: Colors.black.withOpacity(0.4),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                getFaults(widget.currentItem)
              ],
            ),
          )),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: InkWell(
            onTap: () {
              unnecessaryItems.removeWhere(
                  (element) => element.id == widget.currentItem.id);
              addDataToSP();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePage()),
                  (route) => false);
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                  color: const Color(0xFFFE764B),
                  borderRadius: BorderRadius.circular(12)),
              child: const Text(
                'Delete',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget getFaults(UnnecessaryItem item) {
    List<Widget> list = [];
    for (var fault in faults.where((element) => element.id == item.id)) {
      list.add(
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fault.title!,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontFamily: 'SF Pro Text',
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                fault.subtitle!,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    color: Colors.black.withOpacity(0.4),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      );
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
    if (recordedImages.where((element) => element.id == item.id).length == 1) {
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
    } else {
      for (var photo
          in recordedImages.where((element) => element.id == item.id)) {
        list.add(
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.file(
              fit: BoxFit.cover,
              File(
                photo.photo!,
              ),
              height: 167,
              width: 167,
            ),
          ),
        );
        list.add(const SizedBox(
          width: 8,
        ));
      }
    }

    return Row(
      children: list,
    );
  }
}

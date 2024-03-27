import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sell_cycle_app/model/fault_item.dart';
import 'package:sell_cycle_app/model/photo_item.dart';
import 'package:sell_cycle_app/model/unnecessary_item.dart';
import 'package:sell_cycle_app/pages/add_item_page.dart';
import 'package:sell_cycle_app/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<FaultItem> faults = [];

class AddFaultsPage extends StatefulWidget {
  const AddFaultsPage({super.key, required this.id, required this.isEditMode});
  final String id;
  final bool isEditMode;
  @override
  State<AddFaultsPage> createState() => _AddFaultsPageState();
}

class _AddFaultsPageState extends State<AddFaultsPage> {
  TextEditingController titleController1 = TextEditingController();
  TextEditingController subTitleController1 = TextEditingController();
  TextEditingController titleController2 = TextEditingController();
  TextEditingController subTitleController2 = TextEditingController();
  TextEditingController titleController3 = TextEditingController();
  TextEditingController subTitleController3 = TextEditingController();
  TextEditingController titleController4 = TextEditingController();
  TextEditingController subTitleController4 = TextEditingController();
  TextEditingController titleController5 = TextEditingController();
  TextEditingController subTitleController5 = TextEditingController();
  TextEditingController titleController6 = TextEditingController();
  TextEditingController subTitleController6 = TextEditingController();
  TextEditingController currenttitleController = TextEditingController();
  TextEditingController currentsubTitleController = TextEditingController();
  List<FaultItem> newFaults = [];
  int faultCount = 1;
  @override
  void initState() {
    super.initState();
    int count = 0;
    for (var fault
        in faults.where((element) => element.id == currentUnnecessaryItem.id)) {
      count++;
      if (count == 1) {
        titleController1.text = fault.title!;
        subTitleController1.text = fault.subtitle!;
      } else if (count == 2) {
        titleController2.text = fault.title!;
        subTitleController2.text = fault.subtitle!;
      } else if (count == 3) {
        titleController3.text = fault.title!;
        subTitleController3.text = fault.subtitle!;
      } else if (count == 4) {
        titleController4.text = fault.title!;
        subTitleController4.text = fault.subtitle!;
      } else if (count == 5) {
        titleController5.text = fault.title!;
        subTitleController5.text = fault.subtitle!;
      } else if (count == 6) {
        titleController6.text = fault.title!;
        subTitleController6.text = fault.subtitle!;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE4E4E4),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 60, 16, 27),
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
                    'Add item',
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Faults',
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const Text(
                'Add item',
                style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    color: Color(0xFFE4E4E4),
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
              child: Column(
            children: [
              widget.isEditMode ? getfaultsOfBrokenItem() : getfaults(),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                child: InkWell(
                  onTap: () {
                    if (!widget.isEditMode) {
                      if (subTitleController1.text.isNotEmpty &&
                          titleController1.text.isNotEmpty) {
                        faultCount++;
                        for (var i = 0; i < faultCount; i++) {
                          newFaults.add(FaultItem(id: widget.id, title: ''));
                        }
                        setState(() {});
                      }
                    } else {
                      faults.add(
                          FaultItem(title: '', id: currentUnnecessaryItem.id));
                      setState(() {});
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(13),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: (subTitleController1.text.isNotEmpty &&
                                titleController1.text.isNotEmpty)
                            ? Colors.white
                            : const Color(0xFFDBDBDB)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add,
                            color: (subTitleController1.text.isNotEmpty &&
                                    titleController1.text.isNotEmpty)
                                ? const Color(0xFFFE764B)
                                : Colors.black.withOpacity(0.25)),
                        Text(
                          'Add fault',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: (subTitleController1.text.isNotEmpty &&
                                      titleController1.text.isNotEmpty)
                                  ? const Color(0xFFFE764B)
                                  : Colors.black.withOpacity(0.25),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
          child: InkWell(
            onTap: () {
              if (widget.isEditMode) {
                int count = 0;
                for (var fault in faults.where(
                    (element) => element.id == currentUnnecessaryItem.id)) {
                  count++;
                  if (count == 1) {
                    fault.title = titleController1.text;
                    fault.subtitle = subTitleController1.text;
                  } else if (count == 2) {
                    fault.title = titleController2.text;
                    fault.subtitle = subTitleController2.text;
                  } else if (count == 3) {
                    fault.title = titleController3.text;
                    fault.subtitle = subTitleController3.text;
                  } else if (count == 4) {
                    fault.title = titleController4.text;
                    fault.subtitle = subTitleController4.text;
                  } else if (count == 5) {
                    fault.title = titleController5.text;
                    fault.subtitle = subTitleController5.text;
                  } else if (count == 6) {
                    fault.title = titleController6.text;
                    fault.subtitle = subTitleController6.text;
                  }
                }
              } else {
                if (titleController1.text.isNotEmpty &&
                    subTitleController1.text.isNotEmpty) {
                  FaultItem fault = FaultItem();
                  fault.id = widget.id;
                  fault.subtitle = subTitleController1.text;
                  fault.title = titleController1.text;
                  faults.add(fault);
                }
                if (titleController2.text.isNotEmpty &&
                    subTitleController2.text.isNotEmpty) {
                  FaultItem fault = FaultItem();
                  fault.id = widget.id;
                  fault.subtitle = subTitleController2.text;
                  fault.title = titleController2.text;
                  faults.add(fault);
                }
                if (titleController3.text.isNotEmpty &&
                    subTitleController3.text.isNotEmpty) {
                  FaultItem fault = FaultItem();
                  fault.id = widget.id;
                  fault.subtitle = subTitleController3.text;
                  fault.title = titleController3.text;
                  faults.add(fault);
                }
                if (titleController4.text.isNotEmpty &&
                    subTitleController4.text.isNotEmpty) {
                  FaultItem fault = FaultItem();
                  fault.id = widget.id;
                  fault.subtitle = subTitleController4.text;
                  fault.title = titleController4.text;
                  faults.add(fault);
                }
                if (titleController5.text.isNotEmpty &&
                    subTitleController5.text.isNotEmpty) {
                  FaultItem fault = FaultItem();
                  fault.id = widget.id;
                  fault.subtitle = subTitleController5.text;
                  fault.title = titleController5.text;
                  faults.add(fault);
                }
                if (titleController6.text.isNotEmpty &&
                    subTitleController6.text.isNotEmpty) {
                  FaultItem fault = FaultItem();
                  fault.id = widget.id;
                  fault.subtitle = subTitleController6.text;
                  fault.title = titleController6.text;
                  faults.add(fault);
                }
              }
              if ((faultCount == 1 &&
                      titleController1.text.isNotEmpty &&
                      subTitleController1.text.isNotEmpty) ||
                  (faultCount == 2 &&
                      titleController2.text.isNotEmpty &&
                      subTitleController2.text.isNotEmpty) ||
                  (faultCount == 3 &&
                      titleController3.text.isNotEmpty &&
                      subTitleController3.text.isNotEmpty) ||
                  (faultCount == 4 &&
                      titleController4.text.isNotEmpty &&
                      subTitleController4.text.isNotEmpty) ||
                  (faultCount == 5 &&
                      titleController5.text.isNotEmpty &&
                      subTitleController5.text.isNotEmpty) ||
                  (faultCount == 6 &&
                      titleController6.text.isNotEmpty &&
                      subTitleController6.text.isNotEmpty)) {
                if (widget.isEditMode) {
                  unnecessaryItems.removeWhere(
                      (element) => element.id == currentUnnecessaryItem.id);
                }
                unnecessaryItems.add(currentUnnecessaryItem);
                addDataToSP();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                    (route) => false);
              }
            },
            child: Container(
              padding: const EdgeInsets.all(13),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: (faultCount == 1 &&
                              titleController1.text.isNotEmpty &&
                              subTitleController1.text.isNotEmpty) ||
                          (faultCount == 2 &&
                              titleController2.text.isNotEmpty &&
                              subTitleController2.text.isNotEmpty) ||
                          (faultCount == 3 &&
                              titleController3.text.isNotEmpty &&
                              subTitleController3.text.isNotEmpty) ||
                          (faultCount == 4 &&
                              titleController4.text.isNotEmpty &&
                              subTitleController4.text.isNotEmpty) ||
                          (faultCount == 5 &&
                              titleController5.text.isNotEmpty &&
                              subTitleController5.text.isNotEmpty) ||
                          (faultCount == 6 &&
                              titleController6.text.isNotEmpty &&
                              subTitleController6.text.isNotEmpty)
                      ? const Color(0xFFFE764B)
                      : const Color(0xFFDBDBDB)),
              child: Text(
                'Done',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    color: (faultCount == 1 &&
                                titleController1.text.isNotEmpty &&
                                subTitleController1.text.isNotEmpty) ||
                            (faultCount == 2 &&
                                titleController2.text.isNotEmpty &&
                                subTitleController2.text.isNotEmpty) ||
                            (faultCount == 3 &&
                                titleController3.text.isNotEmpty &&
                                subTitleController3.text.isNotEmpty) ||
                            (faultCount == 4 &&
                                titleController4.text.isNotEmpty &&
                                subTitleController4.text.isNotEmpty) ||
                            (faultCount == 5 &&
                                titleController5.text.isNotEmpty &&
                                subTitleController5.text.isNotEmpty) ||
                            (faultCount == 6 &&
                                titleController6.text.isNotEmpty &&
                                subTitleController6.text.isNotEmpty)
                        ? Colors.white
                        : Colors.black.withOpacity(0.25),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        )
      ]),
    );
  }

  Widget getfaultsOfBrokenItem() {
    List<Widget> list = [];
    int count = 0;
    for (var fault
        in faults.where((element) => element.id == currentUnnecessaryItem.id)) {
      count++;
      if (count == 1) {
        currenttitleController = titleController1;
        currentsubTitleController = subTitleController1;
      } else if (count == 2) {
        currenttitleController = titleController2;
        currentsubTitleController = subTitleController2;
      } else if (count == 3) {
        currenttitleController = titleController3;
        currentsubTitleController = subTitleController3;
      } else if (count == 4) {
        currenttitleController = titleController4;
        currentsubTitleController = subTitleController4;
      } else if (count == 5) {
        currenttitleController = titleController5;
        currentsubTitleController = subTitleController5;
      } else if (count == 6) {
        currenttitleController = titleController6;
        currentsubTitleController = subTitleController6;
      }

      list.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        'fault $count',
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Flexible(
                      child: InkWell(
                        onTap: () {
                          faults.remove(fault);
                          setState(() {});
                        },
                        child: const Text(
                          'Delete',
                          style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: Color(0xFFFE764B),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TextField(
                cursorColor: Colors.grey,
                controller: currenttitleController,
                style: const TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
                decoration: InputDecoration(
                  hintText: 'Title',
                  hintStyle: TextStyle(
                      fontFamily: 'SF Pro Text',
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.25)),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Color(0xFFECECEC), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Color(0xFFECECEC), width: 1),
                  ),
                ),
                onChanged: (text) {
                  currenttitleController.text = text;
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                cursorColor: Colors.grey,
                maxLines: 4,
                controller: currentsubTitleController,
                style: const TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
                decoration: InputDecoration(
                  hintText: 'Subtitle',
                  hintStyle: TextStyle(
                      fontFamily: 'SF Pro Text',
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.25)),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Color(0xFFECECEC), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Color(0xFFECECEC), width: 1),
                  ),
                ),
                onChanged: (text) {
                  currentsubTitleController.text = text;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      );
      list.add(const SizedBox(
        height: 16,
      ));
    }
    return Column(
      children: list,
    );
  }

  Widget getfaults() {
    List<Widget> list = [];

    for (var i = 0; i < faultCount; i++) {
      if (i == 0) {
        currenttitleController = titleController1;
        currentsubTitleController = subTitleController1;
      } else if (i == 1) {
        currenttitleController = titleController2;
        currentsubTitleController = subTitleController2;
      } else if (i == 2) {
        currenttitleController = titleController3;
        currentsubTitleController = subTitleController3;
      } else if (i == 3) {
        currenttitleController = titleController4;
        currentsubTitleController = subTitleController4;
      } else if (i == 4) {
        currenttitleController = titleController5;
        currentsubTitleController = subTitleController5;
      } else if (i == 5) {
        currenttitleController = titleController6;
        currentsubTitleController = subTitleController6;
      }

      list.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        'fault ${i + 1}',
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    if (i != 0)
                      Flexible(
                        child: InkWell(
                          onTap: () {
                            faultCount--;

                            setState(() {});
                          },
                          child: const Text(
                            'Delete',
                            style: TextStyle(
                                fontFamily: 'SF Pro Text',
                                color: Color(0xFFFE764B),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              TextField(
                cursorColor: Colors.grey,
                controller: currenttitleController,
                style: const TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
                decoration: InputDecoration(
                  hintText: 'Title',
                  hintStyle: TextStyle(
                      fontFamily: 'SF Pro Text',
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.25)),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Color(0xFFECECEC), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Color(0xFFECECEC), width: 1),
                  ),
                ),
                onChanged: (text) {
                  currenttitleController.text = text;
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                cursorColor: Colors.grey,
                maxLines: 4,
                controller: currentsubTitleController,
                style: const TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
                decoration: InputDecoration(
                  hintText: 'Subtitle',
                  hintStyle: TextStyle(
                      fontFamily: 'SF Pro Text',
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.25)),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Color(0xFFECECEC), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Color(0xFFECECEC), width: 1),
                  ),
                ),
                onChanged: (text) {
                  currentsubTitleController.text = text;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      );
      list.add(const SizedBox(
        height: 16,
      ));
    }
    return Column(
      children: list,
    );
  }
}

Future<void> addDataToSP() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('recordedImages', jsonEncode(recordedImages));
  prefs.setString('unnecessaryItems', jsonEncode(unnecessaryItems));
  prefs.setString('faults', jsonEncode(faults));
}

void getDataFromSP(Function() callBack) async {
  final prefs = await SharedPreferences.getInstance();
  final List<dynamic> jsonData =
      jsonDecode(prefs.getString('recordedImages') ?? '[]');
  final List<dynamic> jsonData1 =
      jsonDecode(prefs.getString('unnecessaryItems') ?? '[]');
  final List<dynamic> jsonData2 = jsonDecode(prefs.getString('faults') ?? '[]');

  recordedImages = jsonData.map<PhotoItem>((jsonList) {
    {
      return PhotoItem.fromJson(jsonList);
    }
  }).toList();

  unnecessaryItems = jsonData1.map<UnnecessaryItem>((jsonList) {
    {
      return UnnecessaryItem.fromJson(jsonList);
    }
  }).toList();
  faults = jsonData2.map<FaultItem>((jsonList) {
    {
      return FaultItem.fromJson(jsonList);
    }
  }).toList();
  callBack();
}

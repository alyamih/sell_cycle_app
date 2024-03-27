import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sell_cycle_app/model/photo_item.dart';
import 'package:sell_cycle_app/model/unnecessary_item.dart';
import 'package:sell_cycle_app/pages/choose_type_page.dart';
import 'package:sell_cycle_app/pages/home_page.dart';

UnnecessaryItem currentUnnecessaryItem = UnnecessaryItem();
List<PhotoItem> recordedImages = [];

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key, required this.isEditMode, required this.id});
  final bool isEditMode;
  final String id;
  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  String recordedImageString = '';

  late File _image;
  final picker = ImagePicker();
  @override
  void initState() {
    super.initState();
    if (widget.isEditMode) {
      nameController.text = currentUnnecessaryItem.name!;
      priceController.text = currentUnnecessaryItem.price!.toStringAsFixed(0);
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
                  unnecessaryItems.removeWhere(
                      (element) => element.id == currentUnnecessaryItem.id);
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
              const Text(
                'Add item',
                style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
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
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Text(
                        'Image',
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      children: [
                        recordedImages
                                .where((element) =>
                                    element.id == currentUnnecessaryItem.id)
                                .isEmpty
                            ? Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8, 47, 8, 63),
                                child: Text(
                                  'Please add a photo so that this item can be added to unneeded items in the future.',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontFamily: 'SF Pro Text',
                                      color: Colors.black.withOpacity(0.4),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            : SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: getPhotos(),
                                ),
                              ),
                        InkWell(
                          onTap: () async {
                            final pickedFile = await picker.pickImage(
                                source: ImageSource.gallery);

                            setState(() {
                              if (pickedFile != null) {
                                _image = File(pickedFile.path);
                                PhotoItem item = PhotoItem();
                                if (widget.isEditMode) {
                                  item.id = currentUnnecessaryItem.id;
                                } else {
                                  item.id = widget.id;
                                }

                                item.photo = _image.path;
                                recordedImages.add(item);
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.06),
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/upload.png'),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Load photo',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: 'SF Pro Text',
                                        color: Colors.black.withOpacity(0.4),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ]),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Text(
                        'Name',
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TextField(
                    cursorColor: Colors.grey,
                    controller: nameController,
                    style: const TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.14)),
                      hintText: 'Item name',
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (text) {
                      nameController.text = text;
                      setState(() {});
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Text(
                        'Price',
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TextField(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.grey,
                    controller: priceController,
                    style: const TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.14)),
                      hintText: 'Price item',
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (text) {
                      priceController.text = text;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          )),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: InkWell(
            onTap: () {
              if (nameController.text.isNotEmpty &&
                  priceController.text.isNotEmpty &&
                  !widget.isEditMode) {
                currentUnnecessaryItem.name = nameController.text;
                currentUnnecessaryItem.price =
                    double.parse(priceController.text);

                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => ChooseTypePage(
                            id: currentUnnecessaryItem.id!,
                            isEditMode: widget.isEditMode,
                          )),
                );
              } else if (nameController.text.isNotEmpty &&
                  priceController.text.isNotEmpty &&
                  widget.isEditMode) {
                currentUnnecessaryItem.name = nameController.text;
                currentUnnecessaryItem.price =
                    double.parse(priceController.text);
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => ChooseTypePage(
                            id: currentUnnecessaryItem.id!,
                            isEditMode: widget.isEditMode,
                          )),
                );
              }
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                  color: nameController.text.isNotEmpty &&
                          priceController.text.isNotEmpty
                      ? const Color(0xFFFE764B)
                      : Colors.black.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                'Next',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    color: nameController.text.isNotEmpty &&
                            priceController.text.isNotEmpty
                        ? Colors.white
                        : Colors.black.withOpacity(0.14),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget getPhotos() {
    List<Widget> list = [];
    for (var photo
        in recordedImages.where((element) => element.id == widget.id)) {
      list.add(
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  fit: BoxFit.cover,
                  File(
                    photo.photo!,
                  ),
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: InkWell(
                  onTap: () {
                    recordedImages.remove(photo);
                    setState(() {});
                  },
                  child: const Text(
                    'Delete',
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: Color(0xFFFE764B),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  )),
            )
          ],
        ),
      );
      list.add(const SizedBox(
        width: 16,
      ));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: list,
    );
  }
}

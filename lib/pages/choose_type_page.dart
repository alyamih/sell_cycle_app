import 'package:flutter/material.dart';
import 'package:sell_cycle_app/model/unnecessary_item.dart';
import 'package:sell_cycle_app/pages/add_faults_page.dart';
import 'package:sell_cycle_app/pages/add_item_page.dart';

class ChooseTypePage extends StatefulWidget {
  const ChooseTypePage({super.key, required this.id, required this.isEditMode});
  final String id;
  final bool isEditMode;

  @override
  State<ChooseTypePage> createState() => _ChooseTypePageState();
}

class _ChooseTypePageState extends State<ChooseTypePage> {
  String selected = '';
  List<EState> typesList = [EState.newType, EState.usedType];
  @override
  void initState() {
    super.initState();
    if (widget.isEditMode) {
      selected = currentUnnecessaryItem.state!.text;
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
            child: getTypes(),
          )),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: InkWell(
            onTap: () {
              currentUnnecessaryItem.state =
                  typesList.firstWhere((element) => element.text == selected);
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                    builder: (BuildContext context) => AddFaultsPage(
                          id: widget.id,
                          isEditMode: widget.isEditMode,
                        )),
              );
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                  color: selected.isNotEmpty
                      ? const Color(0xFFFE764B)
                      : Colors.black.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                'Next',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    color: selected.isNotEmpty
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

  Widget getTypes() {
    List<Widget> list = [];
    for (var type in typesList) {
      list.add(InkWell(
        onTap: () {
          selected = type.text;
          setState(() {});
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
          decoration: BoxDecoration(
              color: selected == type.text
                  ? Colors.white
                  : Colors.black.withOpacity(0.06),
              borderRadius: BorderRadius.circular(12)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              type.text,
              textAlign: TextAlign.start,
              style: const TextStyle(
                  fontFamily: 'SF Pro Text',
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            selected == type.text
                ? Image.asset('assets/check.png')
                : Padding(
                    padding: const EdgeInsets.only(right: 1),
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.black.withOpacity(0.14), width: 2)),
                    ),
                  )
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
}

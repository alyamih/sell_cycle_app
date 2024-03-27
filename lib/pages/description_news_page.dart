import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sell_cycle_app/model/news_item.dart';

class DescriptionNewsPage extends StatefulWidget {
  const DescriptionNewsPage({
    super.key,
    required this.news,
  });
  final NewsItem news;

  @override
  State<DescriptionNewsPage> createState() => _DescriptionNewsPageState();
}

class _DescriptionNewsPageState extends State<DescriptionNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE4E4E4),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 65, 16, 26),
            child: InkWell(
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
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 11),
                      child: Container(
                        height: 178,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: CachedNetworkImageProvider(
                                  widget.news.image!,
                                ))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        widget.news.title!,
                        style: const TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Text(
                      widget.news.text!,
                      style: const TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

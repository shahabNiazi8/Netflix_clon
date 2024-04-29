import 'package:flutter/material.dart';
import 'package:netflix_clon/models/content_model.dart';

class ContentList extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  final bool isOrignals;
  const ContentList(
      {super.key,
      required this.title,
      required this.contentList,
      this.isOrignals = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: isOrignals ? 500 : 220,
            child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: contentList.length,
                itemBuilder: (BuildContext context, index) {
                  final Content content = contentList[index];
                  return GestureDetector(
                    onTap: () => print(content.name),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      height: isOrignals ? 400 : 200,
                      width: isOrignals ? 200 : 130,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(content.imageUrl),
                              fit: BoxFit.cover)),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:serenify/presentations/pages/articles/detail_article_page.dart';
import 'package:serenify/styles/my_colors.dart';
import 'package:serenify/styles/my_text.dart';

class CardArticle extends StatelessWidget {
  const CardArticle(
      {super.key,
      required this.image,
      required this.title,
      required this.content,
      required this.id});
  final String image;
  final String title;
  final String content;
  final String id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return DetailArticlePage(
                title: title, image: image, content: content);
          },
        ));
      },
      child: Container(
        width: double.infinity,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          shadows: const [
            BoxShadow(
              color: Color(0x23295BFF),
              blurRadius: 3.50,
              offset: Offset(0, 3.50),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Image.network(
                image,
                width: 78,
                height: 78,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: MyTextStyle.h7semi(color: Colors.black),
                  ),
                  Text(
                    "${content.substring(0, 50)}...",
                    style: MyTextStyle.h8reg(color: MyColors.gray300),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

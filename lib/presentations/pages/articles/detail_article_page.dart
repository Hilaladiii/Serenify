import 'package:flutter/material.dart';
import 'package:serenify/styles/my_text.dart';

class DetailArticlePage extends StatelessWidget {
  const DetailArticlePage(
      {super.key,
      required this.title,
      required this.image,
      required this.content});

  final String title;
  final String image;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height / 3,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.black.withOpacity(0.4)),
                child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.4), BlendMode.dstATop),
                    child: Image.network(image)),
              ),
              Positioned(
                  left: 3,
                  right: 3,
                  bottom: 0,
                  child: Text(
                    title,
                    style: MyTextStyle.h4bold(color: Colors.white),
                  ))
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
            margin: const EdgeInsets.only(top: 10),
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              shadows: [
                BoxShadow(
                  color: Color(0x23295BFF),
                  blurRadius: 3.50,
                  offset: Offset(0, 3.50),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Text(
              content,
              style: MyTextStyle.h7reg(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}

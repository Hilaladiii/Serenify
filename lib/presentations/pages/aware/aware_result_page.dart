import 'package:flutter/material.dart';
import 'package:serenify/presentations/pages/articles/article_page.dart';
import 'package:serenify/presentations/pages/aware/widgets/card_activity.dart';
import 'package:serenify/presentations/pages/community/community_page.dart';
import 'package:serenify/presentations/pages/relaxation/relaxation_page.dart';
import 'package:serenify/presentations/pages/seminar/seminar_page.dart';
import 'package:serenify/styles/my_colors.dart';
import 'package:serenify/styles/my_text.dart';

class AwareResultPage extends StatelessWidget {
  const AwareResultPage({
    super.key,
    required this.score,
    required this.description,
  });

  final int score;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hasil',
          style: MyTextStyle.h5semi(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mental Awareness kamu berada pada level',
                style: MyTextStyle.h7reg(color: MyColors.gray400),
              ),
              Text(
                score < 65 ? "Rendah" : "Tinggi",
                style: MyTextStyle.h11bold(
                    color: score < 65
                        ? MyColors.primaryBase
                        : MyColors.quaternary200),
              ),
              const SizedBox(
                height: 14,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: score < 65
                        ? MyColors.primaryBase
                        : MyColors.quaternary200),
                child: Text(
                  description,
                  style: MyTextStyle.h8reg(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Text(
                'Aktivitas Untukmu',
                style: MyTextStyle.h4semi(color: Colors.black),
              ),
              const CardActivity(
                  title: "Artikel",
                  description:
                      "Jelajahi berbagai artikel edukatif yang menyajikan tips , teknik relaksasi, dan saran aktivitas",
                  image: "article",
                  navigate: ArticlePage()),
              const SizedBox(
                height: 16,
              ),
              const CardActivity(
                  title: "Podcast",
                  description:
                      "Temukan wawasan baru melalui serangkaian episode untuk kesejahteraan emosional kamu",
                  image: "podcast",
                  navigate: RelaxationPage()),
              const SizedBox(
                height: 16,
              ),
              const CardActivity(
                  title: "Seminar",
                  description:
                      "Bergabunglah dalam rangkaian seminar yang informatif   menuju kehidupan yang lebih bermakna",
                  image: "seminar",
                  navigate: SeminarPage()),
              const SizedBox(
                height: 16,
              ),
              const CardActivity(
                  title: "Jelajahi Fitur Komunitas",
                  description:
                      "Aktif membaca postingan pada fitur komunitas  hingga mengikuti diskusi yang mendalam",
                  image: "community",
                  navigate: CommunityPage()),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

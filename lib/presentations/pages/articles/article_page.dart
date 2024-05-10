import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serenify/bloc/article/article_bloc.dart';
import 'package:serenify/models/article_model.dart';
import 'package:serenify/presentations/pages/articles/widgets/card_article.dart';
import 'package:serenify/styles/my_text.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  void initState() {
    super.initState();
    context.read<ArticleBloc>().add(GetAllArticleEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Artikel Untukmu',
          style: MyTextStyle.h5semi(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ArticleBloc, ArticleState>(builder: (context, state) {
        if (state is GetAllArticleFetchSuccess) {
          List<ArticleModel> article = state.article;
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return CardArticle(
                      id: article[index].id,
                      title: article[index].title,
                      content: article[index].content,
                      image: article[index].photoLink,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: article.length));
        }
        if (state is GetAllArticleLoading) {
          return const Center(
            child: Text('Loading...'),
          );
        }
        if (state is GetAllArticleFailure) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}

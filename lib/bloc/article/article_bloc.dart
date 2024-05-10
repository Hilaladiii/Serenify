import 'package:flutter_bloc/flutter_bloc.dart';
import "package:flutter/foundation.dart";
import 'package:serenify/models/article_model.dart';
import 'package:serenify/repository/article_repository.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleRepository articleRepository = ArticleRepository();
  ArticleBloc() : super(ArticleInitial()) {
    on<GetAllArticleEvent>((event, emit) async {
      try {
        emit(GetAllArticleLoading());
        var response = await articleRepository.getAllArticle();
        emit(GetAllArticleFetchSuccess(article: response.articleData));
      } catch (e) {
        emit(GetAllArticleFailure(e.toString()));
      }
    });
    on<GetArticleByIdEvent>((event, emit) async {
      try {
        emit(GetArticleByIdLoading());
        var response = await articleRepository.getArticleById(id: event.id);
        emit(GetArticleByIdFetchSuccess(article: response));
      } catch (e) {
        emit(GetArticleByIdFailure(e.toString()));
      }
    });
  }
}

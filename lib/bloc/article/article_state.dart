part of 'article_bloc.dart';

@immutable
abstract class ArticleState {}

final class ArticleInitial extends ArticleState {}

final class GetAllArticleLoading extends ArticleState {}

final class GetAllArticleFetchSuccess extends ArticleState {
  final List<ArticleModel> article;
  GetAllArticleFetchSuccess({required this.article});
}

final class GetAllArticleFailure extends ArticleState {
  final String error;
  GetAllArticleFailure(this.error);
}

final class GetArticleByIdLoading extends ArticleState {}

final class GetArticleByIdFetchSuccess extends ArticleState {
  final ArticleModel article;
  GetArticleByIdFetchSuccess({required this.article});
}

final class GetArticleByIdFailure extends ArticleState {
  final String error;
  GetArticleByIdFailure(this.error);
}

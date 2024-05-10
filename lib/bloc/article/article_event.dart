part of 'article_bloc.dart';

@immutable
abstract class ArticleEvent {}

final class GetAllArticleEvent extends ArticleEvent {}

final class GetArticleByIdEvent extends ArticleEvent {
  final String id;
  GetArticleByIdEvent({required this.id});
}

part of 'seminar_bloc.dart';

@immutable
abstract class SeminarState {}

final class SeminarInitial extends SeminarState {}

final class GetAllSeminarFetchLoading extends SeminarState {}

final class GetSeminarByIdFetchLoading extends SeminarState {}

final class GetAllSeminarFetchSuccess extends SeminarState {
  final List<SeminarModel> seminar;
  GetAllSeminarFetchSuccess({required this.seminar});
}

final class GetAllSeminarFetchFailure extends SeminarState {
  final String error;
  GetAllSeminarFetchFailure(this.error);
}

final class GetSeminarByIdFetchSuccess extends SeminarState {
  final DetailSeminarModel seminar;
  GetSeminarByIdFetchSuccess({required this.seminar});
}

final class GetSeminarByIdFetchFailure extends SeminarState {
  final String error;
  GetSeminarByIdFetchFailure(this.error);
}

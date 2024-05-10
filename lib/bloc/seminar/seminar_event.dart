part of 'seminar_bloc.dart';

@immutable
abstract class SeminarEvent {}

final class GetAllSeminarEvent extends SeminarEvent {}

final class GetSeminarByIdEvent extends SeminarEvent {
  final String id;
  GetSeminarByIdEvent({required this.id});
}

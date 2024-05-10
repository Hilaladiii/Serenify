part of 'test_bloc.dart';

@immutable
abstract class TestEvent {}

final class TestEvaluateEvent extends TestEvent {
  final List<String> answers;
  final String token;
  TestEvaluateEvent({required this.answers, required this.token});
}

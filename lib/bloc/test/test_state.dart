part of 'test_bloc.dart';

@immutable
abstract class TestState {}

final class TestInitial extends TestState {}

final class TestFetchLoading extends TestState {}

final class TestFetchSucces extends TestState {
  final TestModel result;
  TestFetchSucces(this.result);
}

final class TestFetchFailed extends TestState {
  final String error;
  TestFetchFailed(this.error);
}

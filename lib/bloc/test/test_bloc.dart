import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:serenify/models/test_model.dart';
import 'package:serenify/repository/test_repository.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestRepository testRespository = TestRepository();
  TestBloc() : super(TestInitial()) {
    on<TestEvaluateEvent>((event, emit) async {
      try {
        emit(TestFetchLoading());
        var response = await testRespository.evaluateTest(
            answers: event.answers, token: event.token);
        if (response.message == 'answer evaluated successfully') {
          emit(TestFetchSucces(response));
        } else {
          TestFetchFailed(response.message);
        }
      } catch (e) {
        emit(TestFetchFailed(e.toString()));
      }
    });
  }
}

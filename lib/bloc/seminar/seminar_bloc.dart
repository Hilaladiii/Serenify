import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:serenify/models/seminar_model.dart';
import 'package:serenify/repository/seminar_repository.dart';

part 'seminar_event.dart';
part 'seminar_state.dart';

class SeminarBloc extends Bloc<SeminarEvent, SeminarState> {
  SeminarRepository seminarRepository = SeminarRepository();
  SeminarBloc() : super(SeminarInitial()) {
    on<GetAllSeminarEvent>((event, emit) async {
      try {
        emit(GetAllSeminarFetchLoading());
        var response = await seminarRepository.getAllSeminar();
        emit(GetAllSeminarFetchSuccess(seminar: response.seminarData));
      } catch (e) {
        emit(GetAllSeminarFetchFailure(e.toString()));
      }
    });
    on<GetSeminarByIdEvent>((event, emit) async {
      try {
        emit(GetSeminarByIdFetchLoading());
        var response = await seminarRepository.getSeminarById(id: event.id);
        emit(GetSeminarByIdFetchSuccess(seminar: response));
      } catch (e) {
        emit(GetSeminarByIdFetchFailure(e.toString()));
      }
    });
  }
}

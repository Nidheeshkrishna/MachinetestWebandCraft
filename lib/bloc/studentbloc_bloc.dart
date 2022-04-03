import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:machine_test_nidheeshkrishna/bloc/studentbloc_state.dart';
import 'package:machine_test_nidheeshkrishna/models/studentinfomodel.dart';
import 'package:machine_test_nidheeshkrishna/studentRepository/studentreposervice.dart';
import 'package:meta/meta.dart';

part 'studentbloc_event.dart';

class StudentblocBloc extends Bloc<StudentblocEvent, StudentblocState> {
  StudentRepository repository;
  StudentblocBloc({required this.repository}) : super(StudentInitialState()) {
    on<StudentblocEvent>((event, emit) async {
      if (event is FetchStudentEvent) {
        emit(StudentInitialState());
        try {
          List<Studentinfomodel> articles = await repository.getArticles();
          emit(StudentLoadedState(articles: articles));
        } catch (e) {
          emit(StudentErrorState(message: e.toString()));
        }
      }
    });
  }
}

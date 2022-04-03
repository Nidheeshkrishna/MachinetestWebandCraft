import 'package:equatable/equatable.dart';
import 'package:machine_test_nidheeshkrishna/models/studentinfomodel.dart';

class StudentblocState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class StudentInitialState extends StudentblocState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class StudentLoadingState extends StudentblocState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class StudentLoadedState extends StudentblocState {
  List<Studentinfomodel> articles;

  StudentLoadedState({required this.articles});

  @override
  // TODO: implement props
  List<Object> get props => [articles];
}

class StudentErrorState extends StudentblocState {
  String message;

  StudentErrorState({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}

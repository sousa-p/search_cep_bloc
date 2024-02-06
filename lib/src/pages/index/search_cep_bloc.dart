import 'dart:async';
import 'dart:core';  
import 'package:rxdart/rxdart.dart';
import 'package:search_cep_bloc/src/repositories/cep_repository.dart';

class SearchCepBloc {
  final _streamController = StreamController<String>.broadcast();
  final _repository = CepRepository();

  Sink<String> get searchCep => _streamController.sink;
  Stream<SearchCepState> get result => _streamController.stream.switchMap(_searchCep);

  Stream<SearchCepState> _searchCep(String cep) async* {
    yield const SearchCepLoading();
    try {
      final response =  await _repository.search(cep); 
      yield SearchCepSuccess(response);
    } catch(e) {
      yield const SearchCepError('Error on Search');
    }
  }

  void dispose() {
    _streamController.close();
  }
}


abstract class SearchCepState {}

class SearchCepSuccess implements SearchCepState {
  final Map data;
  const SearchCepSuccess(this.data);
}

class SearchCepLoading implements SearchCepState {
  const SearchCepLoading();
}

class SearchCepError implements SearchCepState {
  final String message;
  const SearchCepError(this.message);
}

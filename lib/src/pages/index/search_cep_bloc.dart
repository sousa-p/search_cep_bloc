import 'dart:async';
import 'dart:core';  
import 'package:search_cep_bloc/src/repositories/cep_repository.dart';

class SearchCepBloc {
  final _streamController = StreamController<String>.broadcast();
  final _repository = CepRepository();

  Sink<String> get searchCep => _streamController.sink;
  Stream<Map> get result => _streamController.stream.asyncMap(_searchCep);

  Future<Map> _searchCep(String cep) async {
    try {
      return _repository.search(cep);
    } catch(e) {
      throw Exception('Error on search');
    }
  }

  void dispose() {
    _streamController.close();
  }
}

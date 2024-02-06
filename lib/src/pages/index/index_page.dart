import 'package:flutter/material.dart';
import 'package:search_cep_bloc/src/pages/index/search_cep_bloc.dart';

class IndexPage extends StatelessWidget {
  final TextEditingController _inputController = TextEditingController();
  final SearchCepBloc _stream = SearchCepBloc();

  IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return SizedBox(
      width: w,
      height: h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 350,
              child: TextField(
                controller: _inputController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'CEP'),
              )),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
              onPressed: () {
                _stream.searchCep.add(_inputController.text);
              },
              child: const Text('Pesquisar')),
          StreamBuilder(
            stream: _stream.result,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Container();
              }

              final state = snapshot.data;

              if (state is SearchCepError) {
                return Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                );
              }

              if (state is SearchCepLoading) {
                return const Padding(
                  padding: EdgeInsets.all(32),
                  child: SizedBox.square(
                    dimension: 32,
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              final cep = state as SearchCepSuccess;
              return Text('City: ${cep.data['localidade']}');
            },
          )
        ],
      ),
    );
  }
}

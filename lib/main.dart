import 'package:flutter/material.dart';
import 'package:search_cep_bloc/src/views/index_page.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData.dark(),
      home: const Scaffold(
        body: IndexPage(),
      ),
    )
  );
}

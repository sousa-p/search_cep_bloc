import 'package:flutter/material.dart';
import 'package:search_cep_bloc/src/pages/index/index_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: IndexPage(),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return SizedBox(
        width: w,
        height: h,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: 350,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'CEP'),
                )),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(onPressed: null, child: Text('Pesquisar'))
          ],
        ));
  }
}

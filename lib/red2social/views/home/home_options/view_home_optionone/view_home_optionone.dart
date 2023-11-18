import 'package:flutter/material.dart';

class ViewHomeOptionone extends StatelessWidget {
  const ViewHomeOptionone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.all(5),
        child: const Column(
          children: [Text('data Home')],
        ),
      ),
    );
  }
}

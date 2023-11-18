import 'package:flutter/material.dart';

class ViewHomeOptionthree
 extends StatelessWidget {
  const ViewHomeOptionthree
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.all(5),
        child: const Column(
          children: [Text('data People')],
        ),
      ),
    );
  }
}

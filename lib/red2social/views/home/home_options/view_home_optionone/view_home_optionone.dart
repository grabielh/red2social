import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ViewHomeOptionone extends StatelessWidget {
  const ViewHomeOptionone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 400,
        height: 900,
        margin: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
        padding: const EdgeInsets.all(5),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              actions: [
                Container(
                  alignment: Alignment.center,
                  width: 300,
                  child: const Text('data'),
                )
              ],
            ),
            const MaxGap(10),
            SliverAnimatedGrid(
              initialItemCount: 10,
              itemBuilder: (context, index, animation) {
                return ScaleTransition(
                  scale: animation,
                  child: Container(
                    alignment: Alignment.center,
                    color: const Color.fromRGBO(68, 138, 255, 1),
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset('assets/splash.png'),
                    ),
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

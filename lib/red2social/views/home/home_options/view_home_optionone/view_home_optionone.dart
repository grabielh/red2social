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
        margin: const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 20),
        padding: const EdgeInsets.all(5),
        child: CustomScrollView(
          slivers: <Widget>[
            _buildViewStados(context),
            const SliverGap(10),
            _buildViewgaleriUsers(context)
          ],
        ),
      ),
    );
  }

  Widget _buildViewStados(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        child: SizedBox(
          //color: Colors.white,
          width: 400,
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              // Ejemplo: Mostrar cajas de colores como elementos en el ListView.builder
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.primaries[index % Colors.primaries.length],
                    borderRadius: BorderRadius.circular(90)),
                margin: const EdgeInsets.all(8),
                width: 100,
                child: const Text('data'),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildViewgaleriUsers(BuildContext context) {
    return SliverAnimatedGrid(
      initialItemCount: 5,
      itemBuilder: (context, index, animation) {
        return Card(
          child: ListTile(
            title: Row(
              children: [
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.people_alt),
                    label: const Text(
                      'Josefina Sandobal',
                      selectionColor: Colors.redAccent,
                    )),
              ],
            ),
            subtitle: ScaleTransition(
              scale: animation,
              child: Container(
                height: 200,
                alignment: Alignment.topCenter,
                color: const Color(0xff2a324b),
                child: SizedBox(
                  width: 300,
                  height: 200,
                  child: Image.asset('assets/splash.png'),
                ),
              ),
            ),
          ),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      ),
    );
  }
}

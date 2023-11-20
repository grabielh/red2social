import 'package:flutter/material.dart';

class ViewHomeOptionone extends StatelessWidget {
  const ViewHomeOptionone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 400,
        height: 900,
        margin: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
        padding: const EdgeInsets.all(5),
        child: CustomScrollView(
          slivers: <Widget>[_buildViewgaleriUsers(context)],
        ),
      ),
    );
  }

  Widget _buildViewStados() {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        width: 400,
        height: 400,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10, // Número de elementos que deseas mostrar
          itemBuilder: (context, index) {
            // Ejemplo: Mostrar cajas de colores como elementos en el ListView.builder
            return Container(
              margin: const EdgeInsets.all(8),
              width: 100,
              color: Colors.primaries[index % Colors.primaries.length],
            );
          },
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

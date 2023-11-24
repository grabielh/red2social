import 'package:flutter/material.dart';

class ViewHomeOptiontwo extends StatefulWidget {
  const ViewHomeOptiontwo({super.key});

  @override
  State<ViewHomeOptiontwo> createState() => _ViewHomeOptiontwoState();
}

class _ViewHomeOptiontwoState extends State<ViewHomeOptiontwo> {
  final TextEditingController _buscarDateUser = TextEditingController();
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
            _buildAppBar(context, _buscarDateUser),
            _buildViewStados(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(
      BuildContext context, TextEditingController buscarDateUser) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.amber,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            width: 200,
            child: TextField(
              controller: buscarDateUser,
              decoration: const InputDecoration(
                labelText: 'buscar persona o lugar',
              ),
              
              cursorColor: Colors.black,
              autofocus: EditableText.debugDeterministicCursor,
              keyboardType: TextInputType.name,
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      ),
    );
  }

  Widget _buildViewStados(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        child: SizedBox(
          //color: Colors.white,
          width: 400,
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              // Ejemplo: Mostrar cajas de colores como elementos en el ListView.builder
              return Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color:
                            Colors.primaries[index % Colors.primaries.length],
                        borderRadius: BorderRadius.circular(90)),
                    margin: const EdgeInsets.all(8),
                    width: 100,
                    child: const Text('data'),
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color:
                            Colors.primaries[index % Colors.primaries.length],
                        borderRadius: BorderRadius.circular(90)),
                    margin: const EdgeInsets.all(8),
                    width: 100,
                    child: const Text('data'),
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color:
                            Colors.primaries[index % Colors.primaries.length],
                        borderRadius: BorderRadius.circular(90)),
                    margin: const EdgeInsets.all(8),
                    width: 100,
                    child: const Text('data'),
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color:
                            Colors.primaries[index % Colors.primaries.length],
                        borderRadius: BorderRadius.circular(90)),
                    margin: const EdgeInsets.all(8),
                    width: 100,
                    child: const Text('data'),
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color:
                            Colors.primaries[index % Colors.primaries.length],
                        borderRadius: BorderRadius.circular(90)),
                    margin: const EdgeInsets.all(8),
                    width: 100,
                    child: const Text('data'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

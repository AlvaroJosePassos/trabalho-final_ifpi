import 'package:flutter/material.dart';
import 'package:projeto_final/model/DB.dart';

class ListContactView extends StatefulWidget {
  const ListContactView({super.key});

  @override
  State<ListContactView> createState() => _ListContactViewState();
}

class _ListContactViewState extends State<ListContactView> {
  List<String> entries = <String>['A', 'B', 'C'];
  List<int> colorCodes = <int>[600, 500, 100];
  late var contat;
  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerLatitude = TextEditingController();
  final TextEditingController _controllerLongitude = TextEditingController();
  var mostrar = false;

  pegueList() {
    var listagem = PegarListaContatos();
    print(listagem);
    return listagem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          ElevatedButton(
              child: Text('Adicionar usuario'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('deu certo'),
                      content: Column(
                        children: [
                          Text('Nome'),
                          TextField(
                            controller: _controllerNome,
                          ),
                          Text('Latitude'),
                          TextField(
                            controller: _controllerLatitude,
                          ),
                          Text('Longitude'),
                          TextField(
                            controller: _controllerLongitude,
                          ),
                          FloatingActionButton(
                              child: Text('Inserir Contato'),
                              onPressed: () {
                                inserirContatos(
                                    _controllerNome.text,
                                    _controllerLatitude.text,
                                    _controllerLongitude.text);
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                              })
                        ],
                      ),
                    );
                  },
                );
              }),
          FloatingActionButton(
              child: Text('Adicionar usuario'),
              onPressed: () async {
                setState(() {
                  contat = pegueList();
                  print(contat);
                });
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('deu certo'),
                      content: Column(
                        children: [
                          ListView.builder(
                            padding: EdgeInsets.all(8),
                            itemCount: contat.length,
                            itemBuilder: (BuildContext context, int index) {
                              var lista = contat;
                              return Center(
                                child: Column(
                                  children: [
                                    Text('Nome: ${lista['nome']}'),
                                    Text('Latitude: ${lista['latitude']}'),
                                    Text('Longitude: ${lista['longitude']}')
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
        ],
      ),
    ));
  }
}

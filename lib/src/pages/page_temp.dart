import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        // children: _crearItems(),
        children: _crearItems2(),
      ),
    );
  }

  // List<Widget> _crearItems() {
  //   List<Widget> lista = List<Widget>();
  //   for(String o in  opciones){
  //     final tempWidget = ListTile(
  //       title: Text(o),
  //     );

  //     lista..add(tempWidget)
  //          ..add(Divider());

  //   }


  //   return lista;
  // }

  
  List<Widget> _crearItems2() {
    var widgets = opciones.map(( String e ) {

      return Column(
        children: <Widget>[
          ListTile(
            title: Text(e+"!"),
          ),
          Divider()
        ],
      );

    }).toList();
    return widgets;
  }


}
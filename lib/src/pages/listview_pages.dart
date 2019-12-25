import 'dart:async';

import 'package:flutter/material.dart';


class ListaPage extends StatefulWidget {
  ListaPage({Key key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  List<int>_listaNumeros = new List();
  int _ultimo = 0;
  bool _isLoading = false;

  ScrollController _controllerScroll = new ScrollController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _agregar10();
    _controllerScroll.addListener(() {
      
      if(_controllerScroll.position.pixels == _controllerScroll.position.maxScrollExtent){
        fechData();
      }
      



    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controllerScroll.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Listas"),),
      body: Stack(
        children: <Widget>[
          _crearLoding(),
          _crearListas(),
        ],
      )
      
      
      
      
    );
  }



  Widget _crearListas() {
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
                  controller: _controllerScroll,
                  itemCount: _listaNumeros.length,
                  itemBuilder: (BuildContext context, int index) {
                  final imagen = _listaNumeros[index];
                  return FadeInImage(
                    placeholder: AssetImage('assets/jar-loading.gif'),
                    image: NetworkImage('https://picsum.photos/id/$imagen/500/300'),
                  );
      },
      ),
    );
  }
  
  Future<Null> obtenerPagina1() async {
    final duration = Duration(seconds: 2);
    new Timer(duration, () {
      _listaNumeros.clear();
      _ultimo++;
      _agregar10();
    });
    return Future.delayed(duration);
  }



  void _agregar10() {
    for (var i = 0; i < 10; i++) {
      _ultimo++;
      _listaNumeros.add(_ultimo);
      setState(() {
        
      });
    }
  }

  Future fechData() async{
    _isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    return new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;

    _controllerScroll.animateTo(
      _controllerScroll.position.pixels + 10,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );
    
    
    
    _agregar10();

  }
  Widget _crearLoding() {
  if(_isLoading){
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator()
          ],
        ),
        SizedBox(height: 15.0,)
      ],

    );
  } else {
    return Container();
  }
}
}


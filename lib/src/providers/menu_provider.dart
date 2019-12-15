import 'dart:convert';

import 'package:flutter/services.dart';


class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider(){
    cargarData();
  }

  Future<List<dynamic>> cargarData() async{
    final jeje = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(jeje);

    opciones = dataMap["rutas"];
    return opciones;  
  }
}


final menuProvider = new _MenuProvider();


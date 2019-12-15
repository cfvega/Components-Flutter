import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routes/routes.dart';
import 'package:flutter/material.dart';

// import 'package:componentes/src/pages/page_temp.dart';


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componente App',
      //home: HomePage()
      routes: getApplicationRoutes(),
      onGenerateRoute: (RouteSettings settings){
        print('Se esta llamando a la ruta: ${settings.name}');
        return MaterialPageRoute(
          builder: (BuildContext context) => AlertPage()
        );
      },
    );

  }
}
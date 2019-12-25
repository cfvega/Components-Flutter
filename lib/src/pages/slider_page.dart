import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 55.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearSwtich(),
            Expanded(child: _crearImagen()),
            
          ],
        ),
      ),
    );
  }





  Widget _crearSlider() {
    return Slider(
      
      activeColor: Colors.indigoAccent,
      label: "Tamaño de la imagen",
      //divisions: 20,
      onChanged: (_bloquearCheck) ? null:
      
      ( e ){
        print(e);
        setState(() {
          this._valorSlider=e;
        });
      },
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
    );
  }


  Widget _crearImagen() {
    return Image(
      image: NetworkImage('https://p1.hiclipart.com/preview/464/40/992/de-iron-man-3-iron-man-png-clipart.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }


  Widget _checkBox() {
    // LO MISMO SIN TITLE

    // return Checkbox(
    //   value: _bloquearCheck,
    //   onChanged: ( e ){

    //     setState(() {
    //       _bloquearCheck = e;
    //     });

    //   },
    // );
     return CheckboxListTile(
      title: Text("Bloquear Slider"),
      value: _bloquearCheck,
      onChanged: (e){
        setState(() {
          _bloquearCheck = e;
        });
      },
    );
  }

  Widget _crearSwtich(){

    return SwitchListTile(
      title: Text("Bloquear Slider"),
      value: _bloquearCheck,
      onChanged: (e){
        setState(() {
          _bloquearCheck = e;
        });
      },
    );
  }



}
import 'package:flutter/material.dart';


class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
    String _nombre='';
    String _email='';
    String _fecha='';

    List<String> _poderes = ['Volar', 'Rayos x', 'Nadar','Super Fuerza'];
    String _opcionSeleccionada='Volar';

    TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs Page'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPasswd(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {

    // final _controller = new TextEditingController();
    return TextField(
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
      // controller: _controller,
      //autofocus: true
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
    );
  }

  Widget _crearEmail(){

    return TextField(
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
      // controller: _controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Email de la persona',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
    );
  }
  
  Widget _crearPasswd(){

    return TextField(
      onChanged: (valor) {
        setState(() {
        });
      },
      // controller: _controller,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock)
      ),
    );
  }

  Widget _crearFecha(BuildContext context){

    return TextField(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Fecha',
        labelText: 'Fecha',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today)
      ),
    );
  }
  _selectDate(BuildContext context) async{
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES')
    );

    if( picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }


  List<DropdownMenuItem<String>> getLista() {
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((f) {
      lista.add(DropdownMenuItem(
        child: Text(f),
        value: f,
      ));
    });
    return lista;
  }

  Widget _crearDropdown(){

    return Row(
      children: <Widget>[
        Icon(Icons.power),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionada,
            items: getLista(),
            onChanged: (e) {
              setState(() {
                _opcionSeleccionada = e;
              });
            },
          ),
        ),
      ],
    );
  }
  

  Widget _crearPersona(){
    return ListTile(
      title: Text('El nombre es: $_nombre'),
      subtitle: Text('Email: $_email'),
    );
  }



}
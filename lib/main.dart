import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/material.dart' as prefix0;

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController _txtNome = new TextEditingController();
  TextEditingController _txtIdade = new TextEditingController();
  TextEditingController _txtData = new TextEditingController();
  TextEditingController _txtSintomas = new TextEditingController();
  DateTime selectedDate = new DateTime.now(); //data selecionada
  int GROUP_RADIO_BUTTON_SEXO = 0; // nenhum radio button
  int _radioButtonSelected = 0;
  String _radioButtonInfo = "";
  final double FONT_SIZE_TEXT_INPUT = 18.0;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      print("Data selecionada: ${picked.toString()}");
    setState(() {
      this.selectedDate = picked;
      this._txtData.text = picked.toLocal().toString();
    });
  }

  void onCadastar() {
    String nome = this._txtNome.text;
    int idade = int.parse(this._txtIdade.text);
    String data = this._txtData.text;
    int sexo = this.GROUP_RADIO_BUTTON_SEXO;
    String sintomas = this._txtSintomas.text;
  }

  bool isRadioButtonSelected() {
    if (GROUP_RADIO_BUTTON_SEXO == 1 || GROUP_RADIO_BUTTON_SEXO == 2) {
      return true;
    } else {
      return false;
    }
  }

  void onReset() {
    setState(() {
      this._txtNome.text = "";
      this._txtIdade.text = "";
      this._txtData.text = "";
      this._txtSintomas.text = "";
      this.GROUP_RADIO_BUTTON_SEXO = 3;
      this._formKey = GlobalKey<FormState>();
      this._radioButtonInfo = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Prontuário médico'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                this.onReset();
              },
            ),
          ],
        ),
        body: 
           Stack(
        children: <Widget>[
          Center(
            child: new Image.asset(
              'assets/images/background.jpg',
              width:500,
              height: 1000,
              fit: BoxFit.fill,
            ),
          ),
          SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 15, 10, 5),
          child: new Form(
          key: this._formKey,
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.all(15),
                  child: new Text(
                    "Dados clínicos",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                new Container(
                  child: new TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Nome",
                      hintText: "Digite o seu nome",
                    ),
                    style: new TextStyle(
                        fontSize: FONT_SIZE_TEXT_INPUT,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w200,
                        fontFamily: "Roboto"
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Insira seu nome";
                      }
                    },
                    controller: this._txtNome,
                  ),
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  alignment: Alignment.center,
                ),
                new Container(
                  child: new TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Idade",
                        hintText: "digite sua idade"
                    ),
                    style: new TextStyle(
                        fontSize: FONT_SIZE_TEXT_INPUT,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w200,
                        fontFamily: "Roboto"
                    ),
                    controller: this._txtIdade,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Insira sua idade";
                      }
                    },
                  ),
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                ),
                new Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 5,
                          child: TextFormField(
                              style: new TextStyle(
                                  fontSize: FONT_SIZE_TEXT_INPUT,
                                  color: const Color(0xFF000000),
                                  fontWeight: FontWeight.w200,
                                  fontFamily: "Roboto"
                              ),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Data",
                                hintText: "Digite a data da consulta",
                              ),
                              controller: this._txtData,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Insira a data";
                                }
                              }
                          )
                       )
                      ,
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          icon: Icon(
                            Icons.calendar_today,
                            color: Colors.blue,
                          ),
                          onPressed: () {
                            this._selectDate(context);
                          },
                        ),
                      )
                    ],
                  ),
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                ),
                new Container(
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          margin: EdgeInsets.only(left: 8),
                          child: Text(
                            "Sexo",
                            style: new TextStyle(
                                fontSize: 13.0,
                                color: const Color(0xFF000000),
                                fontWeight: FontWeight.w200,
                                fontFamily: "Roboto"
                            ),
                          ),
                        ),
                        new Radio(
                            groupValue: this.GROUP_RADIO_BUTTON_SEXO,
                            value: 1, //this.RADIO_BUTTON_MASCULINO_VALUE,
                            activeColor: Colors.blue,
                            onChanged: (int value) {
                              radioChanged(value);
                            }
                        ),
                        new Text(
                          "masculino",
                          style: new TextStyle(
                              fontSize: 13.0,
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w200,
                              fontFamily: "Roboto"
                          ),
                        ),
                        new Radio(
                            groupValue: this.GROUP_RADIO_BUTTON_SEXO,
                            value: 2, //this.RADIO_BUTTON_FEMININO_VALUE,
                            activeColor: Colors.blue,
                            onChanged: (int value) {
                              radioChanged(value);
                            }
                        ),
                        new Text(
                          "feminino",
                          style: new TextStyle(
                              fontSize: 13.0,
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w200,
                              fontFamily: "Roboto"
                          ),
                        )
                      ]
                  ),
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                ),
                Container(
                  padding: EdgeInsets.only(
                      right: 5.0, top: 0.0, bottom: 15, left: 5.0),
                  child: Text(
                    this._radioButtonInfo,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                new Container(
                  child: new TextFormField(
                    maxLines: 15,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Sintomas",
                      hintText: "Digite seus sintomas",
                    ),
                    style: new TextStyle(
                        fontSize: FONT_SIZE_TEXT_INPUT,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w200,
                        fontFamily: "Roboto"
                    ),
                    controller: this._txtSintomas,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Digite seus sintomas";
                      }
                    },
                  ),
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                ),
                new Container(
                  child: new RaisedButton(
                    color: Colors.blue,
                    child: new Text(
                      "Cadastrar",
                      style: new TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                          fontFamily: "Roboto"
                      ),
                    ),
                    onPressed: () {
                      bool formValidate = this._formKey.currentState.validate();
                      bool radioSelected = this.isRadioButtonSelected();
                      setState(() {
                          if (radioSelected) {
                            this._radioButtonInfo = "";
                          } else {
                            this._radioButtonInfo = "Selecione o seu sexo";
                          }
                        }
                      );
                      if (formValidate && this.isRadioButtonSelected()) {
                        this.onCadastar();
                      }
                    },
                  ),
                  padding: const EdgeInsets.all(0.0),
                  alignment: Alignment.center,
                ),
                new Container(
                    padding: EdgeInsets.all(5.0),
                    margin: EdgeInsets.only(left: 5.0),
                    child: Text(
                      "Prontuários: ",
                      style: new TextStyle(
                          fontSize: 15,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w200,
                          fontFamily: "Roboto"
                      ),
                    )
                ),
                new Container(
                  margin: const EdgeInsets.all(10.0),
                  color: Colors.grey,
                  height: 180.0,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        child: Text("01 André"),
                      ),
                      Container(
                        child: Text("02 Percy Jackson"),
                      ),
                      Container(
                        child: Text("03 Annabeth"),
                      ),
                      Container(
                        child: Text("04 Leo Valdez"),
                      ),
                      Container(
                        child: Text("05 Franck"),
                      ),
                      Container(
                        child: Text("06 Hazel Levesque"),
                      ),
                      Container(
                        child: Text("07 Piper McLean"),
                      ),
                      Container(
                        child: Text("08 Nico di Angelo"),
                      ),
                      Container(
                        child: Text("09 Bianca di Angelo"),
                      ),
                      Container(
                        child: Text("10 Jason"),
                      ),
                      Container(
                        child: Text("11 Grover underwood"),
                      ),
                      Container(
                        child: Text("12 Thalia "),
                      ),
                      Container(
                        child: Text("13 Will Solangelo "),
                      ),
                      Container(
                        child: Text("14 Reyna A. R. A "),
                      ),
                      Container(
                        child: Text("15 Lucas Casttelan "),
                      ),
                    ],
                  ),
                ),
              ]
          ),
        )
       )
       ],
       ),
    );
  }

  void radioChanged(int value) {
    setState(() {
      this._radioButtonSelected = value;
      this.GROUP_RADIO_BUTTON_SEXO = value;
    });
  }
}

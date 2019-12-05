import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
 
 
void main() {
  runApp(new MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Prontuário Médico',
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
  final double FONT_SIZE_TEXT_INPUT = 18.0;
  int GROUP_RADIO_BUTTON_SEXO = 0; // nenhum radio button
  DateTime selectedDate = new DateTime.now(); //data selecionada
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _radioButtonInfo = "";
  int _radioButtonSelected = 0;
  List _prontuarioList = [];
  TextEditingController _txtData = new TextEditingController();
  TextEditingController _txtIdade = new TextEditingController();
  TextEditingController _txtNome = new TextEditingController();
  TextEditingController _txtSintomas = new TextEditingController();
  int _lastRemovedPos;
  Map<String, dynamic> _lastRemoved;
 
 @override
  void initState() {
    super.initState();
 
    _readData().then((data) {
      setState(() {
        _prontuarioList = json.decode(data);
      });
    });
  }
 
  void _addProntuario() {
    setState(() {
      Map<String, dynamic> novoPaciente = Map();
      novoPaciente["nome"] = _txtNome.text;
      novoPaciente["idade"] = _txtIdade.text;
      if (GROUP_RADIO_BUTTON_SEXO == 1) {
        novoPaciente['sexo'] = 'masculino';
 
 
      } else if (GROUP_RADIO_BUTTON_SEXO == 2) {
        novoPaciente['sexo'] = 'feminino';
      }
        novoPaciente["data"] = _txtData.text;
        novoPaciente["sintomas"] = _txtSintomas.text;

      _prontuarioList.add(novoPaciente);
 
      _saveData();
    });
  }
 
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
 
  void radioChanged(int value) {
    setState(() {
      this._radioButtonSelected = value;
      this.GROUP_RADIO_BUTTON_SEXO = value;
    });
  }
 
  //
 
Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }
 
  Future<File> _saveData() async {
    String data = json.encode(_prontuarioList);
 
    final file = await _getFile();
    return file.writeAsString(data);
  }
 
  Future<String> _readData() async {
    try {
      final file = await _getFile();
 
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
 
  //
 
 
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
      body: Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
                image: new DecorationImage(
                image: new AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover,
              ),
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
                              fontFamily: "Roboto"),
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
                              fontFamily: "Roboto"),
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
                            ),
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
                                    fontFamily: "Roboto"),
                              )
                            ]
                        ),
                        padding: const EdgeInsets.all(5.0),
                        alignment: Alignment.center,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            right: 5.0, top: 0.0, bottom: 15, left: 5.0
                        ),
                        child: Text(
                          this._radioButtonInfo,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      new Container(
                        child: new TextFormField(
                          maxLines: 5,
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
                            bool formValidate =
                                this._formKey.currentState.validate();
                            bool radioSelected = this.isRadioButtonSelected();
                            setState(() {
                              if (radioSelected) {
                                this._radioButtonInfo = "";
                              } else {
                                this._radioButtonInfo = "Selecione o seu sexo";
                              }
                            });
                            if (formValidate && this.isRadioButtonSelected()) {
                                this._addProntuario();
                                this.onReset();
                                
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
                                fontFamily: "Roboto"),
                          )
                      ),
                      new Container(
                        margin: const EdgeInsets.all(10.0),
                        color: Colors.grey,
                        height: 180.0,
                        child: RefreshIndicator(onRefresh: _refresh,
                        child: ListView.builder(
                        padding: EdgeInsets.only(top: 10.0),
                        itemCount: _prontuarioList.length,
                        itemBuilder: buildItem),),
       
                      ),
                    ]
                  ),
              )
            )
        ],
      ),
    );
  }
 
 
  Future<Null> _refresh() async{
    await Future.delayed(Duration(seconds: 1));
 
    setState(() {
    _saveData();
    });
 
    return null;
  }
 
 
  Widget buildItem(BuildContext context, int index){
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(Icons.delete, color: Colors.white,),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: ListTile(
        title: Text(_prontuarioList[index]["nome"]+","+_prontuarioList[index]["idade"]+" anos,"+_prontuarioList[index]["sexo"]+","+_prontuarioList[index]["data"]),
        subtitle: Text(
          _prontuarioList[index]["sintomas"]
        ),
      ),
      onDismissed: (direction){
        setState(() {
          _lastRemoved = Map.from(_prontuarioList[index]);
          _lastRemovedPos = index;
          _prontuarioList.removeAt(index);
 
          _saveData();
 
          final snack = SnackBar(
            content: Text("Prontuário \"${_lastRemoved["nome"]}\" removido!"),
            action: SnackBarAction(label: "Desfazer",
                onPressed: () {
                  setState(() {
                    _prontuarioList.insert(_lastRemovedPos, _lastRemoved);
                    _saveData();
                  });
                }),
            duration: Duration(seconds: 2),
          );
 
          Scaffold.of(context).removeCurrentSnackBar();
          Scaffold.of(context).showSnackBar(snack);
 
        });
      },
    );
  }
}
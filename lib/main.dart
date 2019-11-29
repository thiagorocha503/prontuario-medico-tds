import 'package:flutter/material.dart';

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
    @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('App Name'),
          ),
        body:
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Container(
                child:
                  new TextField(
                    style: new TextStyle(fontSize:12.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto"),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Nome",
                      hintText: "Digite o seu nome",
                    ),
                  ),
    
                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.center,
              ),
    
              new Container(
                child:
                  new TextField(
                    style: new TextStyle(fontSize:12.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto"),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "idade",
                      hintText: "digite sua idade"
                    ),
                  ),
    
                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.center,
              ),
    
              new Container(
                child:
                  new TextField(
                    style: new TextStyle(fontSize:12.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto"),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Data",
                      hintText: "Digite a data da consulta",
                    ),
                  ),
    
                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.center,
              ),
    
              new Container(
                child:
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Radio(key:null, groupValue: null, value: .5, onChanged: radioChanged),
    
                      new Text(
                      "qWerty1",
                        style: new TextStyle(fontSize:12.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w200,
                        fontFamily: "Roboto"),
                      ),
    
                      new Radio(key:null, groupValue: null, value: .5, onChanged: radioChanged),
    
                      new Text(
                      "qWerty1",
                        style: new TextStyle(fontSize:12.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w200,
                        fontFamily: "Roboto"),
                      )
                    ]
    
                  ),
    
                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.center,
              ),
    
              new Container(
                child:
                  new TextField(
                    style: new TextStyle(fontSize:12.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto"),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Sintomas",
                      hintText: "Digite seus sintomas",
                    ),
                  ),
    
                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.center,
              ),
    
              new Container(
                child:
                  new RaisedButton(key:null, onPressed:buttonPressed,
                    color: const Color(0xFFe0e0e0),
                    child:
                      new Text(
                      "Cadastrar",
                        style: new TextStyle(fontSize:12.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w200,
                        fontFamily: "Roboto"),
                      )
                    ),
    
                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.center,
              )
            ]
    
          ),
    
      );
    }
    void buttonPressed(){}
    
    void radioChanged(double value) {}
    
}
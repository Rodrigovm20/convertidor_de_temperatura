import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de Temperatura',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Conversor(title: 'Convertidor de temperatura'),
    );
  }
}

class Conversor extends StatefulWidget {
  Conversor({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ConversorState createState() => _ConversorState();
}

class _ConversorState extends State<Conversor> {
  var _output = 'Inicial';
  final inputController = TextEditingController();

  void _calculatetemp() {
    setState(() {
      double temperaturaoriginal = double.parse(inputController.text);
      double temperaturasalida = (temperaturaoriginal - 32) * 5 / 9;
      _output = "$temperaturasalida";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: inputController,
              ),
              RaisedButton(
                onPressed: () {
                  _calculatetemp();
                },
              ),
              Text(_output),
            ],
          ),
        ),
      ),
    );
  }
}
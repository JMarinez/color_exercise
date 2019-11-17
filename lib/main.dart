import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _currentText = '';

  var textCollection = List<Widget>();

  List<double> textSizes = [10, 15, 20, 25, 30, 35];
  double _currentValue = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 35),
              child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Type something',
                  ),
                  autocorrect: false,
                  onChanged: (text) {
                    setState(() {
                      _currentText = text;
                    });
                  }),
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text('Red'),
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      textCollection.add(Text(
                        _currentText,
                        style: TextStyle(color: Colors.red, fontSize: _currentValue,),
                      ));
                    });
                  },
                ),
                RaisedButton(
                  child: Text('Green'),
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      textCollection.add(Text(
                        _currentText,
                        style: TextStyle(color: Colors.green, fontSize: _currentValue,),
                      ));
                    });
                  },
                ),
                RaisedButton(
                  child: Text('Blue'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      textCollection.add(Text(
                        _currentText,
                        style: TextStyle(color: Colors.blue , fontSize: _currentValue,),
                      ));
                    });
                  },
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
            DropdownButton<double>(
              value: _currentValue,
              icon: Icon(Icons.arrow_drop_down),
              elevation: 16,
              style: TextStyle(
                color: Colors.black,
              ),
              underline: Container(
                height: 2,
                color: Colors.black,
              ),
              onChanged: (double newValue) {
                setState(() {
                  _currentValue = newValue;
                });
              },
              items: textSizes.map<DropdownMenuItem<double>>((double value) {
                return DropdownMenuItem<double>(
                  value: value,
                  child: Text('$value'),
                );
              }).toList(),
            ),
            Wrap(
              children: textCollection,
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}

import 'package:adnan_hadi_demo/screen1.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primaryColor: Colors.teal,
        accentColor: Colors.white,
        buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.accent, buttonColor: Colors.teal),
        canvasColor: Colors.teal[100],
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final myData = [
    {"city": "Dammam", "temp": 48},
    {"city": "Riyadh", "temp": 30},
    {"city": "Jeddah", "temp": 38}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: ListView.builder(
        itemCount: myData.length,
        itemBuilder: (BuildContext context, int index) {
          var _currentCity = myData[index];
          int temp = _currentCity['temp'];
          Widget weatherIcon =
              temp >= 40 ? Icon(Icons.wb_sunny) : Icon(Icons.cloud);
          return ListTile(
            title: Text(_currentCity["city"]),
            leading: weatherIcon,
            trailing: Text("${_currentCity['temp']}˚"),
          );
        },
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: UserAccountsDrawerHeader(
                currentAccountPicture: FlutterLogo(
                  colors: Colors.red,
                ),
                accountName: Text("Adnan Sawas"),
                accountEmail: Text("adnsawas@gmail.com"),
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  RaisedButton(
                    child: Text("Screen 1"),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Screen1(),
                        fullscreenDialog: true,
                      ));
                    },
                  ),
                  RaisedButton(
                    child: Text("Screen 2"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  RaisedButton(
                    child: Text("Screen 3"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

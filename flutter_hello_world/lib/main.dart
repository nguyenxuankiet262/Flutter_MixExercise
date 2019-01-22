import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'My Hello World',
        home: ClickMeApp() ,
    );
  }
}

class SecondRoute extends StatelessWidget {
  String nametoshow = "";
  SecondRoute({Key key, @required this.nametoshow}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.map),
            title: Text(nametoshow),
          ),
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text('Album'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Phone'),
          ),
        ],
      ),
    );
  }
}

class ClickMeApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChangeText();
}

class ChangeText extends State<ClickMeApp> {
  final myControllerNumberA = TextEditingController();
  final myControllerNumberB = TextEditingController();
  final myGlobalController = GlobalKey<FormState>();

  String result = "";

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    myControllerNumberA.dispose();
    myControllerNumberB.dispose();
    super.dispose();
  }

  void _sum(){
    if(myGlobalController.currentState.validate()){
      int numberA = int.parse(myControllerNumberA.text);
      int numberB = int.parse(myControllerNumberB.text);
      int numberC = numberA + numberB;
      setState(() {
        result = "$numberC";
      });
    }
  }

  void _minus(){
    if(myGlobalController.currentState.validate()){
      int numberA = int.parse(myControllerNumberA.text);
      int numberB = int.parse(myControllerNumberB.text);
      int numberC = numberA - numberB;
      setState(() {
        result = "$numberC";
      });
    }
  }

  void _divide(){
    if(myGlobalController.currentState.validate()){
      int numberA = int.parse(myControllerNumberA.text);
      int numberB = int.parse(myControllerNumberB.text);
      double numberC = numberA / numberB;
      setState(() {
        result = "$numberC";
      });
    }
  }

  void _multi(){
    if(myGlobalController.currentState.validate()){
      int numberA = int.parse(myControllerNumberA.text);
      int numberB = int.parse(myControllerNumberB.text);
      int numberC = numberA * numberB;
      setState(() {
        result = "$numberC";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text('Flutter App')),
      body: Form(
        key: myGlobalController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter your number!";
                }
              },
              controller: myControllerNumberA,
              decoration: InputDecoration(hintText: 'Enter Number A'),
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter your number!";
                  }
                },
                controller: myControllerNumberB,
                decoration: InputDecoration(hintText: 'Enter Number B'),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                result,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: _sum,
                    child: Text('+'),
                  ),
                  RaisedButton(
                    onPressed: _minus,
                    child: Text('-'),
                  ),
                  RaisedButton(
                    onPressed: _multi,
                    child: Text('*'),
                  ),
                  RaisedButton(
                    onPressed: _divide,
                    child: Text('/'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute(nametoshow: 'haha')),
                  );
                },
                child: Text('Next'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: GestureDetector(
                onTap: (){
                  print('Tap');
                },
                onDoubleTap: (){
                  print('DoubleTap');
                },
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text('Tap here'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
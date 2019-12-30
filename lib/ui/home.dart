import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  static TextEditingController _weightcontroller = TextEditingController();
  static double _finalResult = 0.0;
  static int radioValue;

  Widget img = Image.asset(
    'images/planet.png',
    height: 100,
    width: 120,
  );

  Widget txtfield = Container(
    margin: const EdgeInsets.all(3.0),
    alignment: Alignment.center,
    child: TextField(
      controller: _weightcontroller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Enter your weight on earth',
        hintText: 'in kilograms....',
        icon: Icon(Icons.person_outline),
      ),
    ),
  );

  void radiovaluechanged(int value) {
    setState(() {
      radioValue = value;
      switch (radioValue) {
        case 0:
          _finalResult = calcualteWeight(_weightcontroller.text, 0.06);
          break;
        case 1:
          _finalResult = calcualteWeight(_weightcontroller.text, 0.38);
          break;
        case 2:
          _finalResult = calcualteWeight(_weightcontroller.text, 0.91);
          break;
      }
    });
  }

  double calcualteWeight(String weight, double mul) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * mul;
    } else
      return int.parse('180') * 0.38;
  }

  static String _givename(int val) {
    if (val == 0)
      return "Pluto";
    else if (val == 1)
      return "Mars";
    else
      return "Venus";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weight on Planet X'),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            img,
            txtfield,
            Padding(
              padding: EdgeInsets.all(15.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Radio(
                        value: 0,
                        groupValue: radioValue,
                        onChanged: radiovaluechanged,
                        activeColor: Colors.grey,
                      ),
                      Text(
                        'Pluto',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Radio(
                        value: 1,
                        groupValue: radioValue,
                        onChanged: radiovaluechanged,
                        activeColor: Colors.redAccent,
                      ),
                      Text(
                        'Mars',
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Radio(
                        value: 2,
                        groupValue: radioValue,
                        onChanged: radiovaluechanged,
                        activeColor: Colors.yellow,
                      ),
                      Text(
                        'Venus',
                        style: TextStyle(color: Colors.yellow),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  (_finalResult == 0.0)
                      ? Text("")
                      : Text(
                          'Your weight on ${_givename(radioValue)} is',
                          style: TextStyle(
                            color: Colors.lightBlueAccent[200],
                            fontSize: 29,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  Text(
                    '$_finalResult',
                    style: TextStyle(
                        color: Colors.lightBlueAccent[200],
                        fontSize: 40,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

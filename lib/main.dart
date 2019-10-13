import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ChartPage()));
}

class ChartPage extends StatefulWidget {
  @override
  ChartPageState createState() => ChartPageState();
}

int points = 0;
int points2 = 0;

class ChartPageState extends State<ChartPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: width,
          child: new Column(children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 60)),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(),
                ),
                Container(
                    height: 50,
                    width: 300,
                    decoration: new BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(120)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              offset: Offset(0.7, 0.7),
                              blurRadius: 10)
                        ]),
                    child: Center( child: Text(
                      points.toString(),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.8)),
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Image.asset(
                  'images/cajaaa.png',
                  width: 300,
                )
              ],
            ),
            Text(points.toString()),
            Padding(
              padding: EdgeInsets.only(top: 40, left: 100),
            ),
            new Row(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 50),
              ),
              Image.asset(
                'images/ladder.png',
                width: 50,
              ),
              Padding(
                padding: EdgeInsets.only(left: 50),
              ),
              Row(
                children: <Widget>[
                  Image.asset(
                    'images/logros.png',
                    width: 40,
                  )
                ],
              ),
            ]),
            myPlay,
          ]),
        ));
  }
}

Color mColor = Colors.cyan;

Future<void> _neverSatisfied(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Has perdido :('),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(points.toString()),
              Text('Tu puntuación final es de ' + points2.toString()),
              Text('You\’re like me. I’m never satisfied.'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Cerrar'),
            onPressed: () {
              points2 = 0;
              Navigator.of(context).pop();
            },
          ),
          MaterialButton(
            child: Text('hey'),
            onPressed: () {
              print('hey');
            },
          ),
        ],
      );
    },
  );
}

var value = [
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12',
  '13',
  '14',
  '15',
  '16',
  '17',
  '18',
  '19',
  '20',
  '21',
  '22',
  '23',
  '24',
  '25',
  '26',
  '27',
  '28',
  '29',
  '30',
  '31',
  '32',
  '33',
  '34',
  '35',
  '36'
];

var recuadro = [
  1,
  1,
  1,
  9999,
  1,
  1,
  1,
  9999,
  9999,
  9999,
  9999,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1
];

Widget myPlay = new GridView.builder(

  scrollDirection: Axis.vertical,
  itemCount: value.length,
  shrinkWrap: true,
  gridDelegate:
      new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),
  itemBuilder: (BuildContext context, int index) {

    var rng = recuadro.shuffle(new Random());
    var rng2 = int.parse(rng);
    var colorr = Colors.cyan;
    var colorrr = Colors.black;
    return new GestureDetector(
      child: new Card(
        color: mColor,
        child: new Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(120.0))),
          alignment: Alignment.center,
          child: new Column(
              children: <Widget>[Container(child: Text(rng2.toString()))]),
        ),
      ),
      onTap: () {
        if (rng2 == 0) {
          points = 0;
          _neverSatisfied(context);
          mColor = Colors.black;
          new Column(
              children: <Widget>[Container(child: Text(rng2.toString()))]);
        } else {
          print(rng2);
          points += rng2;
          print(points);
          points2 += rng2;
        }
      },
    );
  },
);

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

int auxpoint = 0;
int points = 0;
int points2 = 0;

class ChartPageState extends State<ChartPage> {

  void updatePoint(int points) {

    setState(() {
      auxpoint = points;
    });
  }
  void updatePoint2(int points2) {

    setState(() {
      auxpoint = points2;
    });
  }
  @override
  Widget build(BuildContext context) {
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
                  updatePoint(points);
                    updatePoint2(points2);
                    print('aux');
                    print(auxpoint);
                    points = auxpoint;
                  print('hey');
                  print(points);
                  Navigator.of(context).pop();
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
      '25'
    ];

    List<int> recuadro = [
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
      0,
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


    ];

    Widget myPlay = new GridView.builder(

      scrollDirection: Axis.vertical,
      itemCount: value.length,
      shrinkWrap: true,
      gridDelegate:
      new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
      itemBuilder: (BuildContext context, int index) {
final _random = new Random(index);

        //recuadro.shuffle(Random(recuadro.elementAt(index)));
        int rng = recuadro[_random.nextInt(recuadro.length)];
        //List<int> mList = new List<int>();
        //mList.add(rng);
        //mList.shuffle();
        //int rng2 = mList.elementAt(index);
        //shuffle(new Random());

        var colorr = Colors.cyan;
        var colorrr = Colors.black;
        return new GestureDetector(
          child: new Card(
            color: colorr,
            child: new Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(120.0))),
              alignment: Alignment.center,
              child: new Column(
                  children: <Widget>[Container(child: Text(rng.toString()))]),
            ),
          ),
          onTap: () {
            points2 = auxpoint;
            updatePoint(points);
            updatePoint2(points2);
            print('points2');
            print(points2);
            if (rng == 0) {
              points = 0;
              updatePoint(points);
              _neverSatisfied(context);
              mColor = colorr;
              print('points');
              print(points);
              print('points2');
              print(points2);
              new Column(
                  children: <Widget>[Container(child: Text(rng.toString()))]);
            } else {
              points2 += rng;
              points += rng;
              updatePoint2(points2);
              updatePoint(points);
              print('points2222');
              print(points2);


            }
          },
        );
      },
    );

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
                    child: Center( child: Text('$auxpoint',
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


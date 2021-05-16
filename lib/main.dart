//BMI CALCULATION APPLICATION FOR ANDROID

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.purple.shade900),
    debugShowCheckedModeBanner: false,
    home: myapp(),
  ));
}

class myapp extends StatefulWidget {
  @override
  _myappState createState() => _myappState();
}

class _myappState extends State<myapp> {
  double _height = 192;
  double _weight = 40;
  String _condition = 'Obesity';
  int _bmi = 31;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              height: size.height * 0.4,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.purple.shade900),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BMI',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 60),
                  ),
                  Text(
                    'Calculator',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                        child: Text(
                      '$_bmi',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 45),
                      textAlign: TextAlign.right,
                    )),
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Condition : ',
                        style: TextStyle(color: Colors.white, fontSize: 27),
                        children: [
                          TextSpan(
                            text: '$_condition',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 27,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Choose Data',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.purple.shade900,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  RichText(
                      text: TextSpan(
                          text: 'Height: ',
                          style: TextStyle(fontSize: 25, color: Colors.black87),
                          children: [
                        TextSpan(
                          text: '$_height Cm',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                        )
                      ])),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Slider(
                      activeColor: Colors.grey.shade900,
                      inactiveColor: Colors.grey.shade500,
                      min: 0.0,
                      max: 300,
                      value: _height,
                      label: '$_height',
                      divisions: 300,
                      onChanged: (value) {
                        setState(() {
                          _height = value;
                        });
                      }),
                  RichText(
                      text: TextSpan(
                          text: 'Weight: ',
                          style: TextStyle(fontSize: 25, color: Colors.black87),
                          children: [
                        TextSpan(
                          text: '$_weight Kg',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                        )
                      ])),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Slider(
                      activeColor: Colors.grey.shade900,
                      inactiveColor: Colors.grey.shade500,
                      min: 0.0,
                      max: 400.0,
                      value: _weight,
                      label: '$_weight',
                      divisions: 400,
                      onChanged: (value) {
                        setState(() {
                          _weight = value;
                        });
                      }),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  FlatButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: () {
                        setState(() {
                          //(18.5-25 HEALTHY )(25-30 OVERWEIGHT)(>30 OBESITY)
                          _bmi =
                              ((_weight) / ((_height / 100) * (_height / 100)))
                                  .round()
                                  .toInt();
                          if (_bmi >= 18.5 && _bmi <= 25) {
                            _condition = 'Healthy';
                          } else if (_bmi > 25 && _bmi <= 30) {
                            _condition = 'OverWeight';
                          } else if (_bmi > 30) {
                            _condition = 'Obesity';
                          } else {
                            _condition = 'UnderWeight';
                          }
                        });
                      },
                      color: Colors.purple.shade900,
                      textColor: Colors.white,
                      child: Text(
                        'Calculate',
                        style: TextStyle(fontSize: 25),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

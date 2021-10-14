import 'dart:ui';


import 'package:bmi2/widgets/left_bar.dart';
import 'package:bmi2/widgets/right_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget
{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen>
{

  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.black45,
      body: SingleChildScrollView(
        child:Column(
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                // Height
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: Colors.yellowAccent,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.yellowAccent,
                      ),
                    ),
                  ),
                ),

                // Mass
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: Colors.yellowAccent,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.yellowAccent,
                      ),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 30,),
            // calculate button.
            // GestureDetector:A way to handle tapping on the screen.
            // onTap: Touching the surface of the screen for a short period.
            GestureDetector(
              onTap: (){
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if(_bmiResult > 25)
                  {
                    _textResult = "You're over weight!";
                  }
                  else if(_bmiResult >= 18.5 && _bmiResult <= 25)
                  {
                    _textResult = "You have a normal weight";
                  }
                  else
                  {
                    _textResult = "You're under weight";
                  }
                });
              },
              child: Text("Calculate",style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),),
            ),
            SizedBox(height: 50,),
            // Final Results.
            Container(
              child: Text(_bmiResult.toStringAsFixed(2),style: TextStyle(
                fontSize: 90,
                fontWeight: FontWeight.bold,
                color: Colors.yellowAccent,
              ),),
            ),
            SizedBox(height: 30,),
            // Final state.
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
              child: Text(_textResult.toString(),style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w400,
                color: Colors.yellow,
              ),),
            ),),
            //Adding our left & right widgets.
            SizedBox(height: 40,),
            LeftBar(40.0),
            SizedBox(height: 20,),
            LeftBar(70.0),
            SizedBox(height: 20,),
            LeftBar(40.0),
            RightBar(70.0),
            SizedBox(height: 20,),
            RightBar(50.0),
            SizedBox(height: 20,),
            RightBar(30.0),

          ],
        )
      )
    );
  }

}
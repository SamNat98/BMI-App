import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new PageCreater();
  }


}

class PageCreater extends State<BMI> {

  final TextEditingController _age = new TextEditingController();
  final TextEditingController _height = new TextEditingController();
  final TextEditingController _weight = new TextEditingController();

  double bmi = 0.0;
  String verdict = "";

  void Calculate() {
    setState(() {
      bmi = double.parse(_weight.text) /
          ((double.parse(_height.text) / 100) *
              (double.parse(_height.text) / 100));

      if (bmi < 18.5) {
        verdict = "You are Underweight";
      }
      else if (bmi >= 18.5 && bmi <= 24.9) {
        verdict = "You are Normal or Healthy Weight";
      }
      else if (bmi >= 25.0 && bmi <= 29.9) {
        verdict = "You are Overweight";
      }
      else {
        verdict = "You are Obese";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI",
          style: new TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.cyanAccent.shade100,

      body: new Container(
        alignment: Alignment.topCenter,
        margin: new EdgeInsets.all(3.0),

        child: new ListView(
          children: <Widget>[

            new Image.asset("images/logo.png",
              height: 140.0,
              width: 140.0,),

            new Padding(padding: new EdgeInsets.all(5.0)),

            new Container(
              height: 260.0,
              width: 380.0,
              color: Colors.blueGrey.shade100,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  new TextField(
                    controller: _age,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Age",
                        hintText: "in Numbers",
                        icon: new Icon(Icons.person)
                    ),
                  ),

                  new TextField(
                    controller: _height,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Height",
                        hintText: "in Centimeters",
                        icon: new Icon(Icons.linear_scale)
                    ),
                  ),

                  new TextField(

                    controller: _weight,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Weight",
                        hintText: "in Kilograms",
                        icon: new Icon(Icons.line_weight)
                    ),
                  ),
                ],
              ),

            ),

            new Padding(padding: new EdgeInsets.all(6.0)),

            new Center(
              child:
              new RaisedButton(onPressed: Calculate,
                color: Colors.deepOrange,

                child: new Text("Calculate",
                  style: new TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 22.0
                  ),),),
            ),

            new Padding(padding: new EdgeInsets.all(10.0)),

            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                new Text("Your BMI is ${bmi.toStringAsFixed(2)}",
                  style: new TextStyle(
                      color: Colors.black,
                      fontSize: 23.0,
                      fontWeight: FontWeight.w700
                  ),),

                new Padding(padding: new EdgeInsets.all(6.0)),


                new Text("$verdict",
                  style: new TextStyle(
                      color: Colors.black38,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700
                  ),)


              ],
            )


          ],
        )
        ,
      )
      ,

    );
  }
}
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false, title: "Converter", home: Homepage()));

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String temp="", result="0", state="celsius";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Temperature converter"),
          backgroundColor: Colors.blue,
          centerTitle: true),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: 20),
            Text("Enter the temperature to convert in celsius or fahrenheit"),
            TextField(
              onChanged: (val){
                temp=val;
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Enter temperature",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
           
            SizedBox(height: 20),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                
                //side: BorderSide(color: Colors.red)
              ),
              height: 40,
              color: Colors.blue,
              child: Text("Convert into Fahrenheit", style: TextStyle(fontSize:18, color: Colors.black)),
              onPressed: (() {
                setState(() {
                  result=(double.parse(temp)*(9/5)+32).toString();
                  state="Fahrenheit";

                });                
              })), 
              SizedBox(height: 20),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                
                //side: BorderSide(color: Colors.red)
              ),
              height: 40,
              color: Colors.blue,
              child: Text("Convert into celsius", style: TextStyle(fontSize:18, color: Colors.black)),
              onPressed: (() {
                setState(() {
                  result=((double.parse(temp)-32)*(5/9)).toString();
                  state="celsius";

                });
              })), 
              SizedBox(height: 20),
              Center(
                child: Text("The result is $result in $state",style: TextStyle(fontSize: 16),),
              ) 
            
                      
          ],
        ),
      ),
    );
  }
}

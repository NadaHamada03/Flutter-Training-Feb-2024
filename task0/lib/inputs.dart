import 'package:flutter/material.dart';

class Inputs extends StatefulWidget
{
  const Inputs() : super();

  @override
  Add createState() => Add();

  TextEditingController input1 => TextEditingController();
  TextEditingController input2 => TextEditingController();
}

class Add extends State<Inputs>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          Text("Addition App"),
          TextField(
            controller: input1,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
            labelText: "Number 1")),
          TextField(
              controller: input2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Number 2")),
          ElevatedButton(
              onPressed: (){
                var result = int.parse(input1.text) + int.parse(input2.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Result)
                );
              }, child: const Text("Add"))

        ]

      ),
    );
  }
}

class input2 {
}

class input1 {
}
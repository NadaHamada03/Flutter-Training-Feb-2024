import 'package:flutter/material.dart';

class Inputs extends StatefulWidget {
  Inputs() : super();

  @override
  _AddState createState() => _AddState();

  TextEditingController input1 = TextEditingController();
  TextEditingController input2 = TextEditingController();
}

class _AddState extends State<Inputs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Addition App"),
          TextField(
              controller: widget.input1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Number 1")),
          TextField(
              controller: widget.input2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Number 2")),
          ElevatedButton(
              onPressed: () {
                int result = int.parse(widget.input1.text) +
                    int.parse(widget.input2.text);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(result)));
              },
              child: const Text("Add"))
        ],
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final int result;

  ResultPage(this.result);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Center(
        child: Text(
          'The result is: $result',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Inputs(),
  ));
}

import 'package:flutter/material.dart';

class Inputs extends StatefulWidget {
  const Inputs() : super();

  @override
  Add createState() => Add();
}

class Add extends State<Inputs> {
  TextEditingController input1 = TextEditingController();
  TextEditingController input2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Addition App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: input1,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Number 1",
            ),
          ),
          TextField(
            controller: input2,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Number 2",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Perform addition
              int result = int.parse(input1.text) + int.parse(input2.text);

              // Navigate to the Result screen with the result
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Result(result),
                ),
              );
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }
}

class Result extends StatelessWidget {
  final int result;

  Result(this.result);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: Center(
        child: Text(
          "Result: $result",
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

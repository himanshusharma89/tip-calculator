import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Calculator',
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip Calculator'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              billTotal(),
              const SizedBox(
                height: 20,
              ),
              tip(),
              const SizedBox(
                height: 20,
              ),
              totalAmount()
            ],
          ),
        ),
      ),
    );
  }

  // A custom function to return Widget
  Widget billTotal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Bill Total',
          style: TextStyle(fontSize: 16),
        ),
        TextField()
      ],
    );
  }

  Widget tip() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Tip Percentage',
          style: TextStyle(fontSize: 16),
        ),
        TextField()
      ],
    );
  }

  Widget totalAmount() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Total Tip',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '0.0',
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Total',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '0.0',
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'amount.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Calculator',
      // Use Theming here.
      theme: ThemeData(
          // Define AppBar theme for the whole app
          appBarTheme: AppBarTheme(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            textTheme:
                GoogleFonts.nunitoSansTextTheme(Theme.of(context).textTheme),
          ),
          textTheme:
              GoogleFonts.nunitoSansTextTheme(Theme.of(context).textTheme)),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Variable to access the calculated bill and total
  double _totalBill = 0.0, _totalTip = 0.0;
  // Make sure to restart after adding controllers.
  final TextEditingController _billController = TextEditingController();
  final TextEditingController _tipPercentageController =
      TextEditingController(text: '15'); // Define initial text here

  @override
  void dispose() {
    _billController.dispose();
    _tipPercentageController.dispose();
    super.dispose();
  }

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
              // Pass the total bill and tip to stateless widget Amount
              Amount(
                totalBill: _totalBill
                    .toStringAsFixed(2), // Fix the total to decimal points
                totalTip: _totalTip.toStringAsFixed(2),
              ),
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
      children: [
        const Text(
          'Bill Total',
          style: TextStyle(fontSize: 16),
        ),
        TextField(
          controller: _billController,
          // Define the type of keyboard to use for input
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          showCursor: true,
          autofocus: true,
          onChanged: (val) {
            _calculateTotal();
          },
          // Text style of the input
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          decoration: const InputDecoration(
              border: InputBorder.none, // Removes border
              hintText: 'Enter Bill Amount', // Add hint text
              hintStyle: TextStyle(fontWeight: FontWeight.normal)),
        )
      ],
    );
  }

  Widget tip() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tip Percentage',
          style: TextStyle(fontSize: 16),
        ),
        TextField(
          controller: _tipPercentageController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          showCursor: true,
          autofocus: true,
          onChanged: (val) {
            _calculateTotal();
          },
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter Tip Percentage',
              hintStyle: TextStyle(fontWeight: FontWeight.normal)),
        )
      ],
    );
  }

  // Function to calculate the total tip and bill
  void _calculateTotal() {
    // Check whether the TextField is empty
    // if not parse the input field text using TextEditingController
    final _bill =
        _billController.text.isEmpty ? 0.0 : double.parse(_billController.text);
    final _tipPercentage = _tipPercentageController.text.isEmpty
        ? 0.0
        : double.parse(_tipPercentageController.text);
    _totalTip = (_bill * _tipPercentage) / 100;
    _totalBill = _bill + _totalTip;
    // Update the state with new value and re-run the build method
    setState(() {});
  }
}

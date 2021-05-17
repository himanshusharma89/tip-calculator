import 'package:flutter/material.dart';

class Amount extends StatelessWidget {
  // Constructor here receive the total bill and tip
  const Amount({Key key, @required this.totalBill, @required this.totalTip})
      : super(key: key);

  final String totalBill, totalTip;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Colors.deepPurple.shade50),
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          amountText(text: 'Tip Total', amount: totalTip),
          const SizedBox(
            width: 20,
          ),
          amountText(text: 'Total', amount: totalBill),
        ],
      ),
    );
  }

  Widget amountText({String text, String amount}) {
    return Flexible(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 16, color: Colors.deepPurple.shade900),
          ),
          FittedBox(
            child: Text(
              amount,
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.deepPurple.shade900,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

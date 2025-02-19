import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final List<Map<String, dynamic>> cards = [
    {
      "type": "Physical ebl card",
      "color": Colors.blue,
      "number": "**** 2437 **** 2424",
      "exp": "12/29",
      "balance": 2960.00,
    },
    {
      "type": "Virtual ebl card",
      "color": Colors.grey[300],
      "number": "**** 6543 **** 6489",
      "exp": "01/27",
      "balance": 1280.00,
    },
  ];

  final List<FlSpot> weeklySpending = [
    FlSpot(0, 200),
    FlSpot(1, 300),
    FlSpot(2, 250),
    FlSpot(3, 400),
    FlSpot(4, 500),
    FlSpot(5, 270),
    FlSpot(6, 320),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wallets",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.add_circle_outline,
              size: 28,
            ),
            onPressed: () {},
          ),
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                  cards.map((card) {
                    return Expanded(
                      child: Card(
                        color: card["color"],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(padding: const EdgeInsets.all(16),
                        child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                            Text(card["type"], style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),

                            Text("Number", style: TextStyle(color: Colors.grey )),
                            Text(card["number"], style: TextStyle(fontSize: 16)),
                            SizedBox(height: 10),

                            Text("Exp.", style: TextStyle(color: Colors.grey)),
                            //Text(card["Exp"], style: TextStyle(fontSize: 16)),
                            SizedBox(height: 15),

                            Text("Current Balance", style: TextStyle(color: Colors.grey)),
                            Text("\$${card["balance"].toStringAsFixed(2)}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                           ],
                        ),
                        ),
                      ),
                    );
                  }).toList(),
          ),
              ]),


          ),
        ),
      );
  }
}

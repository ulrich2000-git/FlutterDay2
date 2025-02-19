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
        title: Text("Wallets", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icon.add_circle_outline, size: 28,),
            onPressed: () {
            },
          ),
        ],
        elevation: 0,
      ),
      
    );
  }
}

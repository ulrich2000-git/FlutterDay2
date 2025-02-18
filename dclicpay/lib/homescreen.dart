import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/transaction_provider.dart';
import '../widgets/transaction_list.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Balance Card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Richy account", style: TextStyle(color: Colors.white70)),
                  SizedBox(height: 10),
                  Text("\$${provider.totalBalance.toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
                  SizedBox(height: 5),
                  Text("Total balance", style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Features
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                featureButton(icon: Icons.send, label: "Send"),
                featureButton(icon: Icons.download, label: "Receive"),
                featureButton(icon: Icons.card_giftcard, label: "Rewards"),
              ],
            ),
            SizedBox(height: 20),

            // Recent Activity
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recent activity", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("All", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),

            Expanded(child: TransactionList()),
          ],
        ),
      ),
    );
  }
  
  featureButton({required IconData icon, required String label}) {}
}
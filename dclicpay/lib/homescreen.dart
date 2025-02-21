import 'package:dclicpay/giftscreen.dart';
import 'package:dclicpay/send_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/transaction_provider.dart';
import '../widgets/transaction_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedFilter = "All";

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
            SizedBox(width: 10),
            Text(
              "Hello Richy !",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Richy account", style: TextStyle(color: Colors.white70)),
                      Text("Arian zesan", style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "\$${provider.totalBalance.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5),
                      Text("Total balance", style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Added card: 05", style: TextStyle(color: Colors.white70)),
                      Text("Ac. no. 2234521", style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Features
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Features", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("See more", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SendScreen()),
                    ).then((_) {
                      provider.loadTransactions();
                    });
                  },
                  child: Text("Send"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Receive"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GiftScreen()),
                    );
                  },
                  child: Text("Rewards"),
                ),
              ],
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recent activity", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                DropdownButton<String>(
                  value: selectedFilter,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedFilter = newValue;
                      });
                      provider.filterTransactions(newValue);
                    }
                  },
                  items: <String>["All", "Income", "Expenses"]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 10),
            
            Expanded(
  child: Consumer<TransactionProvider>(
    builder: (context, provider, child) {
      if (provider.transactions.isEmpty) {
        return Center(child: Text("Aucune transaction trouvée"));
      }
      
      return ListView.builder(
        itemCount: provider.transactions.length,
        itemBuilder: (context, index) {
          final transaction = provider.transactions[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: transaction.avatar != null
                  ? NetworkImage(transaction.avatar)
                  : AssetImage('assets/images/avatar.png') as ImageProvider,
            ),
            title: Text(transaction.name, style: TextStyle(fontWeight: FontWeight.bold)),
            //subtitle: Text(transaction.date as String),
            trailing: Text(
              "\$${transaction.amount.toStringAsFixed(2)}",
              style: TextStyle(
                color: transaction.amount > 0 ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      );
    },
  ),
),

          ],
        ),
      ),
    );
  }
}

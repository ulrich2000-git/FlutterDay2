import 'package:flutter/material.dart';

class SendScreen extends StatefulWidget {
  const SendScreen({super.key});

  @override
  _SendScreenState createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  String selectedCard = "Physical ebl card"; 
  double amount = 75.00;
  bool isAgreed = false;
  final TextEditingController recipientController = TextEditingController(); // TextField fonctionne

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView( //Permet de scroller pour éviter le débordement
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Divider(thickness: 3, color: Colors.grey[300], indent: 100, endIndent: 100),
                    SizedBox(height: 10),
                    Text("Send money", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Select Card Section
              Text("Select card", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Row(
                children: [
                  _buildCardButton("Physical ebl card"),
                  SizedBox(width: 10),
                  _buildCardButton("Virtual ebl card"),
                  SizedBox(width: 10),
                  _buildCardButton("Ebl"),
                ],
              ),

              SizedBox(height: 20),

              // Choose Recipient
              Text("Choose recipient", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              TextField(
                controller: recipientController, // Permet d'écrire du texte
                decoration: InputDecoration(
                  hintText: "Type name/card/phone number/email",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),

              SizedBox(height: 20),

              // Amount Section
              Text("Amount", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      "\$${amount.toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Slider(
                      value: amount,
                      min: 0,
                      max: 1000,
                      divisions: 100,
                      label: "\$${amount.toStringAsFixed(2)}",
                      onChanged: (value) {
                        setState(() {
                          amount = value;
                        });
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              // Terms & Conditions ✅ Fonctionnelle
              Row(
                children: [
                  Checkbox(
                    value: isAgreed,
                    onChanged: (value) {
                      setState(() {
                        isAgreed = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: Text("Agree with ideate’s terms and conditions"),
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Send Money Button Fonctionnel
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isAgreed
                      ? () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Money sent successfully!")),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isAgreed ? Colors.blue : Colors.grey, //Désactivé si case non cochée
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text("Send money", style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardButton(String cardName) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCard = cardName;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: selectedCard == cardName ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          cardName,
          style: TextStyle(
            color: selectedCard == cardName ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
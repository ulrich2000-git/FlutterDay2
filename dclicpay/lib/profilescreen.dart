import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String selectedCard = "Physical ebl card"; // Par défaut, carte sélectionnée
  double amount = 75.00;
  bool isAgreed = false;

  final List<Map<String, String>> cards = [
    {"name": "Physical ebl card", "image": "assets/images/mastercard.png"},
    {"name": "Virtual ebl card", "image": "assets/images/visa.png"},
    {"name": "Ebl", "image": "assets/images/ebl.png"},
  ];

  final List<String> recipients = [
    "assets/images/avatar1.png",
    "assets/images/avatar2.png",
    "assets/images/avatar3.png",
    "assets/images/avatar4.png",
  ];
  get recipientController => null;

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
      body: SingleChildScrollView(
      child:
       Padding(
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
              children: cards.map((card) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCard = card["name"]!;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: selectedCard == card["name"] ? Colors.blue : Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Image.asset(card["image"]!, height: 20),
                        SizedBox(width: 5),
                        Text(
                          card["name"]!,
                          style: TextStyle(
                            color: selectedCard == card["name"] ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),

            SizedBox(height: 20),

            // Choose Recipient
            Text("Choose recipient", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            TextField(
              controller: recipientController,
              decoration: InputDecoration(
                hintText: "Type name/card/phone number/email",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: recipients.map((img) {
                return CircleAvatar(radius: 30, backgroundImage: AssetImage(img));
              }).toList(),
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

            // Terms & Conditions
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
              Expanded:(
                child: Text("Agree with ideate’s terms and conditions"),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Send Money Button
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
                  backgroundColor: Colors.blue,
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
    )
    );
  }
}
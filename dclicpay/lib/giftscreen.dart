import 'package:flutter/material.dart';

class GiftScreen extends StatefulWidget {
  @override
  _GiftScreenState createState() => _GiftScreenState();
}

class _GiftScreenState extends State<GiftScreen> {
  int giftPoints = 2500;

  final List<GiftItem> gifts = [
    GiftItem("Carte cadeau Amazon", "assets/amazon_gift.png", 1000),
    GiftItem("Abonnement Spotify", "assets/spotify.png", 1500),
    GiftItem("Réduction sur frais de transaction", "assets/discount.png", 500),
    GiftItem("Cashback \$5", "assets/cashback.png", 2000),
  ];

  void _redeemGift(int cost) {
    if (giftPoints >= cost) {
      setState(() {
        giftPoints -= cost;
      });

      _showSnackBar("Cadeau échangé avec succès ! 🎉", Colors.green);
    } else {
      _showSnackBar("Points insuffisants ❌", Colors.red);
    }
  }

  void _showSnackBar(String message, Color color) {
    try {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: color,
        ),
      );
    } catch (e) {
      debugPrint("Erreur Snackbar : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadeaux')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPointsCard(),
            SizedBox(height: 20),
            Text("Choisissez un cadeau 🎁", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: gifts.length,
                itemBuilder: (context, index) {
                  return _buildGiftTile(gifts[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPointsCard() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.blueAccent,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Mes Points 🎯", style: TextStyle(color: Colors.white, fontSize: 18)),
                SizedBox(height: 5),
                Text("$giftPoints pts", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            ),
            Icon(Icons.card_giftcard, color: Colors.yellow, size: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildGiftTile(GiftItem gift) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: _buildGiftImage(gift.image),
        title: Text(gift.name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("${gift.pointsCost} points"),
        trailing: ElevatedButton(
          onPressed: () => _redeemGift(gift.pointsCost),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
          child: Text("Échanger"),
        ),
      ),
    );
  }

  Widget _buildGiftImage(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        imagePath,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Icon(Icons.image_not_supported, size: 50, color: Colors.grey);
        },
      ),
    );
  }
}

class GiftItem {
  final String name;
  final String image;
  final int pointsCost;

  GiftItem(this.name, this.image, this.pointsCost);
}

import 'package:u_credit_card/u_credit_card.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wallet", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
        
      body: const Center(
        child: CreditCardUi(
          width: 300,
          cardHolderFullName: 'John Doe',
          cardNumber: '1234567812345678',
          validFrom: '01/23',
          validThru: '01/28',
          topLeftColor: Colors.blue,
          doesSupportNfc: true,
          placeNfcIconAtTheEnd: true,
          cardType: CardType.debit,
          cardProviderLogo: FlutterLogo(),
          cardProviderLogoPosition: CardProviderLogoPosition.right,
          showBalance: true,
          balance: 128.32434343,
          autoHideBalance: true,
          enableFlipping: true,
          cvvNumber: '123',
        ),
      ),
    );
  }
}
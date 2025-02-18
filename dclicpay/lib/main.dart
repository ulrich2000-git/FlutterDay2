import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/transaction_provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TransactionProvider(),
      child: DclicPay(),
    ),
  );
}

class DclicPay extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Banking App',
      theme: ThemeData(
          primarySwatch: Colors,blue,
      ),
      home: MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  @override
  _MainNavigatorScreenState createState() => _MainNavigatorScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    WalletScreen(),
    GiftScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
        _selectedIndex = index;
    });
  }

 @override 
 Widget build(BuildContext context)  {
  return Scaffold(
    body: _Screen[_selectedIndex],
    bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: Color.blue,
            unselectedItemColor: Color.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(icon:Icon(Icon.home), label: "Home"),
              BottomNavigationBarItem(icon:Icon(Icon.account_balance_wallet), label: "Wallet"),
              BottomNavigationBarItem(icon:Icon(Icon.card_giftcard), label: "Gift"),
              BottomNavigationBarItem(icon:Icon(Icon.person), label: "Profile"),
            ],
    ),
  );
 }
}
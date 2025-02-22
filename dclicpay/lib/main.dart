import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dclicpay/giftscreen.dart';
import 'package:dclicpay/profilescreen.dart';
import 'package:dclicpay/walletscreen.dart';
import 'package:dclicpay/homescreen.dart';
import 'providers/transaction_provider.dart';
import 'package:dclicpay/loginscreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TransactionProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: DclicPay(),
    ),
  );
}

class DclicPay extends StatelessWidget {
  const DclicPay({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Banking App',
          theme: themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          home: MainNavigationScreen(),

          routes: {
               '/login': (context) => LoginScreen(),
          },

        );
      },
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  _MainNavigationScreenState createState() => _MainNavigationScreenState();
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],  
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: "Wallet"),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: "Gift"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Profil Utilisateur')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            SizedBox(height: 16),
            Text('Utilisateur',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Email inconnu', textAlign: TextAlign.center),
            SizedBox(height: 16),
            _buildProfileOption('Téléphone', 'Non renseigné'),
            _buildProfileOption('Solde', '\$0'),
            _buildProfileOption('Mode de paiement', 'Non défini'),
            _buildProfileOption('2FA', 'Désactivé'),
            SwitchListTile(
              title: Text('Mode sombre'),
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme();
              },
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              icon: Icon(Icons.logout),
              label: Text('Déconnexion'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(String title, String value) {
    return ListTile(
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(value),
      trailing: Icon(Icons.edit, color: Colors.grey),
      onTap: () {
        // Ajouter une fonctionnalité de modification ici
      },
    );
  }
}

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}

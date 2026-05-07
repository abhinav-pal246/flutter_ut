import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.amber, // 👈 force the color
          //foregroundColor: Color.fromARGB(255, 13, 49, 56), // title/icons color
          elevation: 4,
        ),
      ),
      home: const RootPage(),
    );
  }
}

//passing a reference of statefull inside a stateless
class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    //instead of returning container , return scaffold
    return Scaffold(
      appBar: AppBar(title: const Text('My Wallet')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.home),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(
            icon: Icon(Icons.receipt_long),
            label: 'Transactions',
          ),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
        //buttonfy the navigation
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}

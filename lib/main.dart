import 'package:flutter/material.dart';

void main() {
  runApp(HelloApp());
}

// Section 1: StatelessWidget HelloApp
class HelloApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Hello Flutter App',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.indigoAccent,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              padding: EdgeInsets.all(20),
              child: Text(
                'Hello, Flutter!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigoAccent,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        bottomNavigationBar: NavigationBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    'Action Completed',
                    style: TextStyle(color: Colors.indigoAccent, fontWeight: FontWeight.bold),
                  ),
                  content: Text('You have successfully pressed the button!'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('OK', style: TextStyle(color: Colors.indigoAccent)),
                    ),
                  ],
                );
              },
            );
          },
          backgroundColor: Colors.indigoAccent,
          child: Icon(Icons.check, size: 28),
        ),
      ),
    );
  }
}

// Section 2: Navigation Bar
class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, 'Home'),
          _buildNavItem(Icons.person, 'Profile'),
          _buildNavItem(Icons.settings, 'Settings'),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.indigoAccent, size: 28),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.indigoAccent,
          ),
        ),
      ],
    );
  }
}

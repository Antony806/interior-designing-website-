import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Landing Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.blueAccent,
          elevation:8,
          title: LayoutBuilder(
            builder: (context, constraints) {
              final screenWidth = constraints.maxWidth;

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo and Title
                  Row(
                    children: [
                     
                      const SizedBox(width: 8),
                      if (screenWidth > 600)
                        const Text(
                          'PUGAZH INTERIORS',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                    ],
                  ),

                  // Navigation Items
                  if (screenWidth > 800)
                    Row(
                      children: [
                        _navItem('Home', context),
                        _navItem('About Us', context),
                        _navItem('Features', context, hasDropdown: true),
                        _navItem('Blog', context),
                        _navItem('FAQ', context),
                      ],
                    ),

                  // Sign In Button
                 
                ],
              );
            },
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Welcome to Pugazh Interiors',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'We design your dreams',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: null,
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem(String text, BuildContext context, {bool hasDropdown = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () => _navigateTo(context, text),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              if (hasDropdown)
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateTo(BuildContext context, String page) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Navigating to $page...')),
    );
  }
}

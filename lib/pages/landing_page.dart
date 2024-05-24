import 'package:flutter/material.dart';
import 'package:news_app/pages/home.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                "images/landing.jpeg",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.8,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20.0),
            const Center(
              child: Text(
                "News from around the\nworld for you",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const Center(
              child: Text(
                "Best time to read, take your time to read a \nlittle more about the world",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 4.0,
              ),
              child: const Text(
                "Get started",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//winpage.dart
import 'package:flutter/material.dart';

class WinPage extends StatelessWidget {
  const WinPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final int timeTaken = args['timeTaken']; // Ensure this is an int
    final int attempts = args['attempts'];
    final int successfulAttempts = args['successfulAttempts'];
    final int unsuccessfulAttempts = attempts - successfulAttempts;
    final int quitCount = args['quitCount'];
    final String difficulty = args['difficulty'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFCB8B8),
        title: const Text("You Win!"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('🎉 You Win! 🎉', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Text('Time Taken: $timeTaken seconds', style: const TextStyle(fontSize: 24)),
            Text('Total Attempts: $attempts', style: const TextStyle(fontSize: 24)),
            Text('Successful Attempts: $successfulAttempts', style: const TextStyle(fontSize: 24)),
            Text('Unsuccessful Attempts: $unsuccessfulAttempts', style: const TextStyle(fontSize: 24)),
            Text('Quit Count: $quitCount', style: const TextStyle(fontSize: 24)),
            Text('Difficulty: ${difficulty.toUpperCase()}', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFC6C6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const Text('Play Again', style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF9A9A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Exit', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
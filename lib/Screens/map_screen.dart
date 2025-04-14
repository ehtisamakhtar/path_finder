import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final from = args['from'];
    final to = args['to'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Map'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Route from "$from" to "$to"',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: InteractiveViewer(
              maxScale: 4.0,
              child: Image.asset(
                'assets/images/map.png', // Add your image here later
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Center(
                  child: Text('Map image not found'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';
import '../widgets/room_selectors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? fromRoom;
  String? toRoom;

  final List<String> rooms = [
    'Room 101',
    'Room 102',
    'Library',
    'Lab A',
    'Lab B',
  ];

  void handleNavigate() {
    if (fromRoom != null && toRoom != null) {
      Navigator.pushNamed(context, '/map', arguments: {
        'from': fromRoom,
        'to': toRoom,
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select both rooms.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UniPath - Home')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            RoomSelector(
              label: 'From',
              value: fromRoom,
              rooms: rooms,
              onChanged: (value) => setState(() => fromRoom = value),
            ),
            const SizedBox(height: 16),
            RoomSelector(
              label: 'To',
              value: toRoom,
              rooms: rooms,
              onChanged: (value) => setState(() => toRoom = value),
            ),
            const SizedBox(height: 32),
            PrimaryButton(text: 'Show Route', onPressed: handleNavigate),
          ],
        ),
      ),
    );
  }
}

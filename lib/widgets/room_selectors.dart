import 'package:flutter/material.dart';

class RoomSelector extends StatelessWidget {
  final String label;
  final String? value;
  final List<String> rooms;
  final Function(String?) onChanged;

  const RoomSelector({
    super.key,
    required this.label,
    required this.value,
    required this.rooms,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      value: value,
      items: rooms.map((room) {
        return DropdownMenuItem(value: room, child: Text(room));
      }).toList(),
      onChanged: onChanged,
    );
  }
}

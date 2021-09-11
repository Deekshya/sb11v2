import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final String status;
  final Color color;
  StatusCard({required this.status, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          status,
          //'• LIVE',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

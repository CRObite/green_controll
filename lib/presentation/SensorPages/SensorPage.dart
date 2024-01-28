import 'package:flutter/material.dart';

class SensorPage extends StatefulWidget {
  const SensorPage({super.key});

  @override
  State<SensorPage> createState() => _SensorPageState();
}

class _SensorPageState extends State<SensorPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Sensor'),);
  }
}

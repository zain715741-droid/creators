import 'package:flutter/material.dart';

class ModelScreen extends StatefulWidget {
  const ModelScreen({super.key});

  @override
  State<ModelScreen> createState() => _ModelScreenState();
}
 final List<car> cars = [
  car(door: '2', tire: '4'),
  car(door: 'hello', tire: '4'),
  car(door: '5whatsup', tire: '4'),
  car(door: 'zain', tire: '4'),];
class _ModelScreenState extends State<ModelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          final car currentCar = cars[index];
          return Card(
            child: ListTile(
              title: Text(currentCar.door),
              subtitle: Text(currentCar.tire),
            ),
        );
      }),
    );
  }
}


class car {
  String door;
  String tire;

  car({required this.door, required this.tire});
}

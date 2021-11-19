import 'package:flutter/material.dart';
import 'package:hello_world_2/dog_model.dart';

class AnimalList extends StatefulWidget {
  const AnimalList({Key? key}) : super(key: key);

  @override
  _AnimalListState createState() => _AnimalListState();
}

class _AnimalListState extends State<AnimalList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 24,
                )
              ]
            ),
            child: Column(
              children: [
                Text(
                  dogs[index].name,
                ),
                Text(
                  '${dogs[index].weight} lbs',
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

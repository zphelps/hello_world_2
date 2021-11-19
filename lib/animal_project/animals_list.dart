import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hello_world_2/animal_project/cards/list_card.dart';
import 'package:hello_world_2/animal_project/models/dog.dart';
import 'package:http/http.dart';
import 'package:loading_indicator/loading_indicator.dart';

class AnimalsList extends StatefulWidget {
  const AnimalsList({required this.dogs});

  final List<Dog> dogs;

  @override
  _AnimalsListState createState() => _AnimalsListState();
}

class _AnimalsListState extends State<AnimalsList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.dogs.length,
      itemBuilder: (context, index) {
        return ListCard(dog: widget.dogs[index],);
      },
    );
  }
}

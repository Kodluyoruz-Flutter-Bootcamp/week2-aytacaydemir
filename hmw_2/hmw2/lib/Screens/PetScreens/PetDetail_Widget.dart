import 'package:flutter/material.dart';
import '../../Models/Pet.dart';

class PetDetail_Widget extends StatelessWidget {
  PetDetail_Widget({super.key, required this.pet});

  Pet pet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Pet"),
          backgroundColor: Colors.red,
        ),
        body: Container(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(pet.name.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(pet.id.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(pet.disease.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(pet.breed.toString()),
                ),
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hmw2/Enum/PetType.dart';
import 'package:hmw2/Screens/PetScreens/PetList.dart';

import '../../Models/Pet.dart';
import 'PetDetail_Widget.dart';

class PetOperations_Widget extends StatefulWidget {
  const PetOperations_Widget({super.key});

  List<Pet> get lstPets => _PetOperations_WidgetState().lstPets;

  List<Pet> getPetList() {
    return lstPets;
  }

  @override
  State<PetOperations_Widget> createState() => _PetOperations_WidgetState();
}

class _PetOperations_WidgetState extends State<PetOperations_Widget> {
  TextEditingController ctId = TextEditingController();
  TextEditingController ctName = TextEditingController();
  TextEditingController ctBreed = TextEditingController();
  TextEditingController ctDisease = TextEditingController();

  List<Pet> lstPets = <Pet>[];

  PetType? selectedPetType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Pet Clinic Registration System"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              TextField(
                controller: ctDisease,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter diseases'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: TextField(
                  controller: ctName,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Animal Name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: TextField(
                  controller: ctId,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter unique ID '),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: TextField(
                  controller: ctBreed,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Animal Breed '),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text("Choose animal type before save:"),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: DropdownButton<PetType>(
                  onChanged: (PetType? newValue) {
                    setState(() {
                      selectedPetType = newValue;
                    });
                  },
                  items: PetType.values.map((PetType value) {
                    return DropdownMenuItem<PetType>(
                      value: value,
                      child: Text(value.name),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: savePet,
                  child: Text("Save"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(_createRoute());
                  },
                  child: Text("List Animals"),
                ),
              ),
              Container(
                height: 250,
                child: ListView.builder(
                    itemCount: lstPets.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ListTile(
                            title: Text(lstPets[index].name.toString()),
                            subtitle: Text(lstPets[index].breed.toString()),
                            leading: Icon(Icons.health_and_safety),
                            trailing:
                                Icon(Icons.arrow_forward, color: Colors.amber),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PetDetail_Widget(pet: lstPets[index]),
                                  ));
                            },
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  savePet() {
    Pet pet = new Pet();
    pet.id = ctId.text.toString();
    pet.name = ctName.text.toString();
    pet.breed = ctBreed.text.toString();
    pet.disease = ctDisease.text.toString();

    setState(() {
      lstPets.add(pet);
      //addPetRecords(pet);
      ctName.text = "";
      ctDisease.text = "";
      ctId.text = "";
      ctBreed.text = "";
    });
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => PetList(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      //List<Pet> lstPets;
      //List<Pet> petRecords = lstPets;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

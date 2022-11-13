import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hmw2/Screens/PetScreens/PetOperations_Page.dart';
import 'package:hmw2/Screens/PetScreens/PetOperations_Widget.dart';
import 'package:hmw2/Screens/PetScreens/PetList.dart';

import '../../Models/Pet.dart';
import 'PetDetail_Widget.dart';

class PetList extends StatefulWidget {
  PetList({super.key});

  @override
  State<PetList> createState() => _PetListState();
}

class _PetListState extends State<PetList> {
  List<Pet> petRecords = PetOperations_Widget().getPetList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pet Clinic Animal List"),
          centerTitle: true,
        ),
        body: Container(
          height: 2500,
          child: ListView.builder(
              itemCount: petRecords.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ListTile(
                      title: Text(petRecords[index].name.toString()),
                      subtitle: Text(petRecords[index].breed.toString()),
                      leading: Icon(Icons.person),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PetDetail_Widget(pet: petRecords[index]),
                            ));
                      },
                    ),
                  ),
                );
              }),
        ));
  }
}

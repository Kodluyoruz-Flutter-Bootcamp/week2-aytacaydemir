class Pet {
  String? id;
  String? name;
  String? breed; //ırk
  String? disease; //hastalık

  List<Pet> lstPets = <Pet>[];

  bool save(Pet pet) {
    lstPets.add(pet);
    return true;
  }

  Pet getPetList(int id) {
    return lstPets.firstWhere((element) => element.id == id);
  }

  List<Pet> getterPetList() {
    return lstPets;
  }
}

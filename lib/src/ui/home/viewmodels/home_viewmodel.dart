import 'package:cardapioapp/src/data/repository/snacks_repository.dart';
import 'package:cardapioapp/src/domain/models/snacks_models.dart';
import 'package:flutter/material.dart';

class HomeViewmodel extends ChangeNotifier{
  SnacksRepository snacksRepository;
  
  HomeViewmodel(this.snacksRepository);
  
  List<SnacksModels> _snacks = [];

  List<SnacksModels> get snacks => _snacks;

  Future<void> listSnacks(String snack) async {
    List<SnacksModels> data = await snacksRepository.read(snack);
    // print(data);
    _snacks = data;
    notifyListeners();
  }

  Future<void> recomendedListSnacks() async {
    List<SnacksModels> data = await snacksRepository.recomendedSnacks();

    _snacks = data;
    notifyListeners();
  }

}
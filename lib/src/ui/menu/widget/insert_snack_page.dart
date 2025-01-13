import 'package:cardapioapp/src/data/repository/snacks_repository.dart';
import 'package:cardapioapp/src/domain/models/snacks_models.dart';
import 'package:flutter/material.dart';

class InsertSnackPage extends StatefulWidget {
  const InsertSnackPage({super.key});

  @override
  State<InsertSnackPage> createState() => _InsertSnackPageState();
}

class _InsertSnackPageState extends State<InsertSnackPage> {
  final SnacksRepository _snacksRepository = SnacksRepository();
  final TextEditingController _dropDown = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _kcal = TextEditingController();
  final TextEditingController _proteins = TextEditingController();
  final TextEditingController _fats = TextEditingController();
  final TextEditingController _carbo = TextEditingController();

  List<String> typeSnack = ["burgers", "fries", "drinks", "chinckens"];
  String dropDownValue = "";

  @override
  void initState() {
    dropDownValue = typeSnack.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        title: Text(
          "Inserir Snacks",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownMenu(
                  controller: _dropDown,
                  initialSelection: dropDownValue,
                  width: MediaQuery.of(context).size.width - 32,
                  inputDecorationTheme: const InputDecorationTheme(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    filled: true,
                  ),
                  textStyle: Theme.of(context).textTheme.labelSmall,
                  menuStyle: const MenuStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                  ),
                  dropdownMenuEntries: typeSnack.map<DropdownMenuEntry<String>>(
                    (String value) {
                      return DropdownMenuEntry(
                        value: value,
                        label: value,
                      );
                    },
                  ).toList(),
                  onSelected: (String? value) {
                    setState(() {
                      dropDownValue = value!;
                      _dropDown.text = value;
                    });
                  }),
              TextFormField(
                controller: _name,
                decoration: InputDecoration(
                  label: Text("Nome"),
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                controller: _description,
                decoration: InputDecoration(
                  label: Text("Descrição"),
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                controller: _price,
                decoration: InputDecoration(
                  label: Text("Preço"),
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                controller: _kcal,
                decoration: InputDecoration(
                  label: Text("Kcal"),
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                controller: _proteins,
                decoration: InputDecoration(
                  label: Text("Proteins"),
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                controller: _fats,
                decoration: InputDecoration(
                  label: Text("Fats"),
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                controller: _carbo,
                decoration: InputDecoration(
                  label: Text("Carboidratos"),
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                 final res = _snacksRepository.insert(
                    _dropDown.text,
                    SnacksModels(
                      id: null,
                      name: _name.text,
                      descricao: _description.text,
                      price: double.parse(_price.text),
                      kcal: int.parse(_kcal.text),
                      proteins: double.parse(_proteins.text),
                      fats: double.parse(_fats.text),
                      carbo: double.parse(_carbo.text),
                    ),
                  );
                  // print(res);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFCBFF00),
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    color: Color(0xFF000000),
                  ),
                ),
                child: Text("Inserir"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

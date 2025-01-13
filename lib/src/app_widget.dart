import 'package:cardapioapp/src/data/repository/snacks_repository.dart';
import 'package:cardapioapp/src/ui/home/viewmodels/home_viewmodel.dart';
import 'package:cardapioapp/src/ui/home/widget/home_page.dart';
import 'package:cardapioapp/src/ui/menu/widget/insert_snack_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardapioApp extends StatelessWidget {
  const CardapioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => SnacksRepository()),
        ChangeNotifierProvider(create: (context) => HomeViewmodel(context.read()),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        title: "Cardápio App",
        home: HomePage(),
      ),
    );
  }
}
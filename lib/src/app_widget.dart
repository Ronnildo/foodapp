import 'package:cardapioapp/src/ui/details/widgets/details_page.dart';
import 'package:cardapioapp/src/ui/home/widget/home_page.dart';
import 'package:flutter/material.dart';

class CardapioApp extends StatelessWidget {
  const CardapioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: "Cardápio App",
      home: HomePage(),
    );
  }
}
import 'package:cardapioapp/src/ui/menu/widget/menu_page.dart';
import 'package:flutter/material.dart';

class SnackListWidget extends StatefulWidget {
  const SnackListWidget({
    super.key,
  });

  @override
  State<SnackListWidget> createState() => _SnackListWidgetState();
}

class _SnackListWidgetState extends State<SnackListWidget> {
  List<Map<String, dynamic>> snacks = [
    {"nome": "Burgers", "img": "assets/images/burger.png"},
    {"nome": "Chinkens", "img": "assets/images/chicken.png"},
    {"nome": "Fries", "img": "assets/images/fries.png"},
    {"nome": "Drinks", "img": "assets/images/drink.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: snacks.map((s) {
        return GestureDetector(
          onTap: () => _menuPage(s["nome"]),
          child: cardSnacks(
            s["nome"],
            s["img"],
          ),
        );
      }).toList(),
    );
  }

  _menuPage(String name) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MenuPage(
          snack: name,
        ),
      ),
    );
  }
}

Widget cardSnacks(String snack, String urlImage) {
  return Container(
    margin: EdgeInsets.only(left: 16, right: 10),
    padding: EdgeInsets.all(12),
    alignment: Alignment.center,
    width: 90,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      children: [
        Image(
          image: AssetImage(urlImage),
          width: 50,
          height: 50,
          fit: BoxFit.fitWidth,
        ),
        Text(
          snack,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    ),
  );
}

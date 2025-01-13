import 'package:flutter/material.dart';

class SnackListWidget extends StatefulWidget {
  final void Function() onTap;
  const SnackListWidget({super.key, required this.onTap});

  @override
  State<SnackListWidget> createState() => _SnackListWidgetState();
}

class _SnackListWidgetState extends State<SnackListWidget> {
  List<Map<String, dynamic>> snacks = [
    {"nome": "Burger", "img": "assets/images/burger.png"},
    {"nome": "Chicken", "img": "assets/images/chicken.png"},
    {"nome": "Fries", "img": "assets/images/fries.png"},
    {"nome": "Drink", "img": "assets/images/drink.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: snacks.map((s) {
        return GestureDetector(
            onTap: widget.onTap, child: cardSnacks(s["nome"], s["img"]));
      }).toList(),
    );
  }
}

Widget cardSnacks(String snack, String urlImage) {
  return Container(
    margin: EdgeInsets.only(left: 16, right: 20),
    padding: EdgeInsets.all(12),
    alignment: Alignment.center,
    width: 80,
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

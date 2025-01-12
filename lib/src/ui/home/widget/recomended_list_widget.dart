import 'package:flutter/material.dart';

class RecomendedListWidget extends StatefulWidget {
  const RecomendedListWidget({super.key});

  @override
  State<RecomendedListWidget> createState() => _RecomendedListWidgetState();
}

class _RecomendedListWidgetState extends State<RecomendedListWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      childAspectRatio: (0.75),
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(left: 16, right: 16,),
      crossAxisSpacing: 10,
      children: [cardContent(), cardContent(), cardContent(), cardContent()],
    );
  }

  Widget cardContent() {
    return Container(
      padding: EdgeInsets.all(10),  
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        spacing: 2,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Icon(Icons.favorite),
          ),
          Center(
            child: Image(
              image: AssetImage("assets/images/burger.png"),
              width: 120,
              height: 80,
            ),
          ),
          Text(
            "Hamburger Caseiro",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            "Pão, alho, alface, queijo, carne artesanal",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 10, fontWeight: FontWeight.w500, color: Colors.grey),
          ),
          SizedBox(height: 6,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$5,00",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color(0xFFCBFF00),
                ),
                alignment: Alignment.center,
                child: Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}

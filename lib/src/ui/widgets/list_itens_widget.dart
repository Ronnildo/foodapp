import 'package:cardapioapp/src/domain/models/snacks_models.dart';
import 'package:cardapioapp/src/ui/home/viewmodels/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListItensWidget extends StatefulWidget {
  final String name;
  final String description;
  final double price;

  final List<SnacksModels> snacks;
  const ListItensWidget({
    super.key,
    required this.snacks,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  State<ListItensWidget> createState() => _ListItensWidgetState();
}

class _ListItensWidgetState extends State<ListItensWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: widget.snacks.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        childAspectRatio: .7,
        crossAxisSpacing: 10,
      ),
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      itemBuilder: (context, index) {
        return cardContent(
          widget.snacks[index].name!,
          widget.snacks[index].descricao!,
          widget.snacks[index].price!,
        );
      },
    );
  }

  Widget cardContent(String name, String description, double price) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        spacing: 5,
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
            name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 10, fontWeight: FontWeight.w500, color: Colors.grey),
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$$price",
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

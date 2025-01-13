import 'package:cardapioapp/src/domain/models/snacks_models.dart';
import 'package:cardapioapp/src/ui/details/widgets/details_page.dart';
import 'package:flutter/material.dart';

class ListItensWidget extends StatefulWidget {
  final List<SnacksModels> snacks;
  final String type;
  const ListItensWidget({
    super.key,
    required this.snacks,
    required this.type,
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
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(
                  snack: widget.snacks[index],
                  type: widget.type,
                ),
              ),
            );
          },
          child: cardContent(
            widget.snacks[index].name!,
            widget.snacks[index].descricao!,
            widget.snacks[index].price!,
          ),
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
              image: AssetImage(typeSnack(widget.type)),
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

  String typeSnack(String type) {
    switch (type) {
      case "Burgers":
        return "assets/images/burger.png";
      case "Chinkens":
        return "assets/images/chicken.png";
      case "Fries":
        return "assets/images/fries.png";
      case "Drinks":
        return "assets/images/drink.png";
      case "":
        return "assets/images/not_image.png";
      default:
        return "";
    }
  }

  /** {"nome": "Burgers", "img": "assets/images/burger.png"},
    {"nome": "Chinkens", "img": "assets/images/chicken.png"},
    {"nome": "Fries", "img": "assets/images/fries.png"},
    {"nome": "Drinks", "img": "assets/images/drink.png"}, */
}

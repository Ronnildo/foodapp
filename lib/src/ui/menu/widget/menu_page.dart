import 'package:cardapioapp/src/ui/home/viewmodels/home_viewmodel.dart';
import 'package:cardapioapp/src/ui/widgets/list_itens_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  final String snack;
  const MenuPage({super.key, required this.snack});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  void initState() {
    context.read<HomeViewmodel>();
    context.read<HomeViewmodel>().listSnacks(widget.snack.toLowerCase());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewmodel>();
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        title: Text(
          widget.snack,
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: ListItensWidget(
        snacks: viewModel.snacks,
        type: widget.snack,
      ),
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          SizedBox(
            height: 6,
          ),
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

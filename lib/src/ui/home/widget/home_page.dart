import 'package:cardapioapp/src/ui/details/widgets/details_page.dart';
import 'package:cardapioapp/src/ui/home/viewmodels/home_viewmodel.dart';
import 'package:cardapioapp/src/ui/home/widget/card_widget.dart';
import 'package:cardapioapp/src/ui/menu/widget/insert_snack_page.dart';
import 'package:cardapioapp/src/ui/menu/widget/menu_page.dart';
// import 'package:cardapioapp/src/ui/widgets/list_itens_widget.dart';
import 'package:cardapioapp/src/ui/home/widget/snack_list_widget.dart';
import 'package:cardapioapp/src/ui/widgets/list_itens_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeViewmodel>();
    context.read<HomeViewmodel>().recomendedListSnacks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewmodel>();
    return Scaffold(
        backgroundColor: Color(0xFFFAFAFA),
        appBar: AppBar(
          backgroundColor: Color(0xFFFAFAFA),
          title: Column(
            children: [
              Text(
                "Localização",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
              ),
              Text("Brazil",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w800)),
            ],
          ),
          centerTitle: true,
          leading: Container(
            margin: EdgeInsets.only(left: 10, top: 10),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60), color: Colors.white),
            child: Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(Icons.notifications),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            spacing: 20,
            children: [
              CardWidget(),
              SizedBox(height: 100, child: SnackListWidget()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                spacing: 50,
                children: [
                  Text(
                    "Recomendados para você",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See More",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              ListItensWidget(
                snacks: viewModel.snacks,
                type: "Burgers",
              ),
            ],
          ),
        ),
        bottomNavigationBar:
            BottomNavigationBar(currentIndex: 2, iconSize: 24, items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                color: Colors.grey,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.grey),
              label: "Favorites"),
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt, color: Colors.grey), label: "List"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined, color: Colors.grey),
              label: "Buy"),
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InsertSnackPage()),
                    );
                  },
                  child: Icon(Icons.person, color: Colors.grey)),
              label: "Person"),
        ]));
  }
}

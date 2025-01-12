import 'package:cardapioapp/src/ui/details/widgets/details_page.dart';
import 'package:cardapioapp/src/ui/home/widget/card_widget.dart';
import 'package:cardapioapp/src/ui/home/widget/recomended_list_widget.dart';
import 'package:cardapioapp/src/ui/home/widget/snack_list_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
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
        leading: Icon(
          Icons.search,
        ),
        actions: [
          Icon(Icons.notifications),
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
            GestureDetector(onTap: details, child: RecomendedListWidget())
          ],
        ),
      ),
    );
  }

  details() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DetailsPage()));
  }
}

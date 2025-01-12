import 'package:flutter/material.dart';

class InfoContainerWidget extends StatefulWidget {
  const InfoContainerWidget({super.key});

  @override
  State<InfoContainerWidget> createState() => _InfoContainerWidgetState();
}

class _InfoContainerWidgetState extends State<InfoContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 4,
         
          itemBuilder: (context, index) {
            return Column(
              children: [
                Text("28.1",style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black),),
                Text("kcal",style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.grey),),
              ],
            );
          },
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: RotatedBox(quarterTurns: 45,child: Divider(thickness: 1, color: Colors.grey, height: 10,)),
          ),
              // 
        ),
      ),
    );
  }
}

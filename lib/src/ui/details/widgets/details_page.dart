import 'package:cardapioapp/src/domain/models/snacks_models.dart';
import 'package:cardapioapp/src/ui/details/widgets/info_container_widget.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final SnacksModels snack;
  final String type;
  const DetailsPage({super.key, required this.snack, required this.type});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withValues(alpha: 1),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 50,
            // left: MediaQuery.of(context).size.width * .4,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios),
                  ),
                  Text(
                    "Detalhes",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.gps_fixed)
                ],
              ),
            ),
          ),
          CustomPaint(
            painter: _MyPainter(),
            child: Stack(
              children: [
                Positioned(
                  top: 100,
                  height: 300,
                  child: Image(
                    image: AssetImage(typeSnack(widget.type)),
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height - 420,
                  left: 12,
                  child: Text(
                    widget.snack.name!,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height - 380,
                  left: 8,
                  child: Row(children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.grey,
                    ),
                    Text(
                      "Barras, Piauí",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ]),
                ),
                Positioned(
                    top: MediaQuery.of(context).size.height - 320,
                    width: MediaQuery.of(context).size.width,
                    child: InfoContainerWidget(
                      snack: widget.snack,
                    )),
                Positioned(
                  top: MediaQuery.of(context).size.height - 220,
                  left: 10,
                  child: Text(
                    "Descrição",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height - 180,
                  left: 10,
                  width: MediaQuery.of(context).size.width - 12,
                  child: Text(
                    widget.snack.descricao!,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20.0, left: 10, right: 10),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.shopping_bag_outlined),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                                MediaQuery.of(context).size.width - 80, 60),
                            backgroundColor: Color(0xFFCBFF00),
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              color: Color(0xFF000000),
                            ),
                          ),
                          child: Text("Peça agora"),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
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
}

class _MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFFFAFAFA)
      ..style = PaintingStyle.fill;
    final path = Path()
      ..moveTo(0, 220)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 200)
      ..quadraticBezierTo(size.width, size.height, size.width, size.height * .5)
      ..quadraticBezierTo(
          size.width, size.height * .4, size.width * .4, size.height * .3)
      ..close();
    canvas.clipPath(path);
    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

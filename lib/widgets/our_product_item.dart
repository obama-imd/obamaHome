import "package:flutter/material.dart";

class OurProductItem extends StatelessWidget {
  String title;
  String image;
  OurProductItem({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 444,
      width: 330,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Color.fromARGB(255, 0, 170, 255),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset(
                  'images/prod.jpg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Color.fromARGB(255, 0, 255, 166),
            ),
          ),
        ],
      ),
    );
  }
}

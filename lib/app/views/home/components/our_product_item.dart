import "package:flutter/material.dart";

import '../../../../components/cores_personalizadas.dart';
import '../../../../utils/app_theme.dart';

class OurProductItem extends StatefulWidget {
  const OurProductItem(
      {super.key,
      required this.title,
      required this.image,
      this.width = 237.5,
      this.height = 327.5});

  final double height;
  final double width;
  final String title;
  final String image;

  @override
  State<OurProductItem> createState() => _OurProductItemState();
}

final shadowHouver = [
  BoxShadow(
    color: Colors.black.withOpacity(0.1),
    spreadRadius: 4.0,
    blurRadius: 4.0,
  ),
];
final shadowNoHouver = [
  const BoxShadow(
    color: Colors.transparent,
    spreadRadius: 4.0,
    blurRadius: 4.0,
  ),
];

class _OurProductItemState extends State<OurProductItem> {
  bool houver = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) => setState(() {
        houver = true;
      }),
      onExit: (event) => setState(() {
        houver = false;
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: houver ? shadowHouver : shadowNoHouver,
          border: Border(
            bottom: houver
                ? const BorderSide(
                    color: CoresPersonalizadas.azulObama,
                    width: 5.0,
                  )
                : BorderSide.none,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                alignment: Alignment.center,
                width: widget.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: houver
                      ? const Border(
                          top: BorderSide.none,
                          bottom: BorderSide.none,
                          left: BorderSide.none,
                          right: BorderSide.none,
                        )
                      : Border.all(
                          color: const Color(0xf3f3f3ff),
                          width: 20.0,
                        ),
                ),
                child: Image.network(
                  widget.image,
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Image.asset('assets/images/nopic.jpg', fit: BoxFit.cover);
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Text(widget.title, style: textTheme.headlineSmall),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

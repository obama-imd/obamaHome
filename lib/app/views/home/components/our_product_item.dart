import 'dart:math' as math;
import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/app_theme.dart';
import '../../../../utils/cores_personalizadas.dart';

class OurProductItem extends StatefulWidget {
  const OurProductItem(
      {super.key,
      required this.title,
      this.image,
      this.width = 237.5,
      this.height = 327.5});

  final double height;
  final double width;
  final String title;
  final String? image;

  @override
  State<OurProductItem> createState() => _OurProductItemState();
}

final shadowHouver = [
  BoxShadow(
    color: onPrimary.withOpacity(0.1),
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

  void addObjects(selectedOA, prefs) async {
    await prefs.setStringList('objects', selectedOA);
  }

  @override
  Widget build(BuildContext context) {
    var old_image = Image.network(
      widget.image!,
      fit: BoxFit.cover,
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Image.asset('assets/images/nopic.jpg', fit: BoxFit.cover);
      },
    );
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
          color: background,
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
                    color: background,
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
                  child: buildImage(widget.title)),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: background,
                padding: EdgeInsets.symmetric(horizontal: 13),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(widget.title, style: textTheme.headlineSmall),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: InkWell(
                          onTap: () async {
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            List<String>? items =
                                prefs.getStringList('objects');
                            bool itemExists = items!.contains(widget.title);
                            if (!itemExists) {
                              items.add(widget.title);
                              addObjects(items, prefs);
                              showModalBottomSheet<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 100,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                                '${widget.title} foi adicionado ao seu acervo'),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ElevatedButton(
                                                child: const Text('x'),
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            }
                          },
                          child: Icon(Icons.add_circle,
                              color: CoresPersonalizadas.azulObama)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final Color mycolor =
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  Widget buildImage(String text) {
    return Container(
      color: mycolor,
      constraints: BoxConstraints.expand(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontFamily: 'SRF2', color: Colors.white, fontSize: 28),
          ),
        ),
      ),
    );
  }
}

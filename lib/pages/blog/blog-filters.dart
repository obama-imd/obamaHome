import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:obamahome/pages/blog/blog-details.dart';
import 'package:obamahome/services/api_blog.dart';

@override
Widget blogFilters(
  BuildContext context,
  double swidth,
  List<dynamic> datas,
  bool dataAvailable,
  Function(List<dynamic>) updateData,
) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(bottom: 30),
        child: const Text('SEARCH',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
    Container(
        height: 50,
        width: swidth * 0.25,
        margin: const EdgeInsets.only(bottom: 50),
        child: TextField(
            onSubmitted: (value) async {
              final postsFiltrados = await fetchData(value);
              print(postsFiltrados);
              updateData(postsFiltrados);
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(100)),
                hintText: 'Buscar',
                contentPadding: const EdgeInsets.all(15.0),
                filled: true,
                fillColor: const Color.fromARGB(255, 218, 216, 216),
                suffixIcon: const Icon(Icons.search)))),
    Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(bottom: 20),
        child: const Text('ABOUT AUTHOR',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
    Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(bottom: 100),
        child: const Text('Texto', style: TextStyle(fontSize: 18))),
    Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(bottom: 20),
        child: const Text('RECENT POST',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
    SizedBox(
      height: 80 * datas.length.toDouble(),
      child: ListView.builder(
        itemCount: datas.length,
        itemBuilder: (BuildContext context, int index) {
          final item = datas[index];

          String pubDate = item['published_date'];
          DateTime dateTime = DateTime.parse(pubDate);
          String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          BlogDetails(initialPageIndex: index)));
            },
            child: SizedBox(
                width: swidth * 0.29,
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(children: [
                    SizedBox(
                        width: swidth * 0.29,
                        height: 20,
                        child: Text(item['title'],
                            style: const TextStyle(fontWeight: FontWeight.w600))),
                    Container(
                        width: swidth * 0.29,
                        height: 20,
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(children: [
                          const Icon(FontAwesomeIcons.calendarDays,
                              color: Colors.black, size: 15),
                          Padding(
                            padding: const EdgeInsets.only(left: 2, top: 1.5),
                            child: Text(formattedDate),
                          )
                        ])),
                  ]),
                )),
          );
        },
      ),
    ),
    Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: 70, bottom: 20, right: swidth * 0.07),
        child: const Text('CATEGORIES',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
    Column(children: [
      Container(
          color: const Color.fromARGB(255, 235, 235, 235),
          width: swidth * 0.3,
          height: 40,
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(bottom: 4, right: swidth * 0.015),
          child: TextButton(
              onPressed: () {},
              child: const Row(children: [
                Icon(Icons.arrow_right, color: Colors.black),
                Text('Text 1',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black))
              ]))),
      Container(
          color: const Color.fromARGB(255, 235, 235, 235),
          width: swidth * 0.3,
          height: 40,
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(bottom: 4, right: swidth * 0.015),
          child: TextButton(
              onPressed: () {},
              child: const Row(children: [
                Icon(Icons.arrow_right, color: Colors.black),
                Text('Text 2',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black))
              ]))),
      Container(
          color: const Color.fromARGB(255, 235, 235, 235),
          width: swidth * 0.3,
          height: 40,
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(bottom: 4, right: swidth * 0.015),
          child: TextButton(
              onPressed: () {},
              child: const Row(children: [
                Icon(Icons.arrow_right, color: Colors.black),
                Text('Text 3',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black))
              ]))),
      Container(
          color: const Color.fromARGB(255, 235, 235, 235),
          width: swidth * 0.3,
          height: 40,
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(bottom: 4, right: swidth * 0.015),
          child: TextButton(
              onPressed: () {},
              child: const Row(children: [
                Icon(Icons.arrow_right, color: Colors.black),
                Text('Text 4',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black))
              ]))),
      Container(
          color: const Color.fromARGB(255, 235, 235, 235),
          width: swidth * 0.3,
          height: 40,
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(bottom: 4, right: swidth * 0.015),
          child: TextButton(
              onPressed: () {},
              child: const Row(children: [
                Icon(Icons.arrow_right, color: Colors.black),
                Text('Text 5',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black))
              ]))),
    ]),
    // Container(
    //     alignment: Alignment.centerLeft,
    //     margin: EdgeInsets.only(top: 60, right: swidth * 0.015),
    //     child: const Text('TAG',
    //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
    // Row(children: [
    //   Container(
    //       padding: const EdgeInsets.all(15),
    //       height: 50,
    //       width: 114,
    //       margin: const EdgeInsets.only(right: 5, top: 30, bottom: 60),
    //       decoration: BoxDecoration(
    //           border: Border.all(color: Colors.grey, width: .5),
    //           borderRadius: BorderRadius.circular(100)),
    //       child: TextButton(
    //           onPressed: () {},
    //           child: const Text('Bootstrap',
    //               style: TextStyle(fontSize: 15, color: Colors.black)))),
    //   Container(
    //       padding: const EdgeInsets.all(15),
    //       height: 50,
    //       width: 104,
    //       margin: const EdgeInsets.only(right: 5, top: 30, bottom: 60),
    //       decoration: BoxDecoration(
    //           border: Border.all(color: Colors.grey, width: .5),
    //           borderRadius: BorderRadius.circular(100)),
    //       child: TextButton(
    //           onPressed: () {},
    //           child: const Text('HTML5',
    //               style: TextStyle(fontSize: 15, color: Colors.black)))),
    //   Container(
    //       padding: const EdgeInsets.all(15),
    //       height: 50,
    //       width: 120,
    //       margin: const EdgeInsets.only(top: 30, bottom: 60),
    //       decoration: BoxDecoration(
    //           border: Border.all(color: Colors.grey, width: .5),
    //           borderRadius: BorderRadius.circular(100)),
    //       child: TextButton(
    //           onPressed: () {},
    //           child: const Text('Wordpress',
    //               style: TextStyle(fontSize: 15, color: Colors.black)))),
    // ]),
    // Container(
    //     alignment: Alignment.centerLeft,
    //     margin: EdgeInsets.only(top: 10, bottom: 20, right: swidth * 0.07),
    //     child: const Text('CATEGORIES',
    //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
    // Column(children: [
    //   Container(
    //       color: const Color.fromARGB(255, 235, 235, 235),
    //       width: swidth * 0.3,
    //       height: 40,
    //       alignment: Alignment.centerLeft,
    //       margin: EdgeInsets.only(bottom: 4, right: swidth * 0.015),
    //       child: TextButton(
    //           onPressed: () {},
    //           child: const Row(children: [
    //             Icon(Icons.arrow_right, color: Colors.black),
    //             Text('Text 1',
    //                 style: TextStyle(
    //                     fontSize: 15,
    //                     fontWeight: FontWeight.w500,
    //                     color: Colors.black))
    //           ]))),
    //   Container(
    //       color: const Color.fromARGB(255, 235, 235, 235),
    //       width: swidth * 0.3,
    //       height: 40,
    //       alignment: Alignment.centerLeft,
    //       margin: EdgeInsets.only(bottom: 4, right: swidth * 0.015),
    //       child: TextButton(
    //           onPressed: () {},
    //           child: const Row(children: [
    //             Icon(Icons.arrow_right, color: Colors.black),
    //             Text('Text 2',
    //                 style: TextStyle(
    //                     fontSize: 15,
    //                     fontWeight: FontWeight.w500,
    //                     color: Colors.black))
    //           ]))),
    //   Container(
    //       color: const Color.fromARGB(255, 235, 235, 235),
    //       width: swidth * 0.3,
    //       height: 40,
    //       alignment: Alignment.centerLeft,
    //       margin: EdgeInsets.only(bottom: 4, right: swidth * 0.015),
    //       child: TextButton(
    //           onPressed: () {},
    //           child: const Row(children: [
    //             Icon(Icons.arrow_right, color: Colors.black),
    //             Text('Text 3',
    //                 style: TextStyle(
    //                     fontSize: 15,
    //                     fontWeight: FontWeight.w500,
    //                     color: Colors.black))
    //           ]))),
    //   Container(
    //       color: const Color.fromARGB(255, 235, 235, 235),
    //       width: swidth * 0.3,
    //       height: 40,
    //       alignment: Alignment.centerLeft,
    //       margin: EdgeInsets.only(bottom: 4, right: swidth * 0.015),
    //       child: TextButton(
    //           onPressed: () {},
    //           child: const Row(children: [
    //             Icon(Icons.arrow_right, color: Colors.black),
    //             Text('Text 4',
    //                 style: TextStyle(
    //                     fontSize: 15,
    //                     fontWeight: FontWeight.w500,
    //                     color: Colors.black))
    //           ]))),
    //   Container(
    //       color: const Color.fromARGB(255, 235, 235, 235),
    //       width: swidth * 0.3,
    //       height: 40,
    //       alignment: Alignment.centerLeft,
    //       margin: EdgeInsets.only(bottom: 4, right: swidth * 0.015),
    //       child: TextButton(
    //           onPressed: () {},
    //           child: const Row(children: [
    //             Icon(Icons.arrow_right, color: Colors.black),
    //             Text('Text 5',
    //                 style: TextStyle(
    //                     fontSize: 15,
    //                     fontWeight: FontWeight.w500,
    //                     color: Colors.black))
    //           ])))
    // ])
  ]);
}

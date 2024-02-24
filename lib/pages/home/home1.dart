import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:obamahome/pages/home/home_desktop.dart';
import 'package:obamahome/pages/home/home_tablet.dart';
import 'package:obamahome/pages/home/responsivo.dart';
import 'package:obamahome/pages/mobile_pages/home_mobile1.dart';

import '../../services/api_blog.dart';

Widget blogData(BuildContext context, index, datas) {
  double imageWidth = MediaQuery.of(context).size.width * .3;
  double imageHeight = 185;

  final item = datas[index];

  String extractImagePath(String content) {
    final document = parse(content);
    final imgElement = document.getElementsByTagName('img').last;
    final result = imgElement.attributes['src'];
    return result!;
  }

  String imagePath = extractImagePath(item['content']);

  String pubDate = item['published_date'];
  DateTime dateTime = DateTime.parse(pubDate);
  String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);

  // String sumValue = extractSummaryPath(item['summary']);
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(imagePath,
            height: imageHeight, width: imageWidth, fit: BoxFit.cover),
        // Text(imagePath),
        Row(
          children: [
            const Icon(Icons.access_time, size: 16),
            Text(formattedDate, style: const TextStyle(fontSize: 14)),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Text(item['title'],
              style: Theme.of(context).textTheme.titleSmall!),
        ),
        Text(item['text'],
            style: Theme.of(context).textTheme.displaySmall!, maxLines: 4),
        // Text(sumValue),
      ],
    ),
  );
}

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  final TrackingScrollController _scrollController = TrackingScrollController();

  List<dynamic> datas = [];
  bool dataAvailable = true;

  Future<void> fetchDataAndUpdateState() async {
    final fetchedData = await fetchData('');
    setState(() {
      if (fetchedData.isNotEmpty) {
        dataAvailable = false;
        datas = fetchedData.sublist(0, 3);
      } else {
        dataAvailable = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetchDataAndUpdateState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Responsivo(
              mobile: HomeMobile1(),
              //mobile: HomeMobile( scrollController: _scrollController,),
              tablet: HomeTablet(
                scrollController: _scrollController,
                dataAvailable: dataAvailable,
                datas: datas,
              ),
              desktop: HomeDesktop(
                scrollController: _scrollController,
                dataAvailable: dataAvailable,
                datas: datas,
              )),
        ));
  }
}

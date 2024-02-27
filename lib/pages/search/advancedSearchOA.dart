import 'package:flutter/material.dart';

import '../../services/api_OA.dart';

const List<String> nivelEnsino = <String>['Todos'];
const List<String> temaCurricular = <String>['Todos'];
const List<String> tipo = <String>['Todos'];
const List<String> descritor = <String>['Todos'];

@override
Widget OAFilters(
  BuildContext context,
  double swidth,
  List<dynamic> datas,
  bool dataAvailable,
  Function(List<dynamic>) updateData,
) {
  return SizedBox(
    width: swidth * .2,
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(bottom: 30),
          child: const Text('BUSCA',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
      Container(
          height: 50,
          width: swidth * 0.25,
          margin: const EdgeInsets.only(bottom: 50),
          child: TextField(
              onSubmitted: (value) async {
                final postsFiltrados = await fetchData(value);
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
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Row(
              children: [
                Row(
                  children: [
                    Checkbox(
                      tristate: true,
                      value: false,
                      onChanged: (bool? value) {
                        // setState(() {
                        //   isChecked = value;
                        // });
                      },
                    ),
                    Text("PCN")
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Checkbox(
                        tristate: true,
                        value: false,
                        onChanged: (bool? value) {
                          // setState(() {
                          //   isChecked = value;
                          // });
                        },
                      ),
                      Text("BNCC")
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(bottom: 20),
              child: const Text('Selecione o nível de ensino',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
          Container(
              height: 40,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 4),
              child: DropdownButton<String>(
                  value: nivelEnsino.first,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 5,
                  style: const TextStyle(color: Colors.deepPurple),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    // setState(() {
                    //   dropdownValue = value!;
                    // });
                  },
                  items:
                      nivelEnsino.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Container(width: swidth * .18, child: Text(value)),
                    );
                  }).toList())),
          Container(
              alignment: Alignment.centerLeft,
              margin:
                  EdgeInsets.only(top: 50, bottom: 20, right: swidth * 0.07),
              child: const Text('Selecione o tema curricular',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
          Container(
              height: 40,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 4),
              child: DropdownButton<String>(
                  value: temaCurricular.first,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 5,
                  style: const TextStyle(color: Colors.deepPurple),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    // setState(() {
                    //   dropdownValue = value!;
                    // });
                  },
                  items: temaCurricular
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Container(width: swidth * .18, child: Text(value)),
                    );
                  }).toList())),
          Container(
              alignment: Alignment.centerLeft,
              margin:
                  EdgeInsets.only(top: 50, bottom: 20, right: swidth * 0.07),
              child: const Text('Selecione o tipo',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
          Container(
              height: 40,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 4),
              child: DropdownButton<String>(
                  value: tipo.first,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 5,
                  style: const TextStyle(color: Colors.deepPurple),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    // setState(() {
                    //   dropdownValue = value!;
                    // });
                  },
                  items: tipo.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Container(width: swidth * .18, child: Text(value)),
                    );
                  }).toList())),
          Container(
              alignment: Alignment.centerLeft,
              margin:
                  EdgeInsets.only(top: 50, bottom: 20, right: swidth * 0.07),
              child: const Text('Selecione o descritor',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
          Container(
              height: 40,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 4),
              child: DropdownButton<String>(
                  value: descritor.first,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 5,
                  style: const TextStyle(color: Colors.deepPurple),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    // setState(() {
                    //   dropdownValue = value!;
                    // });
                  },
                  items:
                      descritor.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Container(width: swidth * .18, child: Text(value)),
                    );
                  }).toList())),
        ],
      ),
    ]),
  );
}

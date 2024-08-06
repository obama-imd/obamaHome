import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../utils/app_theme.dart';
import '../../lesson_plan_new.dart';

class PageViewFirst extends ConsumerStatefulWidget {
  const PageViewFirst({super.key});

  @override
  _PageViewFirstState createState() => _PageViewFirstState();
}

final firstStepData = StateProvider<List<String>>((ref) {
  return ["", "", "", ""];
});

void saveFirstStepData(ref, arrayData) {
  final List<String> sendData = ref.read(firstStepData);
  sendData.clear();
  sendData.addAll(arrayData);
}

class _PageViewFirstState extends ConsumerState<PageViewFirst> {
  List<String> arrayData = ["", "", "", ""];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        constraints: BoxConstraints(maxWidth: 1200),
        child: Column(children: [
          for (var i = 0; i < pageHints.length; i++) ...{
            if (i == 2) ...{
              Container(
                  height: 40,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(bottom: 4),
                  child: DropdownButton<String>(
                      value: options.first,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 5,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      style: textTheme.bodySmall,
                      onChanged: (String? value) {
                        arrayData[i] = value!;
                        print(arrayData);
                        setState(() {
                          // learningLevel = value!;
                        });
                      },
                      items:
                          options.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Container(child: Text(value)),
                        );
                      }).toList())),
            } else ...{
              Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: TextField(
                      onChanged: (value) async {
                        arrayData[i] = value!;
                        print(arrayData);
                      },
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1)),
                        hintText: pageHints[i],
                        hintStyle: textTheme.bodySmall,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 15),
                        filled: true,
                        // fillColor: Colors.grey.shade100
                      ))),
            }
          },
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 50,
                width: 170,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                child: TextButton(
                    onPressed: () {
                      saveFirstStepData(ref, arrayData);
                    },
                    child: Text(
                      "Enviar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        shadows: [
                          Shadow(
                            offset: Offset(1, 1),
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                          )
                        ],
                      ),
                    )),
              ),
            ],
          )
        ]));
  }
}

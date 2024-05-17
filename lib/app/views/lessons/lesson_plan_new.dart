import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:obamahome/components/navMenu.dart';
import 'package:obamahome/components/topbar.dart';
import 'package:obamahome/utils/cores_personalizadas.dart';

// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;

import '../../../utils/app_theme.dart';
import '../../controllers/search_controller.dart';
import '../../models/search_models.dart';
import 'components/initialText.dart';
import 'components/textEditorClass.dart';

class NewLessonPlan extends StatefulWidget {
  const NewLessonPlan({super.key});

  @override
  State<NewLessonPlan> createState() => _NewLessonPlanState();
}

class _NewLessonPlanState extends State<NewLessonPlan> {
  late PageController _pageViewController;
  // late TabController _tabController;
  int _currentPageIndex = 0;
  int stepSelected = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    // _initController(_controller);
    // print(_controller.document.toDelta().toHtml());
  }

  void _updateCurrentPageIndex(int index) {
    // _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    // _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double logoWidth = 250;

    if (swidth < 700) {
      logoWidth = 180;
    }

    List<Widget> paveViewContent = [
      PageViewFirst(),
      PageViewSecond(),
      PageViewThird(),
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          TopBar(swidth),
          Container(
            margin: EdgeInsets.symmetric(horizontal: swidth * .1),
            padding: const EdgeInsets.only(top: 35, bottom: 15),
            constraints: BoxConstraints(maxWidth: 1200),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/logo.png", width: logoWidth),
                  NavMenu(
                    swidth: swidth,
                    heightBtn: 50,
                    itemValues: editorValues,
                    searchAvailable: false,
                  )
                ]),
          ),
          Container(
            width: swidth,
            padding: EdgeInsets.only(top: 15),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              for (var i = 0; i < 3; i++) ...{
                Material(
                  child: InkWell(
                    child: Container(
                      width: swidth > 1200 ? 1200 * .33 : swidth * .33,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 2,
                                  color: stepSelected == i
                                      ? CoresPersonalizadas.azulObama
                                      : onPrimary))),
                      // padding: EdgeInsets.only(bottom: 10),
                      child: Center(
                          child: Text("Passo ${i + 1}",
                              style: TextStyle(
                                  fontWeight: stepSelected == i
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: stepSelected == i
                                      ? CoresPersonalizadas.azulObama
                                      : onPrimary))),
                    ),
                    onTap: () {
                      setState(() {
                        stepSelected = i;
                      });
                      if (_pageViewController.hasClients) {
                        _pageViewController.animateToPage(
                          i,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                )
              }
            ]),
          ),
          Container(
            width: swidth,
            height: 1500,
            padding: EdgeInsets.only(top: 25),
            child: PageView.builder(
              controller: _pageViewController,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                // for (var i = 1; i<=3; i++) {
                return Material(
                    child: Column(children: [paveViewContent[index]]));
                // }
              },
            ),
          ),
        ],
      ),
    );
  }
}

// String _initController(QuillController controller) {
//   return initText(controller);
// }

List<String> pageHints = [
  'Qual o nome da instituição a que se destina esse plano de aula?*',
  'Escreva uma frase curta que defina sua aula.*',
  'A qual ano de ensino esta proposta de aula melhor se aplica?*',
  'Quanto tempo (em minutos) você acha necessário para a aplicação deste plano de aula?*'
];
List<String> options = <String>['Todos'];

class PageViewFirst extends StatefulWidget {
  const PageViewFirst({super.key});

  @override
  State<PageViewFirst> createState() => _PageViewFirstState();
}

class _PageViewFirstState extends State<PageViewFirst> {
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
                      style: textTheme.bodySmall,
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        // setState(() {
                        //   dropdownValue = value!;
                        // });
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
                      onSubmitted: (value) async {
                        // updateData(value);
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
                          )
                          )),
            }
          },
        ]));
  }
}

class PageViewThird extends ConsumerStatefulWidget {
  const PageViewThird({super.key});

  @override
  _PageViewThirdState createState() => _PageViewThirdState();
}

class _PageViewThirdState extends ConsumerState<PageViewThird> {
  List<SearchModel?> searchData = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    SearchResponse fetchedData = await fetchDataAndUpdateState("", ref);
    SearchResponse pagination = fetchedData;
    List<SearchModel?> newPagination = pagination.content;
    setState(() {
      searchData = newPagination;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: background,
      ),
      constraints: BoxConstraints(maxWidth: 1200, maxHeight: 600),
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Column(children: [
        Text("Escolha os OAs"),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Divider(color: Colors.black38),
        ),
        for (var i = 0; i < searchData.length; i++) ...{
          // print(search?.nome);
          Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 25),
              color: i % 2 == 0 ? Colors.white : Colors.black12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(searchData[i]!.nome),
                  Row(
                    children: [
                      InkWell(
                          onTap: () {},
                          child: Icon(Icons.add_circle,
                              color: CoresPersonalizadas.azulObama)),
                      InkWell(
                          onTap: () {},
                          child: Icon(Icons.remove_circle,
                              color: CoresPersonalizadas.azulObama)),
                    ],
                  ),
                ],
              )),
        }
      ]),
    );
  }
}

class PageViewSecond extends ConsumerStatefulWidget {
  const PageViewSecond({super.key});

  @override
  _PageViewSecondState createState() => _PageViewSecondState();
}

class _PageViewSecondState extends ConsumerState<PageViewSecond> {
  QuillController _controller = QuillController.basic();
  String imageUrl = "";
  List<SearchModel?> searchData = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    SearchResponse fetchedData = await fetchDataAndUpdateState("", ref);
    SearchResponse pagination = fetchedData;
    List<SearchModel?> newPagination = pagination.content;
    setState(() {
      searchData = newPagination;
    });
  }

  void _pickImageURL() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              child: Container(
            constraints: BoxConstraints(maxWidth: 450, maxHeight: 400),
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Cole abaixo o link da sua imagem"),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(color: Colors.black38),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: secondary),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 20),
                            hintText: "Link da imagem",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: secondary,
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: secondary))),
                        onChanged: (value) => setState(() {
                              imageUrl = value;
                            }),
                        onSubmitted: (value) {
                          setState(() {
                            imageUrl = value;
                          });
                        }),
                  ),
                  SizedBox(height: 15),
                  TextButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(Size(250, 50))),
                      child: Text("Enviar url", style: textTheme.displaySmall),
                      onPressed: () {
                        setState(() {
                          imageUrl = imageUrl;
                        });
                        Navigator.of(context).pop();
                        sendImageURL();
                      }),
                ]),
          ));
        });
  }

  void sendImageURL() {
    _controller.insertImageBlock(
      imageSource: imageUrl,
    );
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final String imagePath = pickedImage.path;
      final File file = File(imagePath);

      if (kIsWeb) {
        _controller.insertImageBlock(
          imageSource: imagePath,
        );
      } else {
        _controller.insertImageBlock(
          imageSource: file.path.toString(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          //Barra de edição
          margin: EdgeInsets.symmetric(horizontal: swidth * .1),
          child: QuillToolbar.simple(
            configurations: QuillSimpleToolbarConfigurations(
              showAlignmentButtons: true,
              showHeaderStyle: false,
              showIndent: false,
              showListCheck: false,
              showQuote: false,
              showInlineCode: false,
              showCodeBlock: false,
              controller: _controller,
              sharedConfigurations: QuillSharedConfigurations(
                locale: Locale('pt', 'BR'),
              ),
              customButtons: [
                QuillToolbarCustomButtonOptions(
                  tooltip: "Inserir imagem",
                  icon: const Icon(Icons.image),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                              child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: background,
                            ),
                            constraints:
                                BoxConstraints(maxWidth: 450, maxHeight: 400),
                            padding: const EdgeInsets.symmetric(vertical: 25),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      "Insira imagens do seu dispositivo ou da internet"),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Divider(color: Colors.black38),
                                  ),
                                  TextButton(
                                    style: ButtonStyle(
                                        fixedSize: MaterialStatePropertyAll(
                                            Size(250, 50))),
                                    child: Text("Inserir imagem da sua galeria",
                                        style: textTheme.displaySmall),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      _pickImage();
                                    },
                                  ),
                                  SizedBox(height: 15),
                                  TextButton(
                                    style: ButtonStyle(
                                        fixedSize: MaterialStatePropertyAll(
                                            Size(250, 50))),
                                    child: Text("Inserir link da internet",
                                        style: textTheme.displaySmall),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      _pickImageURL();
                                    },
                                  )
                                ]),
                          ));
                        });
                  },
                ),
                QuillToolbarCustomButtonOptions(
                  tooltip: "Adicionar Objetos de Aprendizagem",
                  icon: Icon(Icons.gamepad),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: background,
                              ),
                              constraints:
                                  BoxConstraints(maxWidth: 900, maxHeight: 600),
                              padding: const EdgeInsets.symmetric(vertical: 25),
                              child: Column(children: [
                                Text("Escolha os OAs"),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Divider(color: Colors.black38),
                                ),
                                for (var i = 0; i < searchData.length; i++) ...{
                                  // print(search?.nome);
                                  Container(
                                      height: 40,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 25),
                                      color: i % 2 == 0
                                          ? Colors.white
                                          : Colors.black12,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(searchData[i]!.nome),
                                          Row(
                                            children: [
                                              InkWell(
                                                  onTap: () {},
                                                  child: Icon(Icons.add_circle,
                                                      color: CoresPersonalizadas
                                                          .azulObama)),
                                              InkWell(
                                                  onTap: () {},
                                                  child: Icon(
                                                      Icons.remove_circle,
                                                      color: CoresPersonalizadas
                                                          .azulObama)),
                                            ],
                                          ),
                                        ],
                                      )),
                                }
                              ]),
                            ),
                          );
                        });
                  },
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 30),
          child: Divider(thickness: 1, color: secondary),
        ),
        Container(
          //Folha do texto
          margin: EdgeInsets.only(bottom: 30),
          padding: EdgeInsets.symmetric(vertical: 72, horizontal: 91),
          decoration: BoxDecoration(color: background, boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 0.8,
              blurRadius: 5.0,
              offset: Offset(0.0, 3.0),
            ),
          ]),
          constraints: BoxConstraints(maxWidth: 900),
          child: Expanded(
            child: QuillEditor.basic(
              scrollController: ScrollController(),
              configurations: QuillEditorConfigurations(
                controller: _controller,
                placeholder: initText(_controller),
                customStyles: DefaultStyles(
                  paragraph: DefaultTextBlockStyle(
                      TextStyle(color: onPrimary, fontSize: 14),
                      VerticalSpacing(0, 0),
                      VerticalSpacing(0, 0),
                      BoxDecoration()),
                ),
                minHeight: 1200,
                sharedConfigurations: QuillSharedConfigurations(
                  locale: Locale('pt', 'BR'),
                ),
                embedBuilders: kIsWeb
                    ? FlutterQuillEmbeds.editorWebBuilders()
                    : FlutterQuillEmbeds.editorBuilders(),
              ),
            ),
          ),
        )
      ],
    );
  }
}

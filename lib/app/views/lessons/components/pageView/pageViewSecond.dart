import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../utils/app_theme.dart';
import '../../../../../utils/cores_personalizadas.dart';
import '../../../../controllers/search_controller.dart';
import '../../../../models/search_models.dart';
import '../initialText.dart';
import 'pageViewFirst.dart';

class PageViewSecond extends ConsumerStatefulWidget {
  const PageViewSecond({super.key});

  @override
  _PageViewSecondState createState() => _PageViewSecondState();
}

class _PageViewSecondState extends ConsumerState<PageViewSecond> {
  QuillController _controller = QuillController.basic();
  final ScrollController controllerOne = ScrollController();
  String imageUrl = "";
  List<SearchModel?> searchData = [];
  List<String> selectedOA = [];
  List<String> firstStep = [];
  bool addedOrRemovedOA = false;
  String textValue = "";
  List<String>? cachedObjects = [];

  // void _initController(
  //     QuillController controller, List<String>? cachedObjects) {
  //   initText(controller, cachedObjects);
  // }

  @override
  void initState() {
    getObjects();
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

  void getObjects() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? items = prefs.getStringList('objects');
    setState(() {
      selectedOA = items!;
      cachedObjects = items;
    });
    // listOAText(_controller);
  }

  void addObjects() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('objects', selectedOA);
    getObjects();
  }

  void hideMessage() {
    Future.delayed(Duration(seconds: 3)).whenComplete(() {
      setState(() {
        textValue = "";
        addedOrRemovedOA = false;
      });
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
    final dataList = ref.watch(firstStepData);
    // firstStep = blogDataList;
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          //Barra de edição
          margin: EdgeInsets.symmetric(horizontal: swidth * .1),
          padding: EdgeInsets.only(top: 15),
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
              fontSizesValues: const {
                '10': '10',
                '12': '12',
                '14': '14',
                '16': '16'
              },
              sharedConfigurations:
                  QuillSharedConfigurations(locale: Locale('pt', 'BR')),
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
                    getData();
                    showDialog(
                        context: context,
                        builder: (context) =>
                            StatefulBuilder(builder: (context, setState) {
                              return Dialog(
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: background,
                                    ),
                                    constraints: BoxConstraints(
                                        maxWidth: 900, maxHeight: 600),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 25),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: background,
                                      ),
                                      constraints: BoxConstraints(
                                          maxWidth: 1200, maxHeight: 600),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 25),
                                      child: Wrap(
                                        children: [
                                          Container(
                                            width: swidth > 900
                                                ? 900 * .7
                                                : swidth * .7,
                                            child: Column(children: [
                                              Text("Escolha os OA"),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Divider(
                                                    color: Colors.black38),
                                              ),
                                              for (var i = 0;
                                                  i < searchData.length;
                                                  i++) ...{
                                                // print(search?.nome);
                                                Container(
                                                    height: 40,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 25),
                                                    color: i % 2 == 0
                                                        ? Colors.white
                                                        : Colors.black12,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(searchData[i]!
                                                            .nome),
                                                        Row(
                                                          children: [
                                                            InkWell(
                                                                onTap: () {
                                                                  bool
                                                                      itemExists =
                                                                      selectedOA
                                                                          .contains(
                                                                              searchData[i]!.nome);
                                                                  if (!itemExists) {
                                                                    selectedOA.add(
                                                                        searchData[i]!
                                                                            .nome);
                                                                    addObjects();
                                                                  }
                                                                  getObjects();
                                                                },
                                                                child: Icon(
                                                                    Icons
                                                                        .add_circle,
                                                                    color: CoresPersonalizadas
                                                                        .azulObama)),
                                                            InkWell(
                                                                onTap: () {
                                                                  selectedOA.remove(
                                                                      searchData[
                                                                              i]!
                                                                          .nome);
                                                                  addObjects();
                                                                  getObjects();
                                                                },
                                                                child: Icon(
                                                                    Icons
                                                                        .remove_circle,
                                                                    color: CoresPersonalizadas
                                                                        .azulObama)),
                                                          ],
                                                        ),
                                                      ],
                                                    )),
                                              }
                                            ]),
                                          ),
                                          Container(
                                            width: swidth > 900
                                                ? 900 * .3
                                                : swidth * .3,
                                            child: Column(children: [
                                              Stack(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text("OA selecionados"),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        cachedObjects == null ||
                                                                cachedObjects!
                                                                    .isEmpty
                                                            ? SizedBox()
                                                            : Tooltip(
                                                                message:
                                                                    "Remover tudo",
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    final SharedPreferences
                                                                        prefs =
                                                                        await SharedPreferences
                                                                            .getInstance();
                                                                    await prefs
                                                                        .remove(
                                                                            'objects');
                                                                    setState(
                                                                        () {
                                                                      selectedOA =
                                                                          [];
                                                                      cachedObjects =
                                                                          [];
                                                                    });
                                                                    getObjects();
                                                                  },
                                                                  child:
                                                                      SizedBox(
                                                                    width: 20,
                                                                    height: 20,
                                                                    child: Center(
                                                                        child: Icon(
                                                                            Icons
                                                                                .clear,
                                                                            size:
                                                                                18,
                                                                            color:
                                                                                onError)),
                                                                  ),
                                                                )),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Divider(
                                                    color: Colors.black38),
                                              ),
                                              if (cachedObjects == null ||
                                                  cachedObjects!.isEmpty) ...{
                                                Text(
                                                    "Sua lista de OA está vazia")
                                              } else ...{
                                                for (var cacheObject
                                                    in cachedObjects!) ...{
                                                  Text(cacheObject)
                                                }
                                              }
                                            ]),
                                          )
                                        ],
                                      ),
                                    )),
                              );
                            }));
                  },
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Divider(thickness: 1, color: secondary),
        ),
        Container(
          height: MediaQuery.of(context).size.height - 125,
          padding: const EdgeInsets.only(top: 20),
          // color: Colors.grey.withOpacity(0.1),
          width: 1100,
          child: Expanded(
            child: Scrollbar(
              controller: controllerOne,
              thumbVisibility: true,
              trackVisibility: true,
              thickness: 8,
              child: SingleChildScrollView(
                controller: controllerOne,
                child: Column(
                  children: [
                    Container(
                      // Folha do texto
                      // margin: EdgeInsets.only(bottom: 50),
                      padding:
                          EdgeInsets.symmetric(vertical: 72, horizontal: 91),
                      decoration: BoxDecoration(color: background, boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 0.8,
                          blurRadius: 5.0,
                          offset: Offset(0.0, 3.0),
                        ),
                      ]),
                      constraints: BoxConstraints(maxWidth: 900),
                      child: QuillEditor.basic(
                        scrollController: ScrollController(),
                        configurations: QuillEditorConfigurations(
                          controller: _controller,
                          placeholder:
                              initText(_controller, cachedObjects, dataList),
                          customStyles: DefaultStyles(
                            paragraph: DefaultTextBlockStyle(
                                TextStyle(color: onPrimary, fontSize: 14),
                                VerticalSpacing(0, 0),
                                VerticalSpacing(0, 0),
                                BoxDecoration()),
                          ),
                          sharedConfigurations: QuillSharedConfigurations(
                            locale: Locale('pt', 'BR'),
                          ),
                          embedBuilders: kIsWeb
                              ? FlutterQuillEmbeds.editorWebBuilders()
                              : FlutterQuillEmbeds.editorBuilders(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

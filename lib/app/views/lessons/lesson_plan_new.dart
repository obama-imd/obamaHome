import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:obamahome/components/topbar.dart';
import 'package:quill_html_converter/quill_html_converter.dart';

// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;

import '../../../utils/app_theme.dart';
import 'components/initialText.dart';

class NewLessonPlan extends StatefulWidget {
  const NewLessonPlan({super.key});

  @override
  State<NewLessonPlan> createState() => _NewLessonPlanState();
}

class _NewLessonPlanState extends State<NewLessonPlan> {
  QuillController _controller = QuillController.basic();

  String imageUrl = "";

  @override
  void initState() {
    super.initState();
    _initController(_controller);
  }

  // Future<void> savePDF() async {
  //   var archive = _controller.document;
  //   var deltaToPDF = await _controller.document.toDelta().toPdf();
  //   var pdfHeight = archive.length.toDouble();

  //   if (pdfHeight > 1200) {
  //     archive.queryChild(0);
  //   }

  // }

  void _pickImageURL() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Text("Cole abaixo o link da sua imagem"),
                ),
                TextField(
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
              ]));
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
      print(" imagePath => $imagePath");

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
    double logoWidth = 250;

    if (swidth < 700) {
      logoWidth = 180;
    }
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
                  Material(
                    child: TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Row(
                          children: [
                            Icon(Icons.arrow_back, size: 16),
                            if (swidth > 800) ...{Text("Voltar")}
                          ],
                        )),
                  ),
                  Image.asset("assets/images/logo.png", width: logoWidth),
                  TextButton(
                      onPressed: () async {
                        // savePDF();
                        var doc = _controller.document
                            .toDelta()
                            .toHtml(); //salvar como html
                        // print("archive => ${doc}");
                      },
                      child: Row(
                        children: [
                          if (swidth > 800) ...{
                            Text("Salvar como PDF")
                          } else ...{
                            Icon(Icons.save_as, size: 16),
                            SizedBox(width: 3),
                            Text("PDF")
                          }
                        ],
                      ))
                ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Divider(thickness: 1, color: secondary),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: swidth * .1),
            child: QuillToolbar.simple(
              configurations: QuillSimpleToolbarConfigurations(
                showAlignmentButtons: true,
                showHeaderStyle: false,
                showIndent: false,
                showListCheck: false,
                // embedButtons: FlutterQuillEmbeds.toolbarButtons(),
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
                            return AlertDialog(
                                content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 20),
                                    child: Text(
                                        "Insira imagens do seu dispositivo ou da internet"),
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
                                ]));
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
            margin: EdgeInsets.only(bottom: 80),
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
            child: AspectRatio(
              aspectRatio: 3 / 4,
              child: Expanded(
                child: QuillEditor.basic(
                  scrollController: ScrollController(),
                  configurations: QuillEditorConfigurations(
                    controller: _controller,
                    maxHeight: 1200,
                    embedBuilders: kIsWeb
                        ? FlutterQuillEmbeds.editorWebBuilders()
                        : FlutterQuillEmbeds.editorBuilders(),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

void _initController(QuillController controller) {
  initText(controller);
}

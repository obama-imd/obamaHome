import 'dart:io';

import 'package:delta_to_pdf/delta_to_pdf.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf/pdf.dart' as p;
import 'package:pdf/widgets.dart' as pw;

import '../../../utils/app_theme.dart';
import 'components/save_file_mobile.dart'
    if (dart.library.html) 'components/save_file_web.dart';

class NewLessonPlan extends StatefulWidget {
  const NewLessonPlan({super.key});

  @override
  State<NewLessonPlan> createState() => _NewLessonPlanState();
}

class _NewLessonPlanState extends State<NewLessonPlan> {
  QuillController _controller = QuillController.basic();

  Future<void> saveAsPDF() async {
    final pdf = pw.Document();
    pdf.addPage(pw.Page(
        pageFormat: p.PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(35),
        build: (pw.Context context) {
          var delta = _controller.document.toDelta().toList();
          DeltaToPDF dpdf = DeltaToPDF();
          return dpdf.deltaToPDF(delta);
        }));

    var savedFile = await pdf.save();
    List<int> fileInts = List.from(savedFile);

    await saveAndLaunchFile(fileInts, 'plano_aula.pdf');
  }

  void composeImage(imageDelta) {
    _controller.compose(
      imageDelta,
      TextSelection.collapsed(offset: imageDelta.length),
      ChangeSource.local,
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
        final Delta imageDelta = Delta()
          ..insert("\n")
          ..insert({
            'image': imagePath,
          })
          ..insert("\n");
        composeImage(imageDelta);
      } else {
        final Delta imageDelta = Delta()
          ..insert("\n")
          ..insert({
            'image': file.path.toString(),
          })
          ..insert("\n");
        composeImage(imageDelta);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    return QuillProvider(
      configurations: QuillConfigurations(
        controller: _controller,
        sharedConfigurations: const QuillSharedConfigurations(
          locale: Locale('pt', 'BR'),
        ),
      ),
      child: Column(
        children: [
          Row(children: [
            IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.arrow_back)),
            TextButton(
                onPressed: () {
                  saveAsPDF();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Salvar como PDF", style: textTheme.displaySmall),
                ))
          ]),
          QuillToolbar(
            configurations: QuillToolbarConfigurations(
                embedButtons: FlutterQuillEmbeds.toolbarButtons(),
                customButtons: [
                  QuillToolbarCustomButtonOptions(
                    controller: _controller,
                    icon: const Icon(Icons.image),
                    onPressed: _pickImage,
                  ),
                ]),
          ),
          Expanded(
            child: QuillEditor.basic(
              configurations: QuillEditorConfigurations(
                readOnly: false,
                embedBuilders: kIsWeb
                    ? FlutterQuillEmbeds.editorWebBuilders()
                    : FlutterQuillEmbeds.editorBuilders(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

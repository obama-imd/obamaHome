import 'package:html/parser.dart';
import 'package:intl/intl.dart';

class BlogModel {
  String title;
  String text;
  String summary;
  String publishedDate;
  String imagePath;

  BlogModel? posts;

  BlogModel({
    required this.title,
    required this.text,
    required this.summary,
    required this.publishedDate,
    required this.imagePath,
  });
}

String extractImagePath(String content) {
  final document = parse(content);
  final imgElement = document.getElementsByTagName('img').last;
  final result = imgElement.attributes['src'];
  return result!;
}

String extractSummaryPath(String summary) {
  final document = parse(summary);
  final sumElement = document.getElementsByTagName('p').last;
  final sumValue = sumElement.text;
  return sumValue;
}

String convertDate(String date) {
  DateTime dateTime = DateTime.parse(date);
  String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
  return formattedDate;
}

// class BlogViewModel extends ConsumerState {
//   // List<BlogModel?> newPosts = [];

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var _posts = BlogController().updateBlogContent(ref);
//     return _posts;
//   }
// }
// final teste = Provider<String>((ref) => "ola");

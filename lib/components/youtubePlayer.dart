import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fwfh_webview/fwfh_webview.dart'; 
 
class CustomVideo extends StatelessWidget { 
  final String urlVideo;

  CustomVideo({Key? key, required this.urlVideo}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    String content =
        '<iframe src="https://www.youtube.com/embed/$urlVideo"></iframe>';

    return SizedBox(
      child: HtmlWidget(
        content,
        factoryBuilder: () => _YoutubeIframeWidgetFactory(),
      ),
    );
  }
}
 
class _YoutubeIframeWidgetFactory extends WidgetFactory with WebViewFactory {
  @override
  bool get webViewMediaPlaybackAlwaysAllow => true;
  @override
  String? get webViewUserAgent => 'Lang Learning';
}
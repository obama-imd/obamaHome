import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class CustomVideo extends StatelessWidget {
  final String urlVideo;

  CustomVideo({Key? key, required this.urlVideo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = YoutubePlayerController.fromVideoId(
      videoId: urlVideo,
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );
    return YoutubePlayerScaffold(
      controller: _controller,
      aspectRatio: 16 / 9,
      builder: (context, player) {
        return Column(
          children: [
            player,
          ],
        );
      },
    );
  }
}

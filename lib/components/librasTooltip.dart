import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obamahome/utils/app_theme.dart';

import 'librasButton.dart';

class LibrasTooltip extends ConsumerStatefulWidget {
  Widget content;
  LibrasTooltip({super.key, required this.content});

  @override
  _LibrasTooltipState createState() => _LibrasTooltipState();
}

class _LibrasTooltipState extends ConsumerState<LibrasTooltip> {
  @override
  Widget build(BuildContext context) {
    bool isActive = ref.watch(librasMode);

    if (isActive) {
      return Tooltip(
        decoration: BoxDecoration(color: background),
        richMessage: WidgetSpan(
          child: Container(
            color: background,
            child: Text("Em breve")
            // Image.network(
            //     'https://th.bing.com/th/id/R.271c94354b33351d0ba70b4141279cba?rik=QMkddJRh815iEw&riu=http%3a%2f224.media.tumblr.com%2ftumblr_m0kxkrtQfJ1rrnvqio1_500.gif&ehk=JJa9MQXGTx4ZUw47A4KUrftSaCyLL%2bPBuXVmaBfR%2bv0%3A&risl=&pid=ImgRaw&r=0'),
          ),
        ),
        child: widget.content,
      );
    } else {
      return SizedBox(child: widget.content);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obamahome/utils/app_theme.dart';

import 'librasButton.dart';

class LibrasTooltip extends ConsumerStatefulWidget {
  Widget content;
  List<String> imageGif;
  bool isHover;
  List<bool>? isHoverSubItems;
  LibrasTooltip(
      {super.key,
      required this.content,
      required this.imageGif,
      required this.isHover,
      required this.isHoverSubItems});

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
              child: Column(
                children: [
                  if (widget.isHover) ...{
                    // if (widget.imageGif.length > 1) ...{
                    //   for (var i = 0; i < widget.imageGif.length; i++) ...{
                    //     if (widget.isHoverSubItems![i]) ...{
                    //       Image.asset(widget.imageGif[i]),
                    //     }
                    //   }
                    // } else ...{
                      Image.asset(widget.imageGif[0]),
                    // }
                  }
                ],
              )),
        ),
        child: widget.content,
      );
    } else {
      return SizedBox(child: widget.content);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obamahome/utils/app_theme.dart';

import 'librasButton.dart';

class LibrasTooltip extends ConsumerStatefulWidget {
  final Widget content;
  final List<String> imageGif; // pode conter um ou mais gifs
  final List<String>? subItemsImageGif;
  final bool isHover;
  final List<bool>? isHoverSubItems;

  const LibrasTooltip({
    super.key,
    required this.content,
    required this.imageGif,
    required this.subItemsImageGif,
    required this.isHover,
    required this.isHoverSubItems,
  });

  @override
  _LibrasTooltipState createState() => _LibrasTooltipState();
}

class _LibrasTooltipState extends ConsumerState<LibrasTooltip> {
  OverlayEntry? _overlayEntry;
  final _tooltipKey = GlobalKey();

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _createOverlay(BuildContext context, String? gifPath) {
    _removeOverlay();

    if (gifPath == null) return;

    final renderBox = _tooltipKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final offset = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx + size.width + 8,
        top: offset.dy + size.height,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              gifPath,
              width: 200,
              height: 350,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    final isActive = ref.watch(librasMode);

    if (!isActive) {
      return widget.content;
    }

    String? selectedGif;

    if (widget.isHover) {
      selectedGif = widget.imageGif.first;
      if (widget.isHoverSubItems != null && widget.isHoverSubItems!.contains(true)) {
        final hoveredIndex = widget.isHoverSubItems!.indexWhere((e) => e);
        if (hoveredIndex >= 0 && hoveredIndex < (widget.subItemsImageGif?.length ?? 0)) {
          selectedGif = widget.subItemsImageGif?[hoveredIndex];
        }
      }
    }

    // Atualiza o overlay quando o GIF muda
    if (selectedGif != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _createOverlay(context, selectedGif);
      });
    } else {
      _removeOverlay();
    }

    return KeyedSubtree(
      key: _tooltipKey,
      child: widget.content,
    );
  }
}

// class _LibrasTooltipState extends ConsumerState<LibrasTooltip> {
//   @override
//   Widget build(BuildContext context) {
//     final isActive = ref.watch(librasMode);

//     if (!isActive) {
//       return widget.content;
//     }

//     String? selectedGif;
//     int? hoveredIndex;

//     if (widget.isHover) {
//       selectedGif = widget.imageGif.first;
//       if (widget.isHoverSubItems != null &&
//           widget.isHoverSubItems!.contains(true)) {
//         hoveredIndex = widget.isHoverSubItems!.indexWhere((element) => element);
//         if (hoveredIndex >= 0 &&
//             hoveredIndex < (widget.subItemsImageGif?.length ?? 0)) {
//           selectedGif = widget.subItemsImageGif?[hoveredIndex];
//         }
//       }
//       debugPrint("Selected GIF: $selectedGif, Index: $hoveredIndex");
//     }

//     return Tooltip(
//       showDuration:
//           const Duration(seconds: 10), // Tempo prolongado para testes
//       decoration: BoxDecoration(
//         color: background,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       richMessage: WidgetSpan(
//         child: selectedGif != null
//             ? SizedBox(
//                 width: 250,
//                 height: 450,
//                 child: Image.asset(
//                   selectedGif,
//                   gaplessPlayback: true,
//                   filterQuality: FilterQuality.high,
//                   fit: BoxFit.contain,
//                   // errorBuilder: (context, error, stackTrace) {
//                   //   debugPrint("Error loading image $selectedGif: $error");
//                   //   return Container(
//                   //     color: onError,
//                   //     child:
//                   //         const Center(child: Text('Erro ao carregar GIF')),
//                   //   );
//                   // },
//                 ),
//               )
//             : const SizedBox.shrink(),
//       ),
//       child: widget.content,
//     );
//   }
// }

// class LibrasTooltip extends ConsumerStatefulWidget {
//   Widget content;
//   List<String> imageGif;
//   bool isHover;
//   List<bool>? isHoverSubItems;
//   LibrasTooltip(
//       {super.key,
//       required this.content,
//       required this.imageGif,
//       required this.isHover,
//       required this.isHoverSubItems});

//   @override
//   _LibrasTooltipState createState() => _LibrasTooltipState();
// }

// class _LibrasTooltipState extends ConsumerState<LibrasTooltip> {
//   @override
//   Widget build(BuildContext context) {
//     bool isActive = ref.watch(librasMode);

//     if (isActive) {
//       return Tooltip(
//         decoration: BoxDecoration(color: background),
//         richMessage: WidgetSpan(
//           child: Container(
//               color: background,
//               child: Column(
//                 children: [
//                   if (widget.isHover) ...{
//                     // if (widget.imageGif.length > 1) ...{
//                     //   for (var i = 0; i < widget.imageGif.length; i++) ...{
//                     //     if (widget.isHoverSubItems![i]) ...{
//                     //       Image.asset(widget.imageGif[i]),
//                     //     }
//                     //   }
//                     // } else ...{
//                       Image.asset(widget.imageGif[0]),
//                     // }
//                   }
//                 ],
//               )),
//         ),
//         child: widget.content,
//       );
//     } else {
//       return SizedBox(child: widget.content);
//     }
//   }
// }

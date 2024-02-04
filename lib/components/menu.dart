import 'package:flutter/material.dart';
import 'package:obamahome/components/navMenu.dart';
import 'package:obamahome/pages/blog/blog-details.dart';
import 'package:riverpod/riverpod.dart';

final TextEditingController _searchController = TextEditingController();

List<DropdownMenuItem<String>> getDropdownItems(
  BuildContext context,
  String label,
  int index,
  dynamic content,
) {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(value: label, child: content),
    if (index == 0) ...{
      for (int j = 0; j < itemValues[0].itemsHome!.length; j++) ...{
        DropdownMenuItem(
            value: itemValues[0].itemsHome![j],
            child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, navigateTo[index]);
                },
                child: Text(itemValues[0].itemsHome![j]))),
      }
    } else if (index == 1) ...{
      for (int j = 0; j < itemValues[0].itemsBoutUs!.length; j++) ...{
        DropdownMenuItem(
            value: itemValues[0].itemsBoutUs![j],
            child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, navigateTo[index]);
                },
                child: Text(itemValues[0].itemsBoutUs![j].toUpperCase())))
      }
    } else if (index == 2) ...{
      for (int j = 0; j < itemValues[0].itemsServices!.length; j++) ...{
        DropdownMenuItem(
            value: itemValues[0].itemsServices![j],
            child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, navigateTo[index]);
                },
                child: Text(itemValues[0].itemsServices![j])))
      }
    } else if (index == 3) ...{
      for (int j = 0; j < itemValues[0].itemsBlog!.length; j++) ...{
        DropdownMenuItem(
            value: itemValues[0].itemsBlog![j],
            child: InkWell(
                onTap: () {
                  if (j == 0) {
                    Navigator.pushNamed(context, navigateTo[index]);
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BlogDetails(initialPageIndex: 0)));
                  }
                },
                child: Text(itemValues[0].itemsBlog![j])))
      }
    } else if (index == 4) ...{
      for (int j = 0; j < itemValues[0].itemsPages!.length; j++) ...{
        DropdownMenuItem(
            value: itemValues[0].itemsPages![j],
            child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, navigateTo[index]);
                },
                child: Text(itemValues[0].itemsPages![j])))
      }
    } else if (index == 5) ...{
      for (int j = 0; j < itemValues[0].itemsShop!.length; j++) ...{
        DropdownMenuItem(
            value: (itemValues[0].itemsShop![j]),
            child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, navigateTo[index]);
                },
                child: Text(itemValues[0].itemsShop![j])))
      }
    }
  ];
  return menuItems;
}

Widget MenuBar0(
    BuildContext context, int index, String label, dynamic content) {
  return DropdownButton(
    value: label,
    style: Theme.of(context).textTheme.headlineMedium!,
    icon: const SizedBox.shrink(),
    underline: const SizedBox(),
    onChanged: (String? newValue) {
      () {
        label = newValue!;
      };
    },
    items: getDropdownItems(context, label, index, content),
  );
}
// @override
// Widget NavMenu(
//     BuildContext context, double swidth, Axis eixoLista, double heightBtn) {
//   double sizedBoxWidth;
//   bool showSearchBtn = true;

//   //Condição para aparecer o eixo vertical no drawer
//   if (eixoLista == Axis.vertical) {
//     sizedBoxWidth = swidth*.3;
//     showSearchBtn = false;
//   } else {
//     sizedBoxWidth = swidth*0.68;
//   }
//   return Row(
//     children: [
//       SizedBox(
//         child: Expanded(
//           child: SizedBox(
//             width: sizedBoxWidth,
//             height: heightBtn,
//             child: ListView(scrollDirection: eixoLista, children: [
//               for (int i = 0; i < selValue.length; i++) ...{
//                 Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 2.5),
//                     child:
//                         MenuBar0(context, i, selValue[i], selValueContent[i])),
//               },
//               if (showSearchBtn == true) ...{
//                 AnimSearchBar(
//                   rtl: true,
//                   autoFocus: true,
//                   width: 300,
//                   textController: _searchController,
//                   onSuffixTap: () {
//                     _searchController.clear();
//                   },
//                   onSubmitted: (String value) {
//                     debugPrint('onFieldSubmitted value $value');
//                   },
//                 ),
//               }
//             ]),
//           ),
//         ),
//       ),
//     ],
//   );
// }

@override
Widget menuItem(dynamic menuTitle) {
  return InkWell(
    mouseCursor: SystemMouseCursors.click,
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: menuTitle,
    ),
  );
}

class SearchPage {}

class ContactPage {}

class ShopPage {}

class PagesPage {}

class ServicesPage {}

final showSearchBtnProvider = Provider<bool>((ref) => false);

import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class DropdownField extends StatefulWidget {
  const DropdownField(
      {super.key,
      required this.array,
      required this.title,
      this.onChanged,
      required this.titleStyle});

  final List<(int, String)> array;
  final String title;
  final Function(String?)? onChanged;
  final TextStyle titleStyle;

  @override
  State<DropdownField> createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {
  String? dropdownValue = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dropdownValue = widget.array.first.$2;
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 40, bottom: 20),
            child: Text(widget.title, style: widget.titleStyle)),
        Container(
            height: 40,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(bottom: 4),
            child: DropdownButtonFormField<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_drop_down),
                elevation: 5,
                style: textTheme.bodySmall,
                onChanged: (value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                items: widget.array.map(((int, String) value) {
                  return DropdownMenuItem<String>(
                    value: '${value.$2}',
                    child: Container(child: Text(value.$2)),
                  );
                }).toList())),
      ],
    );
  }
}

class RadioTextField extends StatefulWidget {
  RadioTextField(
      {super.key,
      required this.array,
      required this.radioTextFieldID,
      required this.titleStyle,
      this.tileHeight,
      this.initialValue,
      this.shoulAddOptionAll = true,
      this.refreshData = null,
      this.refreshData2 = null});

  late final List<(int, String)> array;
  final int radioTextFieldID;
  final TextStyle titleStyle;
  final Map<int, int?>? initialValue;
  final double? tileHeight;
  bool shoulAddOptionAll;
  Function()? refreshData;
  Function(String)? refreshData2;

  @override
  State<RadioTextField> createState() => _RadioTextFieldState();
}

class _RadioTextFieldState extends State<RadioTextField> {
  @override
  Widget build(BuildContext context) {
    if (widget.shoulAddOptionAll) {
      widget.array.insert(0, (0, 'Todos'));
      widget.shoulAddOptionAll = false;
    }

    return Wrap(
      children: widget.array
          .map((e) => Container(
                height: widget.tileHeight,
                child: ListTile(
                  contentPadding: EdgeInsets.all(3),
                  title: Text(
                    e.$2,
                    style: widget.titleStyle,
                  ),
                  leading: Radio<int>(
                    value: e.$1,
                    splashRadius: 20,
                    groupValue: widget.initialValue![widget.radioTextFieldID],
                    onChanged: (int? value) {
                      _handleUpdate(value, widget.radioTextFieldID);
                      if (widget.refreshData2 != null) {
                        _handleUpdate2(value, e.$2);
                      }
                    },
                  ),
                ),
              ))
          .toList(),
    );
  }

  void _handleUpdate(int? selectedValue, int radioTextFieldId) {
    setState(() {
      widget.initialValue![widget.radioTextFieldID] = selectedValue;
    });
    if (widget.refreshData != null) {
      widget.refreshData!();
    }
  }

  void _handleUpdate2(int? selectedValue, String curriculo) {
    // setState(() {
    //   widget.initialValue![widget.radioTextFieldID] = selectedValue;
    // });
    widget.refreshData2!(curriculo);
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  Widget expandedValue;
  String headerValue;
  bool isExpanded;
}

class ExpansionPanelListSimple extends StatefulWidget {
  ExpansionPanelListSimple(
      {super.key, required this.data, required this.isExpanded});
  final List<Item> data;
  final bool isExpanded;

  @override
  State<ExpansionPanelListSimple> createState() =>
      _ExpansionPanelListSimpleState();
}

class _ExpansionPanelListSimpleState extends State<ExpansionPanelListSimple> {
  @override
  void initState() {
    super.initState();
    setState(() {
      widget.data[0].isExpanded = widget.isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    final _data = widget.data;
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        if (widget.isExpanded) {
          setState(() {
            _data[index].isExpanded = isExpanded;
          });
        }
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            );
          },
          body: ListTile(title: item.expandedValue),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:obamahome/app/models/objeto_aprendizagem.dart';
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
      required this.title,
      required this.titleStyle,
      this.initalValue,
      this.shoulAddOptionAll = true,
      this.refreshData = null});

  final List<(int, String)> array;
  final String title;
  final TextStyle titleStyle;
  final int? initalValue;
  var selectedValue;
  bool shoulAddOptionAll;
  Function(int?)? refreshData;

  @override
  State<RadioTextField> createState() => _RadioTextFieldState();
}

class _RadioTextFieldState extends State<RadioTextField> {
  int? _character;

  @override
  void initState() {
    _character = widget.initalValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.shoulAddOptionAll) {
      widget.array.insert(0, (0, 'Todos'));
      widget.shoulAddOptionAll = false;
    }

    return Column(
      children: widget.array
          .map((e) => ListTile(
                title: Text(
                  e.$2,
                  style: widget.titleStyle,
                ),
                leading: Radio<int>(
                  value: e.$1,
                  groupValue: _character,
                  onChanged: _handleUpdate,
                ),
              ))
          .toList(),
    );
  }

  void _handleUpdate(int? value) {
    setState(() {
      _character = value;
      widget.selectedValue = value;
    });
    widget.refreshData!(_character);
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
  const ExpansionPanelListSimple({super.key, required this.data});
  final List<Item> data;

  @override
  State<ExpansionPanelListSimple> createState() =>
      _ExpansionPanelListSimpleState();
}

class _ExpansionPanelListSimpleState extends State<ExpansionPanelListSimple> {
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
        setState(() {
          _data[index].isExpanded = isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(title: item.expandedValue),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

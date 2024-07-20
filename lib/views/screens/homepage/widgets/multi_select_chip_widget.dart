import 'package:flutter/material.dart';

class MultiSelectChip extends StatefulWidget {
  MultiSelectChip(this.reportList, {required this.onSelectionChanged});

  final List<String> reportList;
  final Function(String) onSelectionChanged;

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  String selectedChoice = "";

  _buildChoiceList() {
    List<Widget> choices = [];
    widget.reportList.forEach(
      (item) {
        choices.add(
          Container(
            color: Colors.transparent,
            padding: const EdgeInsets.all(2.0),
            child: ChoiceChip(
              backgroundColor: Colors.transparent,
              label: Text(item),
              selected: selectedChoice == item,
              onSelected: (selected) {
                setState(
                  () {
                    selectedChoice = item;
                    widget.onSelectionChanged(selectedChoice);
                  },
                );
              },
            ),
          ),
        );
      },
    );
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:multi_select_flutter/chip_field/multi_select_chip_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

List<String> animalSizes = [
  'Small', 'Medium', 'Large',
  'X-Large'
];
List<String> selectedSizes = [];

List<String> animalAges = [
  'Baby', 'Young', 'Adult',
  'Senior'
];
List<String> selectedAges = [];

List<String> animalCoats = [
  'Short', 'Medium', 'Long', 'Wire', 'Hairless', 'Curly'
];
List<String> selectedCoats = [];

class SortDogs extends StatefulWidget {
  const SortDogs({Key? key}) : super(key: key);

  @override
  _SortDogsState createState() => _SortDogsState();
}

class _SortDogsState extends State<SortDogs> {

  List<Widget> selectionChips (List<String> options, List<String> selections) {
    List<Widget> chips = [];
    for (int i=0; i< options.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left:0, right: 10),
        child: FilterChip(
          label: Text(options[i]),
          labelStyle: const TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.w600,
          ),
          backgroundColor: Colors.grey[200],
          selected: selections.contains(options[i]),
          checkmarkColor: Colors.blueGrey,
          onSelected: (bool value)
          {
            setState(() {
              if(value) {
                selections.add(options[i]);
              }
              else {
                selections.remove(options[i]);
              }
            });
            // print(selections);
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          'Sort Dogs',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w800
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pop(context, {
                'ages': selectedAges.join(',').toLowerCase(),
                'coats': selectedCoats.join(',').toLowerCase(),
                'sizes': selectedSizes.join(',').toLowerCase(),
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 13, horizontal: 12),
              // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              alignment: Alignment.center,
              height: 40,
              width: 65,
              child: const Text(
                'Apply',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Size:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            Wrap(
              children: selectionChips(animalSizes, selectedSizes),
            ),
            const SizedBox(height: 15),
            const Text(
              'Age:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            Wrap(
              children: selectionChips(animalAges, selectedAges),
            ),
            const SizedBox(height: 15),
            const Text(
              'Coat:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            Wrap(
              children: selectionChips(animalCoats, selectedCoats),
            ),
          ],
        ),
      ),
    );
  }
}

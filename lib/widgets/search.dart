import 'package:buildex/common/common.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldCustom(
          textEditingController: textEditingController,
          labelText: 'Search',
          suffixIcon: const Icon(Icons.search),
        ),
        Padding(
          padding: const EdgeInsets.all(7.5),
          child: Wrap(
            spacing: 15,
            children: [
              CheckBoxCustom(
                initialValue: false,
                text: 'Vehicles',
                selectedValue: (val) {},
              ),
              CheckBoxCustom(
                initialValue: false,
                text: 'Centers',
                selectedValue: (val) {},
              ),
              CheckBoxCustom(
                initialValue: false,
                text: 'Parts',
                selectedValue: (val) {},
              )
            ],
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemCount: 20,
          itemBuilder: ((context, index) {
            return ListTile(
              title: Text('data $index'),
            );
          }),
        ))
      ],
    );
  }
}

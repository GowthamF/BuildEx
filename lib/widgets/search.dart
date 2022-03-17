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
        Expanded(
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                const TabBar(
                  labelColor: Colors.blue,
                  tabs: [
                    Tab(
                      text: 'Vehicle',
                    ),
                    Tab(
                      text: 'Service Centers',
                    )
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: 20,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text('data$index'),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: 20,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text('data$index'),
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:buildex/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Home(),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Align(
                child: Text('BuildEx'),
              ),
            ),
            ListTile(
              onTap: () {},
              title: const Text('Choose Service Centers'),
            ),
            ListTile(
              onTap: () {},
              title: const Text('Sell Your Vehicle'),
            ),
            ListTile(
              onTap: () {},
              title: const Text('Buy a Vehicle'),
            ),
            ListTile(
              onTap: () {},
              title: const Text('Sign out'),
            )
          ],
        ),
      ),
    );
  }
}

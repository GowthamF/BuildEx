import 'package:buildex/cubits/cubits.dart';
import 'package:buildex/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Initial extends StatefulWidget {
  const Initial({Key? key}) : super(key: key);

  @override
  State<Initial> createState() => _InitialState();
}

class _InitialState extends State<Initial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomePageChangeCubit, int>(
        builder: (context, state) {
          if (state == 1) {
            return SearchScreen();
          } else if (state == 2) {
            return NotificationsScreen();
          } else if (state == 3) {
            return ProfileScreen();
          }

          return HomeScreen();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: BlocBuilder<HomePageChangeCubit, int>(
            builder: (context, state) {
              return Row(
                children: [
                  Expanded(
                    child: IconButton(
                      color: state == 0 ? Colors.blue : null,
                      onPressed: () {
                        context.read<HomePageChangeCubit>().changePage(0);
                      },
                      icon: Icon(
                        Icons.home_outlined,
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      color: state == 1 ? Colors.blue : null,
                      onPressed: () {
                        context.read<HomePageChangeCubit>().changePage(1);
                      },
                      icon: Icon(Icons.search),
                    ),
                  ),
                  Expanded(child: Text('')),
                  Expanded(
                    child: IconButton(
                      color: state == 2 ? Colors.blue : null,
                      onPressed: () {
                        context.read<HomePageChangeCubit>().changePage(2);
                      },
                      icon: Icon(Icons.notifications_outlined),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      color: state == 3 ? Colors.blue : null,
                      onPressed: () {
                        context.read<HomePageChangeCubit>().changePage(3);
                      },
                      icon: Icon(Icons.person_outline),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

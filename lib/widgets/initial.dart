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
            return const SearchScreen();
          } else if (state == 2) {
            return const NotificationsScreen();
          } else if (state == 3) {
            return const ProfileScreen();
          }

          return const HomeScreen();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showGeneralDialog(
            context: context,
            barrierDismissible: true,
            barrierLabel: 'Close',
            pageBuilder: (
              context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) {
              return const AlertDialog(
                contentPadding: EdgeInsets.all(8),
                title: Text('Add'),
                content: AddDialog(),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
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
                      icon: const Icon(
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
                      icon: const Icon(Icons.search),
                    ),
                  ),
                  const Expanded(child: Text('')),
                  Expanded(
                    child: IconButton(
                      color: state == 2 ? Colors.blue : null,
                      onPressed: () {
                        context.read<HomePageChangeCubit>().changePage(2);
                      },
                      icon: const Icon(Icons.notifications_outlined),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      color: state == 3 ? Colors.blue : null,
                      onPressed: () {
                        context.read<HomePageChangeCubit>().changePage(3);
                      },
                      icon: const Icon(Icons.person_outline),
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

import 'package:buildex/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ServiceCenters extends StatelessWidget {
  const ServiceCenters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ServiceCenterScreen(),
                ),
              );
            },
            child: Card(
              elevation: 5,
              child: SizedBox(
                width: 250,
                height: 250,
                child: Image.network(
                  'https://image.shutterstock.com/image-photo/vinnitsa-ukraine-october-21-2017-260nw-782934970.jpg',
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Card(
              elevation: 5,
              child: SizedBox(
                width: 250,
                height: 250,
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRq5ww3Ee-J6GQEpXCv0MWIFMXQV4yk3VBsZB1RMk-1gz-UY9jFGjPMz-Uy-3UN4zqQNLk&usqp=CAU',
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Card(
              elevation: 5,
              child: SizedBox(
                width: 250,
                height: 250,
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQde_Ojxx4QsLu2eRyl26_Q0Br1JUH6Lfo3mJb2sCMXW_4Swb0abF1iLoeIef-cJS-IHrk&usqp=CAU',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

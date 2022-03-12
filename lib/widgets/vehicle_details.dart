import 'package:flutter/material.dart';

class VehicleDetails extends StatelessWidget {
  const VehicleDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Card(
            elevation: 5,
            child: SizedBox(
              width: 250,
              height: 250,
              child: Image.network(
                'https://images.unsplash.com/photo-1552519507-da3b142c6e3d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8Y2Fyc3xlbnwwfHwwfHw%3D&w=1000&q=80',
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: SizedBox(
              width: 250,
              height: 250,
              child: Image.network(
                'https://images.unsplash.com/photo-1494976388531-d1058494cdd8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2Fyc3xlbnwwfHwwfHw%3D&w=1000&q=80',
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: SizedBox(
              width: 250,
              height: 250,
              child: Image.network(
                'https://media.istockphoto.com/photos/red-generic-sedan-car-isolated-on-white-background-3d-illustration-picture-id1189903200?k=20&m=1189903200&s=612x612&w=0&h=L2bus_XVwK5_yXI08X6RaprdFKF1U9YjpN_pVYPgS0o=',
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
    );
  }
}

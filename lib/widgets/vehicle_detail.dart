import 'package:buildex/common/common.dart';
import 'package:flutter/material.dart';

class VehicleDetail extends StatefulWidget {
  const VehicleDetail({Key? key}) : super(key: key);

  @override
  State<VehicleDetail> createState() => _VehicleDetailState();
}

class _VehicleDetailState extends State<VehicleDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Card(
            child: SizedBox(
              height: 250,
              child: Carousel(
                uploadedImageUrls: [],
                isAddPhoto: false,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

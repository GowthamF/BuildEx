import 'package:buildex/common/common.dart';
import 'package:buildex/cubits/cubits.dart';
import 'package:buildex/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceCenter extends StatefulWidget {
  final String serviceId;
  const ServiceCenter({required this.serviceId, Key? key}) : super(key: key);

  @override
  State<ServiceCenter> createState() => _ServiceCenterState();
}

class _ServiceCenterState extends State<ServiceCenter> {
  final TextEditingController _dateEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: DatePicker(
              _dateEditingController,
              (selectedDate) {
                if (selectedDate != null) {
                  context
                      .read<ServiceCenterSlotCubit>()
                      .dateSelected(selectedDate);
                }
              },
            ),
          ),
          BlocBuilder<ServiceCenterSlotCubit, DateTime?>(
            builder: (context, state) {
              if (state != null) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: ServiceCentersSlots(),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
          Button(onPressed: () {}, text: 'Book')
        ],
      ),
    );
  }
}

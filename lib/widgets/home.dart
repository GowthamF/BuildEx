import 'package:buildex/cubits/cubits.dart';
import 'package:buildex/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserRolesCubit, List<UserRoles?>>(
      builder: (context, state) {
        var buyer = state.firstWhere((element) => element == UserRoles.buyer,
            orElse: () => null);
        var serviceCenter = state.firstWhere(
            (element) => element == UserRoles.serviceCenter,
            orElse: () => null);
        var vehicleOwner = state.firstWhere(
            (element) => element == UserRoles.vehicleOwner,
            orElse: () => null);
        return Card(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                serviceCenter != null
                    ? const ServiceCentersRequestsView()
                    : const SizedBox(),
                (buyer != null || vehicleOwner != null)
                    ? Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Vehicle Details',
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          VehicleDetails(),
                        ],
                      )
                    : const SizedBox(),
                (buyer != null || vehicleOwner != null)
                    ? Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Service Centers',
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          ServiceCenters()
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        );
      },
    );
  }
}

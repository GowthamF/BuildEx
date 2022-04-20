import 'package:buildex/blocs/blocs.dart';
import 'package:buildex/common/common.dart';
import 'package:buildex/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                          BlocBuilder<VehicleBloc, VehicleState>(
                            builder: (context, state) {
                              if (state is VehicleLoaded) {
                                return Expanded(
                                  child: ListView.builder(
                                    itemCount: state.vehicles.length,
                                    itemBuilder: (context, index) {
                                      var vehicle =
                                          state.vehicles.toList()[index];
                                      return ListTile(
                                        title: Text(
                                            '${vehicle.model} ${vehicle.registrationNumber}'),
                                        subtitle: Text('${vehicle.yom}'),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  VehicleDetailScreen(
                                                vehicleId: vehicle.id!,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                );
                              }

                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          )
                        ],
                      ),
                      Column(
                        children: [
                          BlocBuilder<ServiceCenterBloc, ServiceCenterState>(
                            builder: (context, state) {
                              if (state is ServiceCenterLoaded) {
                                return Expanded(
                                  child: ListView.builder(
                                    itemCount: state.serviceCenters.length,
                                    itemBuilder: (context, index) {
                                      var serviceCenter =
                                          state.serviceCenters.toList()[index];
                                      return ListTile(
                                        title: Text(serviceCenter.name),
                                        subtitle: Text(serviceCenter.address),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ServiceCenterScreen(
                                                serviceCenterId:
                                                    serviceCenter.id,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                );
                              }

                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
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

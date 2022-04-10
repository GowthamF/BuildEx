import 'package:buildex/blocs/blocs.dart';
import 'package:buildex/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceCenters extends StatefulWidget {
  const ServiceCenters({Key? key}) : super(key: key);

  @override
  State<ServiceCenters> createState() => _ServiceCentersState();
}

class _ServiceCentersState extends State<ServiceCenters> {
  late ServiceCenterBloc _serviceCenterBloc;

  @override
  void initState() {
    super.initState();
    _serviceCenterBloc = BlocProvider.of<ServiceCenterBloc>(context);
    _serviceCenterBloc.add(const GetServiceCenters());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceCenterBloc, ServiceCenterState>(
      builder: (context, state) {
        if (state is ServiceCenterLoaded) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: state.serviceCenters
                  .map((e) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ServiceCenterScreen(serviceCenterId: e.id),
                            ),
                          );
                        },
                        child: Card(
                            elevation: 5,
                            child: Column(
                              children: [
                                Text('${e.name} @ ${e.address}'),
                                SizedBox(
                                  width: 250,
                                  height: 250,
                                  child: Image.network(
                                    'https://image.shutterstock.com/image-photo/vinnitsa-ukraine-october-21-2017-260nw-782934970.jpg',
                                  ),
                                ),
                              ],
                            )),
                      ))
                  .toList(),
            ),
          );
        }

        return const Center(
          widthFactor: 250,
          heightFactor: 250,
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

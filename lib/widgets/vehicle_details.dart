import 'package:buildex/blocs/blocs.dart';
import 'package:buildex/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehicleDetails extends StatefulWidget {
  const VehicleDetails({Key? key}) : super(key: key);

  @override
  State<VehicleDetails> createState() => _VehicleDetailsState();
}

class _VehicleDetailsState extends State<VehicleDetails> {
  late VehicleBloc _vehicleBloc;

  @override
  void initState() {
    super.initState();
    _vehicleBloc = BlocProvider.of<VehicleBloc>(context);
    _vehicleBloc.add(GetVehicles());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehicleBloc, VehicleState>(
      builder: (context, state) {
        if (state is VehicleLoaded) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: state.vehicles
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VehicleDetailScreen(
                              vehicleId: e.id!,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 5,
                        child: SizedBox(
                          width: 250,
                          height: 250,
                          child: Image.network(
                            'https://images.unsplash.com/photo-1552519507-da3b142c6e3d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8Y2Fyc3xlbnwwfHwwfHw%3D&w=1000&q=80',
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

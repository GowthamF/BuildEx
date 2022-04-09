import 'package:buildex/blocs/blocs.dart';
import 'package:buildex/common/common.dart';
import 'package:buildex/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddServiceCenter extends StatefulWidget {
  const AddServiceCenter({Key? key}) : super(key: key);

  @override
  State<AddServiceCenter> createState() => _AddServiceCenterState();
}

class _AddServiceCenterState extends State<AddServiceCenter> {
  final TextEditingController _serviceCenterNameEditingController =
      TextEditingController();
  final TextEditingController _serviceCenterAddressEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late ServiceCenterBloc _serviceCenterBloc;

  @override
  void initState() {
    _serviceCenterBloc = BlocProvider.of<ServiceCenterBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                child: SizedBox(
                  height: 250,
                  child: Carousel(
                    uploadedImageUrls: [],
                  ),
                ),
              ),
            ),
            TextFieldCustom(
              textEditingController: _serviceCenterNameEditingController,
              labelText: 'Service Center Name',
              isRequired: true,
              validationMessage: 'Enter Service Center Name',
            ),
            TextFieldCustom(
              textEditingController: _serviceCenterAddressEditingController,
              labelText: 'Service Center Address',
              validationMessage: 'Enter Service Center Address',
              isRequired: true,
            ),
            BlocConsumer<ServiceCenterBloc, ServiceCenterState>(
              listener: (context, state) {
                if (state is ServiceCenterCreated) {
                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                if (state is ServiceCenterCreating) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Button(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      var serviceCenterModel = ServiceCenterModel(
                          name: _serviceCenterNameEditingController.text.trim(),
                          address: _serviceCenterAddressEditingController.text
                              .trim(),
                          id: '');
                      _serviceCenterBloc.add(CreateServiceCenter(
                          serviceCenterModel: serviceCenterModel));
                    }
                  },
                  text: 'SUBMIT',
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

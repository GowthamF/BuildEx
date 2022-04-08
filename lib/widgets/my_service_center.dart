import 'package:buildex/blocs/blocs.dart';
import 'package:buildex/common/common.dart';
import 'package:buildex/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MyServiceCenter extends StatefulWidget {
  const MyServiceCenter({Key? key}) : super(key: key);

  @override
  State<MyServiceCenter> createState() => _MyServiceCenterState();
}

class _MyServiceCenterState extends State<MyServiceCenter> {
  final TextEditingController _dateEditingController = TextEditingController();
  final TextEditingController _startTimeEditingController =
      TextEditingController();
  final TextEditingController _endTimeEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  TimeOfDay? _selectedStartTime;
  TimeOfDay? _selectedEndTime;
  late TimetableBloc _timetableBloc;
  late TimeslotBloc _timeslotBloc;

  @override
  void initState() {
    super.initState();
    _timetableBloc = BlocProvider.of<TimetableBloc>(context);
    _timeslotBloc = BlocProvider.of<TimeslotBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: DatePicker(
                _dateEditingController,
                (selectedDate) {
                  _selectedDate = selectedDate;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TimePicker(
                _startTimeEditingController,
                (selectedTime) {
                  _selectedStartTime = selectedTime;
                },
                labelText: 'Start Time',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TimePicker(
                _endTimeEditingController,
                (selectedTime) {
                  _selectedEndTime = selectedTime;
                },
                labelText: 'End Time',
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BlocConsumer<TimetableBloc, TimetableState>(
                  listener: (context, timetableState) {
                    if (timetableState is TimetableCreated) {
                      if (_selectedDate != null &&
                          _selectedStartTime != null &&
                          _selectedEndTime != null) {
                        var startTime = DateTime(
                            _selectedDate!.year,
                            _selectedDate!.month,
                            _selectedDate!.day,
                            _selectedStartTime!.hour,
                            _selectedStartTime!.minute);
                        var endTime = DateTime(
                            _selectedDate!.year,
                            _selectedDate!.month,
                            _selectedDate!.day,
                            _selectedEndTime!.hour,
                            _selectedEndTime!.minute);
                        var timeSlot = TimeslotModel(
                            endTime: endTime,
                            startTime: startTime,
                            isActive: true,
                            timeTable: timetableState.timetableId ?? '');
                        _timeslotBloc.add(CreateTimeSlot(timeSlot));
                      }
                    }
                  },
                  builder: (context, timetableState) {
                    return BlocConsumer<TimeslotBloc, TimeslotState>(
                      listener: (context, timeSlotState) {
                        if (timeSlotState is TimeslotCreated) {
                          Navigator.pop(context);
                        }
                      },
                      builder: (context, timeSlotState) {
                        if (timetableState is TimetableCreating ||
                            timeSlotState is TimeslotCreating) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Button(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (_selectedDate != null &&
                                    _selectedStartTime != null &&
                                    _selectedEndTime != null) {
                                  var month = DateFormat.MMMM()
                                      .format(_selectedDate!)
                                      .toString();
                                  var day = DateFormat.EEEE()
                                      .format(_selectedDate!)
                                      .toString();
                                  var timeTable = TimetableModel(
                                      day: day, isActive: true, month: month);
                                  _timetableBloc
                                      .add(CreateTimetable(timeTable));
                                }
                              }
                            },
                            text: 'Update Timeslot');
                      },
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePicker extends StatefulWidget {
  final void Function(DateTime dateTime) onChanged;
  final String text;
  final DateTime? initialDate;

  const DateTimePicker(
      {Key? key, required this.onChanged, required this.text, this.initialDate})
      : super(key: key);

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  DateTime? combinedDateTime;

  void _combineDateTime() {
    if (selectedDate != null && selectedTime != null) {
      combinedDateTime = DateTime(
        selectedDate!.year,
        selectedDate!.month,
        selectedDate!.day,
        selectedTime!.hour,
        selectedTime!.minute,
      );
      setState(() {});
      widget.onChanged(combinedDateTime!);
    }
  }

  @override
  Widget build(BuildContext context) {
    DateFormat format = DateFormat('yyyy-MM-dd HH:mm');
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          onPressed: () async {
            final pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            final pickedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            selectedTime = pickedTime;
            selectedDate = pickedDate;
            _combineDateTime();
          },
          icon: Icon(Icons.date_range_outlined),
        ),
        SizedBox(height: 16),
        Text(
          '${widget.text}: ${(combinedDateTime != null) ? format.format(combinedDateTime!) : format.format(widget.initialDate ?? DateTime.now())}',
        ),
      ],
    );
  }
}

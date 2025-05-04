import 'dart:ui';

import 'package:flutter/material.dart';

class EndTimePicker extends StatefulWidget {
  final Function(DateTime)? onDateTimeSelected;

  const EndTimePicker({super.key, required this.onDateTimeSelected});

  @override
  State<EndTimePicker> createState() => _EndTimePickerState();
}

class _EndTimePickerState extends State<EndTimePicker> {
  DateTime? selectedDateTime;

  Future<void> pickDateTime() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        final result = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        setState(() {
          selectedDateTime = result;
        });

        widget.onDateTimeSelected!(result);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pickDateTime,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(Icons.calendar_month, color: Colors.green),
            SizedBox(width: 10),
            Text(
              selectedDateTime == null
                  ? 'End Time'
                  : '${selectedDateTime!.day}/${selectedDateTime!.month}/${selectedDateTime!.year} ${selectedDateTime!.hour}:${selectedDateTime!.minute}',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

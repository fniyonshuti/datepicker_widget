import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of  application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meeting Date Picker',
      theme: ThemeData(
        // This is the theme of application.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MeetingDatePickerPage(),
    );
  }
}

class MeetingDatePickerPage extends StatefulWidget {
  const MeetingDatePickerPage({super.key});

  @override
  State<MeetingDatePickerPage> createState() => _MeetingDatePickerPageState();
}

class _MeetingDatePickerPageState extends State<MeetingDatePickerPage> {
  DateTime? _selectedDate;

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      helpText: 'Select meeting date',
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // This builds the UI of the page.
    final String dateText = _selectedDate == null
        ? 'No date selected'
        : 'Selected Date: ${DateFormat('dd-MM-yyyy').format(_selectedDate!)}';
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // The title text which will be displayed in the app bar.
        title: const Text('datepicker'),
      ),
      body: Center(
        // Center   takes a single child and positions it
        // in the middle of the parent.
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.calendar_today, size: 64, color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 24),
              Text(
                dateText,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                icon: const Icon(Icons.event),
                label: const Text('Select Date'),
                onPressed: () => _pickDate(context),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

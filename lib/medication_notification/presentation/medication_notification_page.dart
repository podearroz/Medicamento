import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class MedicationNotificationPage extends StatefulWidget {
  const MedicationNotificationPage({Key? key}) : super(key: key);

  @override
  State<MedicationNotificationPage> createState() =>
      _MedicationNotificationPageState();
}

class _MedicationNotificationPageState
    extends State<MedicationNotificationPage> {
  final TextEditingController _medicationNameController =
      TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
    tz.initializeTimeZones(); // Inicializa o pacote timezone
  }

  void _initializeNotifications() {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> _scheduleNotification(
      String medicationName, TimeOfDay time) async {
    final now = DateTime.now();
    final tzTime = tz.TZDateTime.local(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    if (tzTime.isBefore(DateTime.now())) {
      return; // Evita agendar notificações no passado.
    }

    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'medication_channel',
      'Medication Notifications',
      channelDescription: 'Notification for medication reminders',
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
    );

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Medication Reminder',
      'Time to take your medication: $medicationName',
      tzTime,
      platformDetails,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medication Notifications'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _medicationNameController,
                decoration: const InputDecoration(
                  labelText: 'Medication Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the medication name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _timeController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Time (e.g., 08:00 AM)',
                  border: OutlineInputBorder(),
                ),
                onTap: () async {
                  final TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (pickedTime != null) {
                    _timeController.text = pickedTime.format(context);
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a time';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final medicationName = _medicationNameController.text;
                    final timeParts = _timeController.text.split(' ');
                    final hourMinute = timeParts[0].split(':');
                    final isPM = timeParts[1].toLowerCase() == 'pm';

                    final hour = int.parse(hourMinute[0]) + (isPM ? 12 : 0);
                    final minute = int.parse(hourMinute[1]);

                    final time = TimeOfDay(hour: hour, minute: minute);

                    _scheduleNotification(medicationName, time);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                              Text('Notification scheduled successfully!')),
                    );
                  }
                },
                child: const Text('Schedule Notification'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

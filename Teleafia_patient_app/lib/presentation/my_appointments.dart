import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:teleafia_patient/shared/bottom_nav.dart';
import 'package:teleafia_patient/shared/header.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAppointments(),
    );
  }
}

class Appointment {
  final String serviceName;
  final String appointmentId;
  final DateTime date;
  final String time;
  final String status;

  Appointment({
    required this.serviceName,
    required this.appointmentId,
    required this.date,
    required this.time,
    required this.status,
  });
}

class MyAppointments extends StatefulWidget {
  const MyAppointments({Key? key}) : super(key: key);

  @override
  MyAppointmentsState createState() => MyAppointmentsState();
}

class MyAppointmentsState extends State<MyAppointments>
    with TickerProviderStateMixin {
  late TabController _tabController;
  Color background = const Color(0xFFFCF4F4);
  Color maroon = const Color(0xFFc00100);
  Color dark_maroon = const Color(0xFF850808);

  List<Appointment> appointments = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _fetchAppointments();
  }

  Future<void> _fetchAppointments() async {
    // Make a network call to fetch the appointments data
    try {
      final response = await http.get(
          Uri.parse('https://41cf-102-210-244-74.ngrok-free.app/api/appointments/appointment-history/123456'));

      if (response.statusCode == 200) {
        // Parse the response data
        final jsonData = json.decode(response.body);
        final List<dynamic> appointmentsData = jsonData['appointments'];
            print(jsonData);
        // Clear existing appointments
        appointments.clear();

        // Populate the appointments list
        appointmentsData.forEach((data) {
          final serviceName = data['serviceName'];
          final appointmentId = data['appointmentId'];
          final date = DateTime.parse(data['date']);
          final time = data['time'];
          final status= data['status'];

          appointments.add(Appointment(
            serviceName: serviceName,
            appointmentId: appointmentId,
            date: date,
            time: time,
            status: status,
          ));
        });

        // Update UI
        setState(() {});
      } else {
        throw Exception('Failed to fetch appointments');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height* 1,
        child: Column(
          children: [
            HealthClientHeader(heading: 'My Bookings'),
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(child: Text('Upcoming', style: TextStyle(fontSize: 12, color: maroon))),
                Tab(child: Text('Pending', style: TextStyle(fontSize: 12, color: maroon))),
                Tab(child: Text('Past', style: TextStyle(fontSize: 12, color: maroon))),
                Tab(child: Text('Cancelled', style: TextStyle(fontSize: 12, color: maroon))),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildTabContent('Upcoming'),
                  _buildTabContent('Pending'),
                  _buildTabContent('Past'),
                  _buildTabContent('Cancelled'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: HealthClientFooter(),
    );
  }

  Widget _buildTabContent(String status) {
    List<Appointment> filteredAppointments;
    switch (status) {
      case 'Upcoming':
        filteredAppointments = appointments; // Filter as needed
        break;
      case 'Pending':
        filteredAppointments = appointments; // Filter as needed
        break;
      case 'Past':
        filteredAppointments = appointments; // Filter as needed
        break;
      case 'Cancelled':
        filteredAppointments = appointments; // Filter as needed
        break;
      default:
        filteredAppointments = [];
    }

    if (filteredAppointments.isEmpty) {
      return Center(child: Text('No appointments'));
    }

    return ListView.builder(
      itemCount: filteredAppointments.length,
      itemBuilder: (context, index) {
        return _buildAppointmentWidget(filteredAppointments[index]);
      },
    );
  }

  Widget _buildAppointmentWidget(Appointment appointment) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Appointment with Doctor Jack Masinde',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.calendar_today, size: 10),
                    SizedBox(width: 5),
                    Text('Service: ${appointment.serviceName}', style: TextStyle(fontSize: 10)),
                    SizedBox(width: 5),
                    Text(' reference code: ${appointment.appointmentId}', style: TextStyle(fontSize: 10)),
                    SizedBox(width: 5),
                    Text('on date: ${DateFormat('yyyy-MM-dd').format(appointment.date)}', style: TextStyle(fontSize: 10)),
                    SizedBox(width: 5),
                    Text('from: ${appointment.time}', style: TextStyle(fontSize: 10)),
                    SizedBox(width: 5),
                    Text('status: ${appointment.status}', style: TextStyle(fontSize: 10)),
                    SizedBox(width: 20),
                    Icon(Icons.access_time, size: 10),
                    SizedBox(width: 3),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => _selectDate(),
                    child: Row(
                      children: [
                        Text('Details ', style: TextStyle(fontSize: 12)),
                        Icon(Icons.info_outline, size: 13),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color(0xFFc00100),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'View Details',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class _selectDate {
}

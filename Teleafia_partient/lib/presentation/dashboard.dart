
import 'package:flutter/material.dart';
import '../shared/bottom_nav.dart';


const backgroundColor = Color(0xFFFCF4F4);
const maroon = Color(0xFFc00100);

class HealthClientDashboard extends StatelessWidget {
  const HealthClientDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PatientDashboard(),
    );
  }
}

class PatientDashboard extends StatefulWidget {
  const PatientDashboard({super.key});

  @override
  State<PatientDashboard> createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: SizedBox(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: 200,
                        margin: EdgeInsets.zero,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: maroon,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.search, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: backgroundColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            width: 250, // Adjusted width to screenWidth
            height: 230,
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(10.0), // Border radius applied here
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  10.0), // ClipRRect for applying border radius
              child: Image.asset(
                'assets/equiAfia.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: const Text(
              'Our Services',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  healthClientServices(
                    context,
                    'Medical Services',
                    'assets/medical_services.PNG',
                    PaymentsScreen(),
                  ),
                  healthClientServices(context, 'Specialists',
                      'assets/specialists.PNG', PaymentsScreen()),
                  healthClientServices(context, 'Health Records',
                      'assets/my_health_records.PNG', PaymentsScreen()),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  healthClientServices(context, 'My Appointments',
                      'assets/my_appointments.PNG', PaymentsScreen()),
                  healthClientServices(context, 'Medical Centers',
                      'assets/medical_centers.PNG', ExploreScreen()),
                  healthClientServices(context, 'About Us',
                      'assets/about_us.PNG', CustomerCareScreen()),
                ],
              ),
            ],
          ),
          SizedBox(height: 40),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: const Center(
              child: Text(
                'Your caring health partner',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: maroon,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: HealthClientFooter(),
    );
  }
}

Widget healthClientServices(
    BuildContext context, String title, String imagePath, Widget destination) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Container(
          width: 80, // Adjusted width to fit 3 rectangles in a row
          height: 60,
          decoration: BoxDecoration(
            color: maroon,
            borderRadius:
            BorderRadius.circular(10.0), // Border radius applied here
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => destination),
                  );
                },
                child: Image.asset(
                  imagePath,
                  height: 25,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 7,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
      ),
      body: Center(
        child: Text('Explore Screen'),
      ),
    );
  }
}

class PaymentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payments'),
      ),
      body: Center(
        child: Text('Payments Screen'),
      ),
    );
  }
}

class CustomerCareScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Customer Care'),
        ),
        body: Center(
            child: Text('Customer Care Screen'),
            ),
       );
    }
}
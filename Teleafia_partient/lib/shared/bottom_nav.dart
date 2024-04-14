import 'package:flutter/material.dart';


class HealthClientFooter extends StatelessWidget {
  Widget bottomNavigatorButtons(BuildContext context, double width,
      String title, String imagePath, Widget destination) {
    return BottomAppBar(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        width: width,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
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
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 6.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          bottomNavigatorButtons(
            context,
            45,
            'Explore',
            'assets/explore.jpg',
            ExploreScreen(),
          ),
          bottomNavigatorButtons(
            context,
            49,
            'Payments',
            'assets/payments.PNG',
            PaymentsScreen(),
          ),
          bottomNavigatorButtons(
            context,
            55,
            'Home',
            'assets/home.PNG',
            PaymentsScreen(),
          ),
          bottomNavigatorButtons(
            context,
            49,
            'Customer Care',
            'assets/customer_care.jpg',
            CustomerCareScreen(),
          ),
          bottomNavigatorButtons(
            context,
            45,
            'Profile',
            'assets/profile.PNG',
            PaymentsScreen(),

          ),
        ],
      ),
    );
  }
}

class HealthClientDashboard {
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
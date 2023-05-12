import 'package:byjus_ui_core/components/byjus_image.dart';
import 'package:flutter/material.dart';
import 'package:myapp/screens/product_screen.dart';
import 'package:myapp/screens/users_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // state full widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'my first app',
        ),
        centerTitle: true,
        // backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ProductsPage();
                    },
                  ),
                );
              },
              child: const Text('Get Products'),
            ),

            ByjusNetworkImage(
              "https://static.tllms.com/android/btlav3-new/staging/assets/images/default/calendar/event/completed.svg",
              placeholderBuilder: (context) {
                return Container(
                  color: Colors.blue,
                  child: const Text('Error Image'),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const UsersPage();
                    },
                  ),
                );
              },
              child: const Text('Get Users'),
            ),
          ],
        ),
      ),
    );
  }
}

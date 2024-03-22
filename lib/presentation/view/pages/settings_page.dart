import 'package:flutter/material.dart';
import 'package:gannar/presentation/view/widgets/get_info_user.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('SharedPreferences'),
        backgroundColor: Colors.white,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Información personal',
            ),
            SizedBox(height: 20),
            GetInfoUser()
          ],
        ),
      ),
    );
  }
}

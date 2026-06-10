import 'package:clean_architecture_reference/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppStrings.profileScreenTitle),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(child: Text(AppStrings.welcomeUser)),
    );
  }
}

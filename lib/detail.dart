import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String website;

  const DetailScreen({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.website,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama: $name',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Email: $email'),
            const SizedBox(height: 10),
            Text('Phone: $phone'),
            const SizedBox(height: 10),
            Text('Website: $website'),
          ],
        ),
      ),
    );
  }
}

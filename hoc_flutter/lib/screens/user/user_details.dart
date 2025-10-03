import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hoc_flutter/model/user.dart';
import 'package:intl/intl.dart';

class UserDetails extends StatelessWidget {
  final User user;

  const UserDetails({super.key, required this.user});

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chi tiết người dùng')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blue.shade100,
                backgroundImage: user.avatar != null
                    ? FileImage(File(user.avatar!))
                    : null,
                child: user.avatar == null
                    ? Text(
                        user.name.substring(0, 1).toUpperCase(),
                        style: const TextStyle(fontSize: 40),
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow('Họ và Tên', user.name),
                    const Divider(),
                    _buildDetailRow('Email', user.email),
                    const Divider(),
                    _buildDetailRow('Số điện thoại', user.phone),
                    const Divider(),
                    _buildDetailRow(
                      'Ngày sinh',
                      DateFormat('dd/MM/yyyy').format(user.dateOfBirth),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

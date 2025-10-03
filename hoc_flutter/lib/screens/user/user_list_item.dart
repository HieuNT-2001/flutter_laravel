import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hoc_flutter/screens/user/user_details.dart';
import 'package:hoc_flutter/model/user.dart';

class UserListItem extends StatelessWidget {
  final User user;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const UserListItem({
    super.key,
    required this.user,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          backgroundImage: user.avatar != null
              ? FileImage(File(user.avatar!))
              : null,
          child: user.avatar == null
              ? Text(user.name.substring(0, 1).toUpperCase())
              : null,
        ),
        title: Text(user.name),
        subtitle: Text(user.email),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: onEdit,
              icon: const Icon(Icons.edit, color: Colors.blue),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Xác nhận xóa'),
                    content: Text('Bạn có chắc chắn muốn xóa ${user.name}?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Hủy'),
                      ),
                      TextButton(
                        onPressed: () {
                          onDelete();
                          Navigator.pop(context);
                        },
                        child: const Text('Xóa'),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UserDetails(user: user)),
          );
        },
      ),
    );
  }
}

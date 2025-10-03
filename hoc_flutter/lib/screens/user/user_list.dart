import 'package:flutter/material.dart';
import 'package:hoc_flutter/screens/user/user_create.dart';
import 'package:hoc_flutter/screens/user/user_edit.dart';
import 'package:hoc_flutter/model/user.dart';
import 'package:hoc_flutter/screens/user/user_list_item.dart';
import 'package:hoc_flutter/service/user_service.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  late Future<List<User>> _userFuture;
  final userService = UserService();

  Future<void> _refreshUsers() async {
    setState(() {
      _userFuture = userService.getAllUsers();
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách người dùng'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserCreate()),
              ).then((added) {
                if (added == true) _refreshUsers();
              });
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(onPressed: _refreshUsers, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: FutureBuilder(
        future: _userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Đã xảy ra lỗi: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Không có người dùng nào'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final user = snapshot.data![index];
                return UserListItem(
                  user: user,
                  onDelete: () async {
                    await userService.deleteUser(user.id!);
                    _refreshUsers();
                  },
                  onEdit: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserEdit(user: user),
                      ),
                    ).then((updated) {
                      if (updated == true) _refreshUsers();
                    });
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hoc_flutter/Helper/date_picker_helper.dart';
import 'package:hoc_flutter/Helper/image_picker_helper.dart';
import 'package:hoc_flutter/model/user.dart';
import 'package:hoc_flutter/service/user_service.dart';

class UserCreate extends StatefulWidget {
  final User? user;

  const UserCreate({super.key, this.user});

  @override
  State<UserCreate> createState() => _UserCreateState();
}

class _UserCreateState extends State<UserCreate> {
  final userService = UserService();

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dateController = TextEditingController();
  late DateTime _selectedDate;
  File? _avatarFile;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final user = User(
      name: _nameController.text,
      email: _emailController.text,
      phone: _phoneController.text,
      avatar:
          _avatarFile?.path ?? widget.user?.avatar, // lấy ảnh mới hoặc ảnh cũ
      dateOfBirth: _selectedDate,
    );

    await userService.createUser(user);

    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Đã lưu User vào DB")));

    Navigator.pop(
      context,
      true,
    ); // quay lại màn trước, có thể refresh danh sách
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thêm người dùng')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () => ImagePickerHelper.showPickOptionsDialog(
                    context: context,
                    onImageSelected: (file) {
                      setState(() {
                        _avatarFile = file;
                      });
                    },
                  ),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: _avatarFile != null
                        ? FileImage(_avatarFile!)
                        : (widget.user?.avatar != null
                              ? FileImage(File(widget.user!.avatar!))
                              : null),
                    child: (_avatarFile == null && widget.user?.avatar == null)
                        ? const Icon(Icons.camera_alt, size: 60)
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vui lòng nhập tên';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Họ và tên',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vui lòng nhập email';
                          }
                          final emailRegex = RegExp(
                            r'^[^@]+@[^@]+\.[^@]+',
                          ); // regex đơn giản kiểm tra định dạng email
                          if (!emailRegex.hasMatch(value)) {
                            return 'Vui lòng nhập email hợp lệ';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _phoneController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vui lòng nhập số điện thoại';
                          }
                          final phoneRegex = RegExp(r'^\d{10,15}$');
                          if (!phoneRegex.hasMatch(value)) {
                            return 'Vui lòng nhập số điện thoại hợp lệ (10-15 chữ số)';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Số điện thoại',
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _dateController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vui lòng chọn ngày sinh';
                          }
                          return null;
                        },
                        readOnly: true, // ngăn không cho nhập tay
                        onTap: () => DatePickerHelper.selectDate(
                          context: context,
                          onDateSelected: (date) {
                            _selectedDate = date;
                            _dateController.text =
                                "${date.day}/${date.month}/${date.year}";
                          },
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Ngày sinh',
                          prefixIcon: Icon(Icons.calendar_today),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.save),
                  label: const Text("Lưu người dùng"),
                  onPressed: _submit,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

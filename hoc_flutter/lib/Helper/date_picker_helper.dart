import 'package:flutter/material.dart';

class DatePickerHelper {
  static Future<void> selectDate({
    required BuildContext context,
    required Function(DateTime) onDateSelected,
  }) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // ngày mặc định
      firstDate: DateTime(1900), // ngày nhỏ nhất
      lastDate: DateTime.now(), // ngày lớn nhất
    );
    if (date != null) onDateSelected(date);
  }
}

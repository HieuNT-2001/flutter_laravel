import 'package:flutter/material.dart';
import 'package:hoc_flutter/screens/home/popup_login_register.dart';

class CustomSearchBar extends StatelessWidget {
  final String? hintText;
  final double? spaceBefore;
  final double? spaceAfter;

  const CustomSearchBar({
    super.key,
    this.spaceBefore = 0,
    this.spaceAfter = 0,
    this.hintText = 'Tìm kiếm',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: spaceBefore),
        SearchBar(
          hintText: hintText,
          leading: const Icon(Icons.search),
          elevation: const WidgetStatePropertyAll(0),
          backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Colors.grey, width: 1),
            ),
          ),
          onTap: () {
            showModalBottomSheet(
              shape: const RoundedRectangleBorder(),
              context: context,
              builder: (context) {
                return const PopupLoginRegister(isCustomer: true);
              },
            );
          },
        ),
        SizedBox(height: spaceAfter),
      ],
    );
  }
}

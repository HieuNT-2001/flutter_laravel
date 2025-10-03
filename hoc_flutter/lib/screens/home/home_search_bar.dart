import 'package:flutter/material.dart';
import 'package:hoc_flutter/screens/home/popup_login_register.dart';

class HomeSearchBar extends StatelessWidget {
  final bool isCustomer;
  const HomeSearchBar({super.key, required this.isCustomer});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: "Tìm kiếm dịch vụ",
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
            return PopupLoginRegister(isCustomer: isCustomer);
          },
        );
      },
    );
  }
}

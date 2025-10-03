import 'package:flutter/material.dart';
import 'package:hoc_flutter/screens/home/popup_login_register.dart';

class ListService extends StatelessWidget {
  const ListService({super.key});

  Widget buildServiceItem(
    BuildContext context,
    String icon,
    String title,
    String subtitle,
  ) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
        shape: const RoundedRectangleBorder(),
        context: context,
        builder: (context) {
          return const PopupLoginRegister(isCustomer: true);
        },
      ),
      child: SizedBox(
        width: 100,
        child: Column(
          children: [
            Image.asset(icon, width: 50, height: 50),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Scrollbar(
        child: GridView.count(
          scrollDirection: Axis.horizontal,
          crossAxisCount: 2,
          children: <Widget>[
            buildServiceItem(
              context,
              "assets/images/tho.png",
              "Điện lạnh",
              "5 dịch vụ",
            ),
            buildServiceItem(
              context,
              "assets/images/tho.png",
              "Điện",
              "3 dịch vụ",
            ),
            buildServiceItem(
              context,
              "assets/images/tho.png",
              "Nước",
              "3 dịch vụ",
            ),
            buildServiceItem(
              context,
              "assets/images/tho.png",
              "Điện gia dụng",
              "4 dịch vụ",
            ),
            buildServiceItem(
              context,
              "assets/images/tho.png",
              "Sửa chữa thiết bị điện tử",
              "6 dịch vụ",
            ),
            buildServiceItem(
              context,
              "assets/images/tho.png",
              "Nhôm kính",
              "5 dịch vụ",
            ),
            buildServiceItem(
              context,
              "assets/images/tho.png",
              "Cơ khí",
              "6 dịch vụ",
            ),
            buildServiceItem(
              context,
              "assets/images/tho.png",
              "thiết bị gia dụng",
              "0 dịch vụ",
            ),
            buildServiceItem(
              context,
              "assets/images/tho.png",
              "Sửa khóa",
              "2 dịch vụ",
            ),
            buildServiceItem(
              context,
              "assets/images/tho.png",
              "Sửa xe",
              "4 dịch vụ",
            ),
            buildServiceItem(
              context,
              "assets/images/tho.png",
              "Cửa cuốn",
              "2 dịch vụ",
            ),
            buildServiceItem(
              context,
              "assets/images/tho.png",
              "Giúp việc nhà",
              "6 dịch vụ",
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hoc_flutter/widgets/service_item.dart';

class ListService extends StatelessWidget {
  const ListService({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Scrollbar(
        child: GridView.count(
          scrollDirection: Axis.horizontal,
          crossAxisCount: 2,
          children: const <Widget>[
            ServiceItem(
              icon: 'assets/images/tho.png',
              title: 'Điện lạnh',
              subtitle: '5 dịch vụ',
            ),
            ServiceItem(
              icon: 'assets/images/tho.png',
              title: 'Điện',
              subtitle: '3 dịch vụ',
            ),
            ServiceItem(
              icon: 'assets/images/tho.png',
              title: 'Nước',
              subtitle: '3 dịch vụ',
            ),
            ServiceItem(
              icon: 'assets/images/tho.png',
              title: 'Điện gia dụng',
              subtitle: '4 dịch vụ',
            ),
            ServiceItem(
              icon: 'assets/images/tho.png',
              title: 'Sửa chữa thiết bị điện tử',
              subtitle: '6 dịch vụ',
            ),
            ServiceItem(
              icon: 'assets/images/tho.png',
              title: 'Nhôm kính',
              subtitle: '5 dịch vụ',
            ),
            ServiceItem(
              icon: 'assets/images/tho.png',
              title: 'Cơ khí',
              subtitle: '6 dịch vụ',
            ),
            ServiceItem(
              icon: 'assets/images/tho.png',
              title: 'thiết bị gia dụng',
              subtitle: '0 dịch vụ',
            ),
            ServiceItem(
              icon: 'assets/images/tho.png',
              title: 'Sửa khóa',
              subtitle: '2 dịch vụ',
            ),
            ServiceItem(
              icon: 'assets/images/tho.png',
              title: 'Sửa xe',
              subtitle: '4 dịch vụ',
            ),
            ServiceItem(
              icon: 'assets/images/tho.png',
              title: 'Cửa cuốn',
              subtitle: '2 dịch vụ',
            ),
            ServiceItem(
              icon: 'assets/images/tho.png',
              title: 'Giúp việc nhà',
              subtitle: '6 dịch vụ',
            ),
          ],
        ),
      ),
    );
  }
}

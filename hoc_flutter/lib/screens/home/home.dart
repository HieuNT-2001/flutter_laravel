import 'package:flutter/material.dart';
import 'package:hoc_flutter/screens/home/benefit.dart';
import 'package:hoc_flutter/screens/home/campaign_banner.dart';
import 'package:hoc_flutter/screens/home/event.dart';
import 'package:hoc_flutter/screens/home/home_app_bar.dart';
import 'package:hoc_flutter/screens/home/home_bottom_bar.dart';
import 'package:hoc_flutter/screens/home/home_search_bar.dart';
import 'package:hoc_flutter/screens/home/list_service.dart';
import 'package:hoc_flutter/screens/home/news.dart';

class Home extends StatefulWidget {
  final String role;

  const Home({super.key, required this.role});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool isCustomer;

  void toggleSwitch(bool value) => setState(() => isCustomer = value);

  @override
  void initState() {
    super.initState();
    isCustomer = widget.role == "customer";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: isCustomer ? Colors.amber[200] : Colors.blue[900],
        foregroundColor: isCustomer ? Colors.black : Colors.white,
        toolbarHeight: 140,
        title: HomeAppBar(isCustomer: isCustomer, onChanged: toggleSwitch),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isCustomer) ...[
                const CampaignBanner(),
                const SizedBox(height: 16),
                HomeSearchBar(isCustomer: isCustomer),
                const SizedBox(height: 16),
                const ListService(),
              ],
              Event(isCustomer: isCustomer),
              const SizedBox(height: 16),
              const Benefit(),
              const SizedBox(height: 16),
              const News(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: HomeBottomBar(isCustomer: isCustomer),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hoc_flutter/demo/state/my_widget2_state.dart';

class MyWidget2 extends StatefulWidget {
  final bool loading;

  const MyWidget2(this.loading, {super.key});

  @override
  State<StatefulWidget> createState() {
    return MyWidget2State();
  }
}

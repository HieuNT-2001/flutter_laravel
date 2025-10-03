import 'package:flutter/material.dart';
import 'package:hoc_flutter/demo/widget/my_widget2.dart';

class MyWidget2State extends State<MyWidget2> {
  late bool _localLoading;

  @override
  void initState() {
    _localLoading = widget.loading;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _localLoading
        ? const CircularProgressIndicator()
        : FloatingActionButton(onPressed: onClickButton);
  }

  void onClickButton() {
    setState(() {
      _localLoading = !_localLoading;
    });
  }
}

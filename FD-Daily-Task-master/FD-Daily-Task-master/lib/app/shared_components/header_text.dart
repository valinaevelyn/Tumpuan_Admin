import 'package:daily_task/app/constans/app_constants.dart';
import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText(this.data, {Key? key}) : super(key: key);

  final String data;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        color: Color.fromRGBO(251, 111, 146, 1),
      ),
    );
  }
}

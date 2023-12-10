import 'package:daily_task/app/constans/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListTaskDateData {
  final DateTime date;
  final String label;
  final String jobdesk;

  const ListTaskDateData({
    required this.date,
    required this.label,
    required this.jobdesk,
  });
}

class ListTaskDate extends StatelessWidget {
  const ListTaskDate({
    required this.data,
    required this.onPressed,
    this.dividerColor,
    Key? key,
  }) : super(key: key);

  final ListTaskDateData data;
  final Function() onPressed;
  final Color? dividerColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(kBorderRadius),
      child: Padding(
        padding: const EdgeInsets.all(kSpacing / 2),
        child: Row(
          children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 26, vertical: 13),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(
                    color: kFontColorPallets[0],
                    width: 1,
                  ),
                ),
                child: _buildHours()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              // child: _buildDivider(),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                          color: kFontColorPallets[0],
                          width: 1,
                        ),
                      ),
                      child: _buildTitle()),
                  const SizedBox(height: 5),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                          color: kFontColorPallets[1],
                          width: 1,
                        ),
                      ),
                      child: _buildSubtitle()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHours() {
    return Text(
      DateFormat.Hm().format(data.date),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 3,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        gradient: LinearGradient(
          colors: [
            dividerColor ?? Colors.amber,
            dividerColor?.withOpacity(.6) ?? Colors.amber.withOpacity(.6),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      data.jobdesk,
      maxLines: 1,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        color: Color.fromRGBO(251, 111, 146, 1),
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubtitle() {
    return Text(
      data.label,
      maxLines: 1,
      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 8),
      overflow: TextOverflow.ellipsis,
    );
  }
}

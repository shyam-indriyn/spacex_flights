import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

class DateTimeTextWidget extends StatefulWidget {
  final DateTime dateTime;
  final TextStyle style;
  final bool tbd;
  final bool tentative;

  DateTimeTextWidget({this.dateTime, this.style, this.tbd, this.tentative});

  @override
  _DateTimeTextWidgetState createState() => _DateTimeTextWidgetState();
}

class _DateTimeTextWidgetState extends State<DateTimeTextWidget> {
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = this.widget.dateTime.toLocal();
    DateTime current = DateTime.now();

    if (current.isAfter(dateTime)) {
      return Text(
          widget.tbd
              ? 'TBD'
              : widget.tentative
                  ? 'Tentative'
                  : DateFormat.yMMMd().format(dateTime) +
                      "\n" +
                      DateFormat.Hms().format(dateTime),
          textAlign: TextAlign.right,
          style: widget.style);
    }

    return Text(
        DateFormat.yMMMd().format(dateTime) +
            "\n" +
            DateFormat.Hms().format(dateTime),
        textAlign: TextAlign.right,
        style: widget.style);
  }
}

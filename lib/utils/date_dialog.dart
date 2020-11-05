import 'package:flutter/material.dart';

void showDate(List<String> getDisabledDate, Color color, BuildContext context,
{Function selected}) {
  var selectedDate = DateTime.now();
  showDatePicker(
          selectableDayPredicate: (val) {
            int same = 0;
            if (getDisabledDate.length > 0)
              for (String date in getDisabledDate) {
                if (val.toString().split(" ")[0] == date) {
                  same++;
                  print(date);
                }
              }

            return same > 0 ? false : true;
          },
          context: context,
          initialDate:
              DateTime(selectedDate.year, selectedDate.month, selectedDate.day),
          builder: (BuildContext context, Widget child) {
            return Theme(
              data: ThemeData.light().copyWith(
                primaryColor: color,
                accentColor: color,
                colorScheme: ColorScheme.light(primary: color),
                buttonTheme:
                    ButtonThemeData(textTheme: ButtonTextTheme.primary),
              ),
              child: child,
            );
          },
          firstDate:
              DateTime(selectedDate.year, selectedDate.month, selectedDate.day),
          lastDate: DateTime(
              selectedDate.year, selectedDate.month + 1, selectedDate.day))
      .then((value) {
        selected('$value'.split(" ")[0].replaceAll('-', '/'));
      });
}


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {

 static String formatDate({required String date}) {
    DateTime dropDate = DateTime.parse(date);
    String dropMonth = DateFormat('MMM').format(dropDate);
    String dropDay = DateFormat('d').format(dropDate);
    String year = DateFormat('y').format(dropDate);

    return "$dropMonth $dropDay $year";
  }

 static String formatDateTime({required String date}) {
   DateTime parsedDate = DateTime.parse(date);
   String formattedTime = DateFormat('hh:mm a').format(parsedDate);
   return formattedTime;
 }

 static String formatTime(TimeOfDay time) {
   final now = DateTime.now();
   final parsedTime = DateTime(now.year, now.month, now.day, time.hour, time.minute);
   return DateFormat('hh:mm a').format(parsedTime);  // Formats time to "12:00 AM"
 }

 static String formatDamageDate(String dateString) {
   DateTime date = DateTime.parse(dateString);
   String formattedDate = DateFormat('EEE MMMM d yyyy').format(date);
   return formattedDate;
 }

}


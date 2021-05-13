import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDate(String date) {
    var inputDate;

    try {
      var inputFormat = DateFormat('yyyy-MM-dd');
      inputDate = inputFormat.parse(date);

      var outputFormat = DateFormat('MMM dd,yyyy');
      var outputDate = outputFormat.format(inputDate);
      return outputDate.toUpperCase();
    } catch (e) {
      print("DATE :: " + date.toString());
      return "NA";
    }
  }
}

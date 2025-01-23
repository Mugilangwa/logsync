
 import 'package:intl/intl.dart';

// ignore: constant_identifier_names
const String API_BASE_URL = "http://softmaxafrica-001-site2.otempurl.com/api/";
const String GOOGLE_API_KEY ="AIzaSyBtyb_hRlQoEhe1aJMEbKL02JvFTIC6kI4";
class Functions {
  static String formatDateTime(String dateTime) {
    try {
      DateTime parsedDateTime = DateTime.parse(dateTime);
      return DateFormat('yyyy-MM-dd HH:mm').format(parsedDateTime);
    } catch (e) {
      return "Error in changing date format";
    }
  }
  
}

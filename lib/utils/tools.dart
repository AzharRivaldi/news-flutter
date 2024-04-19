import 'package:intl/intl.dart';

//convert date time
class SetDate {
  static String setDate(String strDate) {
    var inputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    var inputDate = inputFormat.parse(strDate);
    var outputFormat = DateFormat("d MMMM yyyy");
    var outputDate = outputFormat.format(inputDate);

    return outputDate;
  }
}

//convert date time ago
class TimeAgo {
  static String setTimeAgo(String dateTime) {
    DateTime input = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(dateTime, true);
    Duration diff = DateTime.now().difference(input);

    if (diff.inDays >= 1) {
      return '${diff.inDays} day${diff.inDays == 1 ? '' : 's'} ago';
    } else if (diff.inHours >= 1) {
      return '${diff.inHours} hour${diff.inHours == 1 ? '' : 's'} ago';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes} minute${diff.inMinutes == 1 ? '' : 's'} ago';
    } else if (diff.inSeconds >= 1) {
      return '${diff.inSeconds} second${diff.inSeconds == 1 ? '' : 's'} ago';
    } else {
      return 'just now';
    }
  }
}

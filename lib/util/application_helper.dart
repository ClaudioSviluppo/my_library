import 'package:my_library/globals.dart' as globals;
import 'dart:developer' as developer;

class ApplicationHelper {
  // print("Helper 1 HashCode: ${helper.hashCode}");
  static debug(String msg, String context) {
    if (globals.log == true) {
      if (globals.printConsole == true) {
        print(msg);
      }

      if (globals.printDeveloper == true) {
        developer.log(msg, name: context);
      }
    }
  }
}

import 'dart:developer' as developer;
import 'package:my_library/globals.dart' as globals;

class AppHelper {
  Future logger(String message, String context) async {
    if (globals.log == true) {
      developer.log(message, name: context);
    } else {
      developer.log('**********************************', name: context);
    }
  }
}

class AppHelper2 {
  //Genera una istanza singleton di una classe
  static final AppHelper2 _instance = AppHelper2._internal();

  factory AppHelper2() {
    return _instance;
  }

  //Creo Singleton
  AppHelper2._internal();

  Future logger(String message, String context) async {
    if (globals.log == true) {
      developer.log(message, name: context);
    }
  }
}

class MyLog {
  late String msg;
  late String context;
//Genera una istanza singleton di una classe
  static final MyLog _instance = MyLog._internal();
  factory MyLog({msg, context}) {
    _instance.msg = msg;
    _instance.context = context;
    return _instance;
  }
  MyLog._internal();
}

stampa(MyLog instance) {
  if (globals.log == true) {
    print("$instance : ${instance.hashCode}");
    print(instance.msg);
  }
}

/*
    Template per ottenere una istanza Singleton
    se stampop l'hashcode delle istanze f e f1, vedo che è il medesimo
    perchè viene sempre recuperata l'istanza esistente
*/

void main(List<String> args) {
  print(Log(msg: 'AAA', context: 'BBB'));
  final f = Log(msg: 'AAA', context: 'BBB');
  final f1 = Log(msg: 'AAA', context: 'BBB');
  print(f.hashCode);
  print(f1.hashCode);

  scrivi(Log(msg: 'XXX', context: 'YYY'));
}

class Log {
  late String msg;
  late String context;
//Genera una istanza singleton di una classe
  static final Log _instance = Log._internal();
  factory Log({msg, context}) {
    _instance.msg = msg;
    _instance.context = context;
    return _instance;
  }
  Log._internal();
}

scrivi(Log instance) {
  print(instance.msg);
}

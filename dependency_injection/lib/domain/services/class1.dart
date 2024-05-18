import 'package:dependency_injection/domain/services/abstract/class1.dart';
import 'package:dependency_injection/utils/strings.dart';

class Class1Iplm implements Class1 {
  @override
  String callFromClass2() {
    return returnFromClass1ToClass2;
  }
}

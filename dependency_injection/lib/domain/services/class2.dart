import 'package:dependency_injection/domain/services/abstract/class1.dart';
import 'package:dependency_injection/domain/services/abstract/class2.dart';

class Class2Impl implements Class2 {
  Class1 class1;
  Class2Impl(this.class1);

  @override
  String callClass1() {
    return class1.callFromClass2();
  }
}

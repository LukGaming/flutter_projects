import 'package:dependency_injection/dependencies/injector.dart';
import 'package:dependency_injection/domain/services/abstract/class2.dart';
import 'package:dependency_injection/domain/services/class2.dart';
import 'package:dependency_injection/utils/strings.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dependency_injection/dependencies/locator.dart';

void main() {
  group("Should create instances from class1 and class2", () {
    myOwnLocator();
    var _class2 = MyOwnInjector().instance<Class2>();

    test("Should Class2 call Class1",
        () => expect(_class2.callClass1(), returnFromClass1ToClass2));
  });
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:locator/locator.dart' as locator;

void main(List<String> arguments) {
  print(Class1.new.runtimeType);

  var class1 = Function.apply(
    Class1.new,
    [],
    {#message: 'Mensagem'},
  );

  print(class1.message);
}

class Class1 {
  String message;
  Class1({
    required this.message,
  });
}

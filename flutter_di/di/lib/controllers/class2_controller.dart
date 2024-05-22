import 'package:di/controllers/class1_controller.dart';
import 'package:di/repositories/http_request.dart';

class ClassController2 {
  final ClassController1 controller1;
  final HttpRequestImp httpRequest;

  ClassController2({
    required this.controller1,
    required this.httpRequest,
  });
}

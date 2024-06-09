import 'package:flutter_riverpod/flutter_riverpod.dart';

final namesProvider = StreamProvider<List<String>>((ref) async* {
  List<String> names = [];
  for (int i = 0; i < 1000; i++) {
    names.add("StreamValue: $i");
    await Future.delayed(const Duration(seconds: 1));
    if (i == 100) {
      throw Exception("Erro ao recuperar dados");
    }
    yield names;
  }
});

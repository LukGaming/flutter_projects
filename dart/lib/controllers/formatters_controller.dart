import 'package:chuva_dart/models/people_model.dart';

class FormattersController {
  String formatterPeoples(List<PeopleModel>? peoples) {
    String authorsString = '';
    if (peoples != null && peoples.isNotEmpty) {
      for (int i = 0; i < peoples.length; i++) {
        authorsString += peoples[i].name;
        if (i != peoples.length - 1) {
          authorsString += ', ';
        }
      }
    }

    return authorsString;
  }

  String formaterDateOfActivity(String type, DateTime dateStart, DateTime dateEnd) {
    String hourStart = '${dateStart.hour.toString().padLeft(2, '0')}:${dateStart.minute.toString().padLeft(2, '0')}';
    String hourEnd = '${dateEnd.hour.toString().padLeft(2, '0')}:${dateEnd.minute.toString().padLeft(2, '0')}';

    return '$type de $hourStart até $hourEnd';
  }
}

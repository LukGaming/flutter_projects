import 'package:gallery_app/controllers/gallery_controller.dart';
import 'package:get_it/get_it.dart';

void injector() {
  GetIt i = GetIt.instance;

  i.registerLazySingleton(
    () => GalleryController(),
  );
}

import 'package:flutter/material.dart';
import 'package:gallery_app/controllers/gallery_controller.dart';
import 'package:gallery_app/widgets/create_new_gallery_item.dart';
import 'package:get_it/get_it.dart';

class AddFloatingActionButton extends StatelessWidget {
  AddFloatingActionButton({
    super.key,
  });
  final _galleryController = GetIt.instance<GalleryController>();
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _galleryController,
      builder: (_, __) {
        return _galleryController.isLoading
            ? Container()
            : FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CreateGalleryItemWidget(),
                  ));
                },
                child: const Icon(Icons.add),
              );
      },
    );
  }
}

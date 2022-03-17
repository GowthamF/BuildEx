import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Carousel extends StatefulWidget {
  final List<String> uploadedImageUrls;
  final bool isAddPhoto;
  const Carousel({
    Key? key,
    required this.uploadedImageUrls,
    this.isAddPhoto = true,
  }) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final PageController controller = PageController();
  final ImagePicker _picker = ImagePicker();
  File? selectedFile;
  List<File> files = [];
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      clipBehavior: Clip.antiAlias,
      children: [
        PageView.builder(
          itemBuilder: (context, pageNumber) {
            if (widget.isAddPhoto && pageNumber == files.length) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(child: Text('Select a photo')),
                  IconButton(
                    onPressed: () async {
                      XFile? photo =
                          await _picker.pickImage(source: ImageSource.gallery);
                      if (photo != null) {
                        selectedFile = File(photo.path);
                        setState(() {
                          files.add(selectedFile!);
                        });
                      }
                    },
                    icon: const Icon(Icons.add_photo_alternate_rounded),
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                  )
                ],
              );
            }

            return Column(
              children: [
                Expanded(
                  child: Image.file(
                    files[pageNumber],
                  ),
                ),
              ],
            );
          },
          // itemCount: widget.isAddPhoto
          //     ? widget.uploadedImageUrls.length + 1
          //     : widget.uploadedImageUrls.length,
          itemCount: widget.isAddPhoto ? files.length + 1 : files.length,
          controller: controller,
        ),
        Align(
          child: IconButton(
              onPressed: () {
                if (controller.page!.round() != 0) {
                  controller.previousPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn);
                }
              },
              icon: const Icon(Icons.chevron_left)),
          alignment: Alignment.centerLeft,
        ),
        Align(
          child: IconButton(
              onPressed: () {
                if (controller.page!.round() !=
                    widget.uploadedImageUrls.length) {
                  controller.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn);
                }
              },
              icon: const Icon(Icons.chevron_right)),
          alignment: Alignment.centerRight,
        ),
      ],
    );
  }
}

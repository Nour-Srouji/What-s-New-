import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerHelper extends StatefulWidget {
  final void Function(String path) onSelected;

  const ImagePickerHelper({Key? key, required this.onSelected})
      : super(key: key);

  @override
  State<ImagePickerHelper> createState() => _ImagePickerHelperState();
}

class _ImagePickerHelperState extends State<ImagePickerHelper> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.camera),
      onPressed: () {
        _pickImage();
      },
    );
  }

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      widget.onSelected(pickedImage.path);
    }
  }
}

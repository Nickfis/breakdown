import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ImagePickerWidget extends StatefulWidget {
  final Function(File) onImagePicked;

  const ImagePickerWidget({Key? key, required this.onImagePicked})
      : super(key: key);

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _imageFile;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);

      final directory = await getApplicationDocumentsDirectory();
      final fileName = basename(imageFile.path);
      final savedImage = await imageFile.copy('${directory.path}/$fileName');

      setState(() {
        _imageFile = savedImage;
      });

      widget.onImagePicked(savedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        width: 266,
        height: 150,
        decoration: BoxDecoration(
          color: const Color.fromARGB(138, 182, 198, 163),
          image: _imageFile != null
              ? DecorationImage(
                  image: FileImage(_imageFile!),
                  fit: BoxFit.cover,
                )
              : null,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(12),
        ),
        child: _imageFile == null
            ? Icon(Icons.add_a_photo, color: Colors.grey[800])
            : null,
      ),
    );
  }
}

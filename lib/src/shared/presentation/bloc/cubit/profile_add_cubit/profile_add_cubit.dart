import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImageState {
  final XFile? imageFile;

  ImageState({this.imageFile});
}

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageState());

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      emit(ImageState(imageFile: pickedImage));
    }
  }

  void clearImage() {
    emit(ImageState(imageFile: null));
  }
}
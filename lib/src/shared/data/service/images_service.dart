
import 'package:firebase_storage/firebase_storage.dart';

class ImagesService {
  Future<String> getImageUrl(String imagePath) async {
  Reference ref = FirebaseStorage.instance.ref().child(imagePath);
  return await ref.getDownloadURL();
}
}
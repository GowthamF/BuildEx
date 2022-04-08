// import 'dart:io';

// import 'package:buildex/models/models.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:uuid/uuid.dart';
// import 'package:buildex/exceptions/exceptions.dart';

// class FileService {
//   Future<FileModel> uploadFile(String path, String folder) async {
//     File file = File(path);

//     try {
//       String imageType = path.split(".").last;
//       var uuid = const Uuid();
//       var uploadTask = await FirebaseStorage.instance
//           .ref('images/$folder/${uuid.v4()}$imageType')
//           .putFile(file);
//       var downloadUrl = await uploadTask.ref.getDownloadURL();
//       return FileModel(downloadUrl, uploadTask.ref.fullPath);
//     } on FirebaseException catch (e) {
//       throw ReportToUserException(message: e.message!);
//     }
//   }

//   Future<void> deleteFile(String path) async {
//     try {
//       await FirebaseStorage.instance.ref(path).delete();
//     } on FirebaseException catch (e) {
//       throw ReportToUserException(message: e.message!);
//     }
//   }
// }

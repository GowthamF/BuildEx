// import 'package:buildex/exceptions/exceptions.dart';
// import 'package:buildex/models/models.dart';
// import 'package:buildex/repositories/repositories.dart';
// import 'package:equatable/equatable.dart';
// import 'package:bloc/bloc.dart';
// part 'file_event.dart';
// part 'file_state.dart';

// class FileBloc extends Bloc<FileEvent, FileState> {
//   final FileRepository fileRepository;
//   FileBloc(this.fileRepository) : super(const FileInitial()) {
//     on<DeleteFile>(_onDeleteFile);
//     on<UploadFile>(_onUploadFile);
//   }

//   Future<void> _onDeleteFile(DeleteFile event, Emitter<FileState> emit) async {
//     try {
//       emit(const FileDeleting());
//       await fileRepository.deleteFile(event.path);
//     } on ReportToUserException catch (e) {
//       emit(FileError(e.message));
//     }
//   }

//   Future<void> _onUploadFile(UploadFile event, Emitter<FileState> emit) async {
//     try {
//       emit(FileUploading());
//       var file = await fileRepository.uploadFile(event.path, event.folder);
//       emit(FileUploaded(file));
//     } on ReportToUserException catch (e) {
//       emit(FileError(e.message));
//     }
//   }
// }

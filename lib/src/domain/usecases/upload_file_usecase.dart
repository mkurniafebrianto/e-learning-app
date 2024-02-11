import 'dart:typed_data';

import 'package:e_learning/src/data/repositories/auth_repository.dart';
import 'package:e_learning/src/domain/usecases/usecase.dart';

class UploadFileUseCase implements UseCase<String?, UploadFileParams> {
  final AuthRepository repository;

  UploadFileUseCase(this.repository);

  @override
  Future<String?> call(params) async {
    return await repository.uploadFile(
        fileName: params.fileName, fileByte: params.fileByte);
  }
}

class UploadFileParams {
  final String fileName;
  final Uint8List fileByte;

  UploadFileParams({required this.fileName, required this.fileByte});
}

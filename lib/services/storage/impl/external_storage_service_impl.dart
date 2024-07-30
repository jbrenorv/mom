import 'package:file_picker/file_picker.dart';

import '../external_storage_service.dart';

class ExternalStorageServiceImpl implements ExternalStorageService {
  ExternalStorageServiceImpl(this._filePicker);
  
  final FilePicker _filePicker;

  @override
  Future<String?> getDirectory() {
    return _filePicker.getDirectoryPath();
  }
}

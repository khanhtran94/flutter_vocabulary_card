import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class AudioStorageService {
  Future<String> saveAudioFile({
    required List<int> bytes,
    required String fileName,
  }) async {
    final documents = await getApplicationDocumentsDirectory();
    final audioDirectory = Directory(path.join(documents.path, 'audio'));
    await audioDirectory.create(recursive: true);
    final safeName = path.basename(fileName);
    final file = File(path.join(audioDirectory.path, safeName));
    await file.writeAsBytes(bytes, flush: true);
    return file.path;
  }

  Future<bool> audioFileExists(String filePath) => File(filePath).exists();

  Future<void> deleteAudioFile(String filePath) async {
    final file = File(filePath);
    if (await file.exists()) {
      await file.delete();
    }
  }
}

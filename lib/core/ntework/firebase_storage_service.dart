// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:path/path.dart' as path;

// /// Custom exceptions for Firebase Storage
// class StorageException implements Exception {
//   final String message;
//   final String? code;

//   StorageException(this.message, {this.code});

//   @override
//   String toString() => 'StorageException: $message${code != null ? ' (Code: $code)' : ''}';
// }

// class FirebaseStorageService {
//   FirebaseStorageService._();

//   static final FirebaseStorageService instance = FirebaseStorageService._();

//   final FirebaseStorage _storage = FirebaseStorage.instance;

//   // ── Upload File ───────────────────────────────────────────────────────────────

//   /// Upload file to Firebase Storage
//   Future<String> uploadFile({
//     required File file,
//     required String path,
//     void Function(double progress)? onProgress,
//   }) async {
//     try {
//       final ref = _storage.ref().child(path);
//       final uploadTask = ref.putFile(file);

//       // Monitor upload progress
//       if (onProgress != null) {
//         uploadTask.snapshotEvents.listen((event) {
//           final progress = event.bytesTransferred / event.totalBytes;
//           onProgress(progress);
//         });
//       }

//       final snapshot = await uploadTask;
//       return await snapshot.ref.getDownloadURL();
//     } on FirebaseException catch (e) {
//       throw StorageException('Failed to upload file: ${e.message}', code: e.code);
//     } catch (e) {
//       throw StorageException('Failed to upload file: $e');
//     }
//   }

//   /// Upload data (bytes) to Firebase Storage
//   Future<String> uploadData({
//     required List<int> data,
//     required String path,
//     String contentType = 'application/octet-stream',
//     void Function(double progress)? onProgress,
//   }) async {
//     try {
//       final ref = _storage.ref().child(path);
//       final uploadTask = ref.putData(
//         data,
//         SettableMetadata(contentType: contentType),
//       );

//       // Monitor upload progress
//       if (onProgress != null) {
//         uploadTask.snapshotEvents.listen((event) {
//           final progress = event.bytesTransferred / event.totalBytes;
//           onProgress(progress);
//         });
//       }

//       final snapshot = await uploadTask;
//       return await snapshot.ref.getDownloadURL();
//     } on FirebaseException catch (e) {
//       throw StorageException('Failed to upload data: ${e.message}', code: e.code);
//     } catch (e) {
//       throw StorageException('Failed to upload data: $e');
//     }
//   }

//   // ── Download File ─────────────────────────────────────────────────────────────

//   /// Get download URL for a file
//   Future<String> getDownloadURL(String path) async {
//     try {
//       return await _storage.ref().child(path).getDownloadURL();
//     } on FirebaseException catch (e) {
//       throw StorageException('Failed to get download URL: ${e.message}', code: e.code);
//     } catch (e) {
//       throw StorageException('Failed to get download URL: $e');
//     }
//   }

//   /// Download file to local path
//   Future<void> downloadFile({
//     required String remotePath,
//     required String localPath,
//     void Function(double progress)? onProgress,
//   }) async {
//     try {
//       final ref = _storage.ref().child(remotePath);
//       final downloadTask = ref.writeToFile(File(localPath));

//       // Monitor download progress
//       if (onProgress != null) {
//         downloadTask.snapshotEvents.listen((event) {
//           final progress = event.bytesTransferred / event.totalBytes;
//           onProgress(progress);
//         });
//       }

//       await downloadTask;
//     } on FirebaseException catch (e) {
//       throw StorageException('Failed to download file: ${e.message}', code: e.code);
//     } catch (e) {
//       throw StorageException('Failed to download file: $e');
//     }
//   }

//   // ── Delete File ───────────────────────────────────────────────────────────────

//   /// Delete file from Firebase Storage
//   Future<void> deleteFile(String path) async {
//     try {
//       await _storage.ref().child(path).delete();
//     } on FirebaseException catch (e) {
//       throw StorageException('Failed to delete file: ${e.message}', code: e.code);
//     } catch (e) {
//       throw StorageException('Failed to delete file: $e');
//     }
//   }

//   // ── List Files ────────────────────────────────────────────────────────────────

//   /// List all files in a directory
//   Future<List<Reference>> listFiles(String directory) async {
//     try {
//       final result = await _storage.ref().child(directory).listAll();
//       return result.items;
//     } on FirebaseException catch (e) {
//       throw StorageException('Failed to list files: ${e.message}', code: e.code);
//     } catch (e) {
//       throw StorageException('Failed to list files: $e');
//     }
//   }

//   /// List all files with metadata
//   Future<List<FullMetadata>> listFilesWithMetadata(String directory) async {
//     try {
//       final refs = await listFiles(directory);
//       final metadata = await Future.wait(
//         refs.map((ref) => ref.getMetadata()),
//       );
//       return metadata;
//     } on FirebaseException catch (e) {
//       throw StorageException('Failed to list files with metadata: ${e.message}', code: e.code);
//     } catch (e) {
//       throw StorageException('Failed to list files with metadata: $e');
//     }
//   }

//   // ── Profile Pictures ──────────────────────────────────────────────────────────

//   /// Upload profile picture
//   Future<String> uploadProfilePicture({
//     required File imageFile,
//     required String userId,
//     void Function(double progress)? onProgress,
//   }) async {
//     final fileName = '${DateTime.now().millisecondsSinceEpoch}_${path.basename(imageFile.path)}';
//     final path = 'profile_pictures/$userId/$fileName';

//     return uploadFile(
//       file: imageFile,
//       path: path,
//       onProgress: onProgress,
//     );
//   }

//   /// Delete old profile picture
//   Future<void> deleteProfilePicture(String url) async {
//     try {
//       // Extract path from URL
//       final uri = Uri.parse(url);
//       final pathSegments = uri.pathSegments;
//       final path = pathSegments.sublist(pathSegments.indexOf('profile_pictures')).join('/');

//       await deleteFile(path);
//     } catch (e) {
//       // Ignore errors when deleting old profile pictures
//       print('Warning: Could not delete old profile picture: $e');
//     }
//   }

//   // ── Book Images ───────────────────────────────────────────────────────────────

//   /// Upload book image
//   Future<String> uploadBookImage({
//     required File imageFile,
//     required String bookId,
//     void Function(double progress)? onProgress,
//   }) async {
//     final fileName = '${DateTime.now().millisecondsSinceEpoch}_${path.basename(imageFile.path)}';
//     final path = 'book_images/$bookId/$fileName';

//     return uploadFile(
//       file: imageFile,
//       path: path,
//       onProgress: onProgress,
//     );
//   }

//   /// Upload multiple book images
//   Future<List<String>> uploadBookImages({
//     required List<File> imageFiles,
//     required String bookId,
//     void Function(double progress)? onProgress,
//   }) async {
//     final urls = <String>[];
//     var totalProgress = 0.0;

//     for (var i = 0; i < imageFiles.length; i++) {
//       final url = await uploadBookImage(
//         imageFile: imageFiles[i],
//         bookId: bookId,
//         onProgress: (progress) {
//           final currentProgress = (i + progress) / imageFiles.length;
//           if (onProgress != null && currentProgress > totalProgress) {
//             totalProgress = currentProgress;
//             onProgress(totalProgress);
//           }
//         },
//       );
//       urls.add(url);
//     }

//     return urls;
//   }

//   // ── Utility Methods ───────────────────────────────────────────────────────────

//   /// Get Firebase Storage instance for advanced operations
//   FirebaseStorage get storage => _storage;

//   /// Generate unique file name
//   String generateUniqueFileName(String originalName) {
//     final extension = path.extension(originalName);
//     final timestamp = DateTime.now().millisecondsSinceEpoch;
//     return '${timestamp}_$originalName';
//   }

//   /// Get file size
//   Future<int> getFileSize(String path) async {
//     try {
//       final metadata = await _storage.ref().child(path).getMetadata();
//       return metadata.size ?? 0;
//     } catch (e) {
//       return 0;
//     }
//   }

//   /// Check if file exists
//   Future<bool> fileExists(String path) async {
//     try {
//       await _storage.ref().child(path).getDownloadURL();
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
// }
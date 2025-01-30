// // ignore_for_file: unused_element

// import 'package:dio/dio.dart';

// void _sendAudioToBackend(String filePath) async {
//   FormData formData = FormData.fromMap({
//     'file': await MultipartFile.fromFile(filePath, filename: 'audio.aac'),
//   });

//   Dio dio = Dio();
//   try {
//     Response response = await dio.post('http://yourbackend.com/upload', data: formData);
//     if (response.statusCode == 200) {
//       print('Audio sent successfully');
//     } else {
//       print('Failed to send audio');
//     }
//   } catch (e) {
//     print('Error sending audio: $e');
//   }
// }
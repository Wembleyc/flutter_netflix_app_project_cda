import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatGptService {
  final String apiKey;
  final String endpoint =
      'https://api.openai.com/v1/engines/text-davinci-003/completions';

  ChatGptService(this.apiKey);

  Future<String> getChatGptResponse(String input) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    final body = jsonEncode({
      'prompt': input,
      'max_tokens': 400,
    });

    final response =
        await http.post(Uri.parse(endpoint), headers: headers, body: body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['choices'][0]['text'];
    } else {
      throw Exception('Failed to get response from ChatGPT');
    }
  }
}

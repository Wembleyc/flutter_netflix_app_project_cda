import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatGptSdk extends StatefulWidget {
  @override
  State<ChatGptSdk> createState() => _ChatGptSdkState();
}

class _ChatGptSdkState extends State<ChatGptSdk> {
  final _formKey = GlobalKey<FormState>();
  final textEditingController = TextEditingController();
  var chatGptService;
  String results = 'Voir le résultat';

  @override
  void initState() {
    chatGptService = ChatGptService(
        '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'); // Replace with your actual API key
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  chatGptText(String text) async {
    try {
      final response = await chatGptService.getChatGptResponse(text);
      setState(() {
        results = response;
      });
    } catch (e) {
      setState(() {
        results = 'Error occurred: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ChatGptSdk')),
      body: Center(
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(30),
                    child: Text(
                      results,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      child: TextFormField(
                        controller: textEditingController,
                        decoration: InputDecoration(
                          labelText: 'Saisie chatGpt',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'S\'il vous plaît entrez un texte';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            chatGptText(textEditingController.value.text);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Données en cours')),
                            );
                          }
                        },
                        child: const Text('Envoyer'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
      'max_tokens': 200,
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

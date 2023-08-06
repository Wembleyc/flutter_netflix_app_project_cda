import 'package:flutter/material.dart';
import 'package:netflix/chatGPT_API.dart';
import 'package:html_unescape/html_unescape.dart';

class ChatGptPage extends StatefulWidget {
  @override
  _ChatGptPageState createState() => _ChatGptPageState();
}

class _ChatGptPageState extends State<ChatGptPage> {
  final TextEditingController _textEditingController = TextEditingController();
  List<ChatMessage> _chatMessages = [];
  final ChatGptService chatGptService =
      ChatGptService('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');

  final HtmlUnescape _htmlUnescape = HtmlUnescape();

  void _addUserMessage(String text) {
    setState(() {
      _chatMessages.insert(
        0,
        ChatMessage(
          text: text,
          isUserMessage: true,
        ),
      );
    });
  }

  void _addBotMessage(String text) {
    setState(() {
      _chatMessages.insert(
        0,
        ChatMessage(
          text: _htmlUnescape
              .convert(text), // Convertir les séquences d'échappement HTML
          isUserMessage: false,
        ),
      );
    });
  }

  void _sendChatGptRequest() async {
    String userQuery = _textEditingController.text;
    _textEditingController.clear();
    _addUserMessage(userQuery);

    try {
      String response = await chatGptService.getChatGptResponse(userQuery);
      _addBotMessage(response);
    } catch (e) {
      _addBotMessage('Erreur : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat avec ChatGPT')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true, // Les messages récents sont en bas
              itemCount: _chatMessages.length,
              itemBuilder: (context, index) {
                return _buildChatMessage(_chatMessages[index]);
              },
            ),
          ),
          Divider(
              height:
                  1), // Ligne de séparation pour simuler une barre de saisie
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    onSubmitted: (_) => _sendChatGptRequest(),
                    decoration: InputDecoration(
                      hintText: 'Écrivez un message...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendChatGptRequest,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatMessage(ChatMessage message) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      alignment:
          message.isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: message.isUserMessage ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          message.text,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUserMessage;

  ChatMessage({required this.text, required this.isUserMessage});
}

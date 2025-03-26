import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];
  bool _isTyping = false;

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    setState(() {
      _messages.add(
        ChatMessage(
          text: _messageController.text,
          isUser: true,
        ),
      );
      _isTyping = true;
    });

    final userMessage = _messageController.text;
    _messageController.clear();

    // Simulate AI response after a delay
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isTyping = false;
        _messages.add(
          ChatMessage(
            text: _getAIResponse(userMessage),
            isUser: false,
          ),
        );
      });
    });
  }

  String _getAIResponse(String userMessage) {
    // This is a placeholder for actual AI response logic
    // In a real app, this would call an API or local AI model
    userMessage = userMessage.toLowerCase();
    if (userMessage.contains('hello') || userMessage.contains('hi')) {
      return "Hello! I'm AIWell, your mental health companion. How are you feeling today?";
    } else if (userMessage.contains('sad') || userMessage.contains('depressed')) {
      return "I'm sorry to hear that you're feeling down. Would you like to talk about what's troubling you? Remember that sharing your feelings can be a helpful first step.";
    } else if (userMessage.contains('anxious') || userMessage.contains('anxiety')) {
      return "Anxiety can be challenging. Let's try a simple breathing exercise: breathe in for 4 counts, hold for 4, and exhale for 6. Would you like to explore more techniques?";
    } else if (userMessage.contains('thank')) {
      return "You're welcome! I'm here to support you whenever you need someone to talk to.";
    } else {
      return "I'm here to listen and support you. Feel free to share more about what's on your mind, or we can explore some wellness techniques together.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with AIWell'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_border),
            onPressed: () {
              // Save chat functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Chat saved to library')),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              reverse: false,
              itemBuilder: (context, index) {
                return _messages[index];
              },
            ),
          ),
          if (_isTyping)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('AIWell is typing...'),
                ],
              ),
            ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;

  const ChatMessage({
    super.key,
    required this.text,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser)
            CircleAvatar(
              backgroundColor: Colors.blue.shade200,
              child: const Text('AI'),
            ),
          const SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isUser ? Colors.blue.shade100 : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(text),
            ),
          ),
          const SizedBox(width: 8),
          if (isUser)
            const CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('You'),
            ),
        ],
      ),
    );
  }
} 
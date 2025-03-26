import 'package:flutter/material.dart';
import 'package:my_flutter_app/screens/chat_library_page.dart';

class ChatHistoryPage extends StatelessWidget {
  const ChatHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatCategory category =
        ModalRoute.of(context)!.settings.arguments as ChatCategory;

    // Sample data for saved chats
    final List<SavedChat> savedChats = [
      SavedChat(
        id: '1',
        title: 'Managing Panic Attacks',
        preview: 'Techniques for calming down during a panic attack...',
        date: DateTime.now().subtract(const Duration(days: 2)),
      ),
      SavedChat(
        id: '2',
        title: 'Deep Breathing Techniques',
        preview: 'Practice 4-7-8 breathing method for relaxation...',
        date: DateTime.now().subtract(const Duration(days: 5)),
      ),
      SavedChat(
        id: '3',
        title: 'Overcoming Social Anxiety',
        preview: 'Steps to gradually face social situations...',
        date: DateTime.now().subtract(const Duration(days: 7)),
      ),
      SavedChat(
        id: '4',
        title: 'Preventing Burnout',
        preview: 'Recognizing the signs of burnout and ways to prevent it...',
        date: DateTime.now().subtract(const Duration(days: 10)),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: savedChats.length,
        itemBuilder: (context, index) {
          final chat = savedChats[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              onTap: () {
                // View saved chat functionality - would navigate to a read-only chat view
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Viewing chat: ${chat.title}')),
                );
              },
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            chat.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          _formatDate(chat.date),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      chat.preview,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.share, size: 20),
                          onPressed: () {
                            // Share functionality
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Share functionality coming soon')),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete_outline, size: 20),
                          onPressed: () {
                            // Delete functionality
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Delete functionality coming soon')),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

class SavedChat {
  final String id;
  final String title;
  final String preview;
  final DateTime date;

  SavedChat({
    required this.id,
    required this.title,
    required this.preview,
    required this.date,
  });
} 
import 'package:flutter/material.dart';

class ChatLibraryPage extends StatelessWidget {
  const ChatLibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for chat categories
    final List<ChatCategory> categories = [
      ChatCategory(
        id: '1',
        name: 'Anxiety Management',
        description: 'Techniques and conversations about managing anxiety',
        color: Colors.blue.shade100,
        icon: Icons.healing,
        chatCount: 5,
      ),
      ChatCategory(
        id: '2',
        name: 'Mood Improvement',
        description: 'Strategies for improving mood and emotional well-being',
        color: Colors.green.shade100,
        icon: Icons.sentiment_satisfied_alt,
        chatCount: 3,
      ),
      ChatCategory(
        id: '3',
        name: 'Sleep Better',
        description: 'Tips and techniques for better sleep quality',
        color: Colors.purple.shade100,
        icon: Icons.nightlight_round,
        chatCount: 2,
      ),
      ChatCategory(
        id: '4',
        name: 'Stress Relief',
        description: 'Stress management and relaxation techniques',
        color: Colors.orange.shade100,
        icon: Icons.spa,
        chatCount: 4,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Library'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/chat-history',
                  arguments: category,
                );
              },
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: category.color,
                      radius: 24,
                      child: Icon(
                        category.icon,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            category.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            category.description,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${category.chatCount} saved chats',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Create a new category functionality
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text('Create New Category'),
              content: Text('This feature will be implemented later.'),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ChatCategory {
  final String id;
  final String name;
  final String description;
  final Color color;
  final IconData icon;
  final int chatCount;

  ChatCategory({
    required this.id,
    required this.name,
    required this.description,
    required this.color,
    required this.icon,
    required this.chatCount,
  });
} 
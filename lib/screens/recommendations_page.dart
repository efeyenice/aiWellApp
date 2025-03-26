import 'package:flutter/material.dart';

class RecommendationsPage extends StatefulWidget {
  const RecommendationsPage({super.key});

  @override
  State<RecommendationsPage> createState() => _RecommendationsPageState();
}

class _RecommendationsPageState extends State<RecommendationsPage> {
  // Sample recommendation data
  final List<Recommendation> _recommendations = [
    Recommendation(
      id: '1',
      title: 'Morning Meditation',
      description:
          'Start your day with a 5-minute meditation to set a positive tone for the day ahead. Focus on your breathing and set an intention for the day.',
      category: 'Mindfulness',
      icon: Icons.self_improvement,
      color: Colors.blue.shade100,
    ),
    Recommendation(
      id: '2',
      title: 'Digital Detox',
      description:
          'Take a 30-minute break from screens today. Instead, go for a walk, read a book, or simply sit in silence. Notice how this affects your mood.',
      category: 'Lifestyle',
      icon: Icons.phone_android,
      color: Colors.green.shade100,
    ),
    Recommendation(
      id: '3',
      title: 'Gratitude Exercise',
      description:
          'Write down three things you\'re grateful for today. Reflecting on gratitude has been shown to increase happiness and reduce depression.',
      category: 'Positive Psychology',
      icon: Icons.favorite,
      color: Colors.red.shade100,
    ),
    Recommendation(
      id: '4',
      title: 'Deep Breathing',
      description:
          'Practice the 4-7-8 breathing technique: Inhale for 4 seconds, hold for 7 seconds, exhale for 8 seconds. Repeat 4 times. This can help reduce anxiety and stress.',
      category: 'Stress Management',
      icon: Icons.air,
      color: Colors.purple.shade100,
    ),
    Recommendation(
      id: '5',
      title: 'Connect with Someone',
      description:
          'Reach out to a friend or family member you haven\'t spoken to in a while. Social connections are vital for mental well-being.',
      category: 'Social Connection',
      icon: Icons.people,
      color: Colors.orange.shade100,
    ),
  ];

  // Track which recommendations are expanded
  final Set<String> _expandedIds = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Recommendations'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _recommendations.length,
        itemBuilder: (context, index) {
          final recommendation = _recommendations[index];
          final isExpanded = _expandedIds.contains(recommendation.id);
          
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Material(
                color: recommendation.color,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (isExpanded) {
                        _expandedIds.remove(recommendation.id);
                      } else {
                        _expandedIds.add(recommendation.id);
                      }
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 20,
                              child: Icon(
                                recommendation.icon,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    recommendation.title,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    recommendation.category,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              isExpanded
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                            ),
                          ],
                        ),
                        if (isExpanded) ...[
                          const SizedBox(height: 16),
                          Text(
                            recommendation.description,
                            style: const TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              OutlinedButton.icon(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Reminder set for tomorrow'),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.alarm),
                                label: const Text('Remind Me'),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.black87,
                                  side: const BorderSide(color: Colors.black54),
                                ),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton.icon(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Marked as completed!'),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.check),
                                label: const Text('I Did This'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Recommendation {
  final String id;
  final String title;
  final String description;
  final String category;
  final IconData icon;
  final Color color;

  Recommendation({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.icon,
    required this.color,
  });
} 
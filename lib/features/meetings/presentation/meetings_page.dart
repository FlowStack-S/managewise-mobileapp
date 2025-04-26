import 'package:flutter/material.dart';

class MeetingsPage extends StatefulWidget {
  const MeetingsPage({super.key});

  @override
  State<MeetingsPage> createState() => _MeetingsPageState();
}

class _MeetingsPageState extends State<MeetingsPage> {
  // Dummy data
  final List<String> _meetings = [
    'Sprint Planning Meeting',
    'Daily Scrum',
    'Retrospective',
    'Review',
  ];

  final List<String> _sprints = [
    'Sprint 1',
    'Sprint 2',
    'Sprint 3',
    'Sprint 4',
  ];

  String _selectedSprint = 'Sprint 1';

  final Map<String, List<String>> _recordingsBySprint = {
    'Sprint 1': List.generate(
        5, (i) => 'SprintPlanning/recording_${i + 1}'),
    'Sprint 2': List.generate(
        3, (i) => 'SprintReview/recording_${i + 1}'),
    'Sprint 3': List.generate(
        4, (i) => 'DailyScrum/recording_${i + 1}'),
    'Sprint 4': List.generate(
        2, (i) => 'Retrospective/recording_${i + 1}'),
  };

  @override
  Widget build(BuildContext context) {
    final recordings = _recordingsBySprint[_selectedSprint] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meetings'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // Meetings section
            for (var meeting in _meetings) ...[
              Card(
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: Colors.grey[100],
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12, horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          meeting,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      // Enter button
                      ElevatedButton(
                        onPressed: () {
                          // navegar a meeting details
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          minimumSize: const Size(40, 40),
                          padding: EdgeInsets.zero,
                        ),
                        child: const Icon(Icons.login, color: Colors.white),
                      ),
                      const SizedBox(width: 8),
                      // Edit button
                      ElevatedButton(
                        onPressed: () {
                          // editar meeting
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          minimumSize: const Size(40, 40),
                          padding: EdgeInsets.zero,
                        ),
                        child: const Icon(Icons.edit, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],

            const SizedBox(height: 24),
            // Recordings section title
            const Text(
              'Recordings',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            // Sprint dropdown
            DropdownButton<String>(
              value: _selectedSprint,
              items: _sprints
                  .map((s) => DropdownMenuItem(
                value: s,
                child: Text(s),
              ))
                  .toList(),
              onChanged: (v) {
                if (v != null) {
                  setState(() => _selectedSprint = v);
                }
              },
              style: const TextStyle(
                  fontSize: 16, color: Colors.black),
              dropdownColor: Colors.grey[200],
            ),
            const SizedBox(height: 12),
            // Recordings list
            for (var rec in recordings) ...[
              Card(
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: Colors.grey[100],
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12, horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          rec,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // reproducir grabación
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          minimumSize: const Size(40, 40),
                          padding: EdgeInsets.zero,
                        ),
                        child: const Icon(Icons.play_arrow,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

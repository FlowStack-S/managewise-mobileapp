import 'backlog_page.dart';
import 'package:flutter/material.dart';
import 'package:managewise_mobileproject/features/backlog/models/epic.dart';
import 'package:managewise_mobileproject/features/backlog/models/user_story.dart';
import 'package:managewise_mobileproject/features/backlog/services/backlog_service.dart';


class BacklogItemsPage extends StatefulWidget {
  const BacklogItemsPage({super.key});

  @override
  State<BacklogItemsPage> createState() => _BacklogItemsPageState();
}

class _BacklogItemsPageState extends State<BacklogItemsPage> {
  final backlogService = BacklogService();

  List<UserStory> userStories = [];
  List<Epic> epics = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final fetchedStories = await backlogService.fetchUserStories();
    final fetchedEpics = await backlogService.fetchEpics();
    setState(() {
      userStories = fetchedStories;
      epics = fetchedEpics;
    });
  }

  Future<void> showCreateUserStoryDialog() async {
    final titleController = TextEditingController();
    final descController = TextEditingController();
    final effortController = TextEditingController();

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Create User Story'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: titleController, decoration: const InputDecoration(labelText: 'Title')),
            TextField(controller: descController, decoration: const InputDecoration(labelText: 'Description')),
            TextField(controller: effortController, decoration: const InputDecoration(labelText: 'Effort')),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await backlogService.createUserStory(
                titleController.text,
                descController.text,
                int.tryParse(effortController.text) ?? 1,
              );
              Navigator.pop(context);
              loadData();
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  Future<void> showCreateEpicDialog() async {
    final titleController = TextEditingController();
    final descController = TextEditingController();

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Create Epic'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: titleController, decoration: const InputDecoration(labelText: 'Title')),
            TextField(controller: descController, decoration: const InputDecoration(labelText: 'Description')),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await backlogService.createEpic(
                titleController.text,
                descController.text,
              );
              Navigator.pop(context);
              loadData();
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  Widget _buildUserStoriesList() {
    return _buildHorizontalList(
      userStories.map((e) => {
        'US#': 'US${e.id}',
        'Título': e.title,
        'Descripción': e.description,
        'Estimado': '${e.effort}h',
        'Estado': e.status,
      }).toList(),
      ['US#', 'Título', 'Descripción', 'Estimado', 'Estado'],
    );
  }

  Widget _buildEpicsList() {
    return _buildHorizontalList(
      epics.map((e) => {
        'Epic#': 'EP${e.id}',
        'Título': e.title,
        'Descripción': e.description,
        'Estado': e.status,
      }).toList(),
      ['Epic#', 'Título', 'Descripción', 'Estado'],
    );
  }

  Widget _buildHorizontalList(List<Map<String,String>> items, List<String> keys) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, idx) {
          final data = items[idx];
          return Card(
            color: Colors.grey[100],
            child: Container(
              width: 200,
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var k in keys)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text('$k: ${data[k]}', style: const TextStyle(fontSize: 14)),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Backlog'),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('User Stories', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ElevatedButton(
                  onPressed: showCreateUserStoryDialog,
                  child: const Text('Create'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _buildUserStoriesList(),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Epics', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ElevatedButton(
                  onPressed: showCreateEpicDialog,
                  child: const Text('Create'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _buildEpicsList(),
          ],
        ),
      ),
    );
  }
}

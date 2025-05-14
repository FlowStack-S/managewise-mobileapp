import 'package:flutter/material.dart';
import '../services/backlog_service.dart';
import '../models/user_story.dart';
import 'backlog_items_page.dart';
import 'package:managewise_mobileproject/features/backlog/models/epic.dart';
import 'package:managewise_mobileproject/features/backlog/models/user_story.dart';
import 'package:managewise_mobileproject/features/backlog/services/backlog_service.dart';


class BacklogPage extends StatefulWidget {
  const BacklogPage({super.key});

  @override
  State<BacklogPage> createState() => _BacklogPageState();
}

class _BacklogPageState extends State<BacklogPage> {
  final backlogService = BacklogService();

  List<UserStory> productBacklog = [];
  List<UserStory> sprintBacklog = [];

  @override
  void initState() {
    super.initState();
    loadBacklogs();
  }

  Future<void> loadBacklogs() async {
    final allStories = await backlogService.fetchUserStories();

    setState(() {
      productBacklog = allStories.where((us) => us.sprintId == null || us.sprintId == 0).toList();
      sprintBacklog = allStories.where((us) => us.sprintId != null && us.sprintId != 0).toList();
    });
  }

  Future<void> showAddUserStoryDialog() async {
    final titleController = TextEditingController();
    final descController = TextEditingController();
    final effortController = TextEditingController();

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add User Story'),
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
              loadBacklogs();
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  Widget buildUserStoryCard(UserStory story) {
    return Card(
      color: Colors.grey[200],
      margin: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        title: Text(story.title),
        subtitle: Text('Status: ${story.status} • Effort: ${story.effort}h'),
        trailing: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            // Aquí puedes agregar lógica para eliminar la historia si deseas
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Backlog'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Botón Items
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const BacklogItemsPage()),
                );
              },
              child: const Text('Items'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            ),
            const SizedBox(height: 16),

            // PRODUCT BACKLOG
            const Text('Product Backlog', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...productBacklog.map(buildUserStoryCard),
            const SizedBox(height: 32),

            // SPRINT BACKLOG
            const Text('Sprint Backlog', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...sprintBacklog.map(buildUserStoryCard),

            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  // Acción para iniciar el sprint
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Sprint iniciado (placeholder).'),
                  ));
                },
                child: const Text('Start'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              ),
            ),
            const SizedBox(height: 32),

            // AGREGAR NUEVA US
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: showAddUserStoryDialog,
                child: const Text('Add User Story'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

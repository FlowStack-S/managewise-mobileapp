import 'backlog_items_page.dart';
import 'package:flutter/material.dart';

class BacklogPage extends StatelessWidget {
  const BacklogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Backlog'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Button for "Items"
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const BacklogItemsPage()),
                );
              },
              child: const Text('Items'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange, // Button color
              ),
            ),
            const SizedBox(height: 16),

            // Product Backlog Section
            const Text(
              'Product Backlog',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // List of Product Backlog
            Column(
              children: List.generate(3, (index) {
                return Card(
                  color: Colors.grey[200],
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    title: const Text('US Title'),
                    subtitle: const Text('Status'),
                    trailing: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        // Action to delete item
                      },
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 32),

            // Sprint Backlog Section
            const Text(
              'Sprint Backlog',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // List of Sprint Backlog with Start button
            Column(
              children: List.generate(3, (index) {
                return Card(
                  color: Colors.grey[200],
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    title: const Text('US Title'),
                    subtitle: const Text('Status'),
                    trailing: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        // Action to delete item
                      },
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 16),

            // Button to start Sprint
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  // Action for Start button
                },
                child: const Text('Start'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Button color
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Add User Story Button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  // Action to Add User Story
                },
                child: const Text('Add User Story'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: const BacklogPage(),
  ));
}

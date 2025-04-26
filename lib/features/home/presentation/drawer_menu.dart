import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.orange),
            child: Center(child: Text('Menu', style: TextStyle(fontSize: 24))),
          ),
          _buildDrawerItem(context, Icons.bar_chart, 'Statistics'),
          _buildDrawerItem(context, Icons.list_alt, 'Backlog'),
          _buildDrawerItem(context, Icons.view_kanban, 'Board'),
          _buildDrawerItem(context, Icons.bug_report, 'Issues'),
          _buildDrawerItem(context, Icons.group, 'Members'),
          _buildDrawerItem(context, Icons.meeting_room, 'Meetings'),
          _buildDrawerItem(context, Icons.settings, 'Configuration'),
        ],
      ),
    );
  }
  ListTile _buildDrawerItem(BuildContext context, IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Navigated to $title')),
        );
      },
    );
  }
}


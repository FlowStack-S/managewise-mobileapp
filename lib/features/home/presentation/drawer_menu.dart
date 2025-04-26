import 'package:flutter/material.dart';
import 'package:managewise_mobileproject/features/statistics/presentation/statistics_page.dart';
import 'package:managewise_mobileproject/features/backlog/presentation/backlog_page.dart';
import 'package:managewise_mobileproject/features/board/presentation/board_page.dart';
import 'package:managewise_mobileproject/features/issues/presentation/issues_page.dart';

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
          _buildDrawerItem(context, Icons.bar_chart, 'Statistics', const StatisticsPage()),
          _buildDrawerItem(context, Icons.list_alt, 'Backlog', const BacklogPage()),
          _buildDrawerItem(context, Icons.view_kanban, 'Board', const BoardPage()),
          _buildDrawerItem(context, Icons.bug_report, 'Issues', const IssuesPage()),
          //_buildDrawerItem(context, Icons.group, 'Members', const MembersPage()),
          //_buildDrawerItem(context, Icons.meeting_room, 'Meetings', const MeetingsPage()),
          //_buildDrawerItem(context, Icons.settings, 'Configuration', const ConfigurationPage()),
        ],
      ),
    );
  }
  ListTile _buildDrawerItem(BuildContext context, IconData icon, String title, Widget page) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Navigated to $title')),
        );
      },
    );
  }
}


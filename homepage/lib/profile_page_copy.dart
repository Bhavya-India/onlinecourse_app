import 'package:flutter/material.dart';
import 'course_data.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: CircleAvatar(
              radius: 48,
              backgroundColor: colors.primaryContainer,
              child: Icon(Icons.person, size: 52, color: colors.primary),
            ),
          ),
          const SizedBox(height: 12),
          const Text('Learner',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text('learner@learnhub.com',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600)),
          const SizedBox(height: 24),

          // Stats
          Row(
            children: [
              Expanded(
                child: _StatCard(
                    label: 'Enrolled', notifier: AppState.enrolled),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(label: 'Saved', notifier: AppState.saved),
              ),
            ],
          ),
          const SizedBox(height: 24),

          _tile(Icons.edit_outlined, 'Edit Profile'),
          _tile(Icons.notifications_outlined, 'Notifications'),
          _tile(Icons.lock_outline, 'Change Password'),
          _tile(Icons.help_outline, 'Help & Support'),
          const Divider(height: 32),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title:
                const Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: () {
              AppState.enrolled.value = {};
              AppState.saved.value = {};
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _tile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        // TODO: Navigate to the corresponding settings page
      },
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final ValueNotifier<Set<String>> notifier;
  const _StatCard({required this.label, required this.notifier});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ValueListenableBuilder<Set<String>>(
        valueListenable: notifier,
        builder: (_, value, _) => Column(
          children: [
            Text('${value.length}',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(color: Colors.grey.shade700)),
          ],
        ),
      ),
    );
  }
}
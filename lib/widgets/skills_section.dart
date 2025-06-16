import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  'My Skills',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'A comprehensive list of my technical skills and expertise in mobile development',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: const [
              SkillCard(
                title: 'Mobile Development',
                icon: Icons.public,
                color: Colors.blue,
                skills: [
                  'Flutter',
                  'Dart',
                  'BLoC',
                  'Provider',
                  'GetX',
                  'Riverpod',
                  'Firebase',
                  'REST APIs',
                  'SQLite',
                  'Hive'
                ],
              ),
              SkillCard(
                title: 'UI Development',
                icon: Icons.design_services,
                color: Colors.yellow,
                skills: [
                  'Material Design',
                  'Cupertino',
                  'Custom Widgets',
                  'Animations',
                  'Responsive Design',
                  'UI/UX Design',
                  'Prototyping',
                  'Figma'
                ],
              ),
              SkillCard(
                title: 'Backend Development',
                icon: Icons.storage,
                color: Colors.deepOrange,
                skills: [
                  'Node.js',
                  'Express',
                  'MongoDB',
                  'PostgreSQL',
                  'Firebase',
                  'REST APIs',
                  'GraphQL',
                  'WebSockets'
                ],
              ),
              SkillCard(
                title: 'DevOps',
                icon: Icons.settings,
                color: Colors.green,
                skills: [
                  'Git',
                  'GitHub Actions',
                  'CI/CD',
                  'Docker',
                  'AWS',
                  'Google Cloud',
                  'App Store Connect',
                  'Google Play Console'
                ],
              ),
              SkillCard(
                title: 'Tools & Software',
                icon: Icons.build,
                color: Colors.purple,
                skills: [
                  'VS Code',
                  'Android Studio',
                  'Xcode',
                  'Postman',
                  'Firebase Console',
                  'Flutter DevTools',
                  'Codemagic',
                  'Fastlane'
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SkillCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final List<String> skills;

  const SkillCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: kElevationToShadow[1],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color),
              const SizedBox(width: 8),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills.map((skill) {
              final isDark = Theme.of(context).brightness == Brightness.dark;
              return Chip(
                label: Text(
                  skill,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: isDark ? Colors.white70 : Colors.black54,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(
                    color: isDark ? Colors.white30 : Colors.grey.shade400,
                  ),
                ),
                backgroundColor: isDark ? Colors.grey.shade800 : Colors.grey.shade200,
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}

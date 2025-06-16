import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  final List<Map<String, dynamic>> projects = [
    {
      'title': 'Health & Fitness App',
      'description':
      'A comprehensive fitness tracking app with workout plans, nutrition tracking, and social features.',
      'imageUrl':
      'https://images.everydayhealth.com/images/everything-you-need-know-about-fitness-1440x810.jpg',
      'techStack': ['Flutter', 'Firebase', 'BLoC', 'Google Fit API'],
    },
    {
      'title': 'E-Commerce Mobile App',
      'description':
      'Feature-rich e-commerce application with real-time inventory, secure payments, and personalized recommendations.',
      'imageUrl':
      'https://media.licdn.com/dms/image/D4D12AQHolEDBl9zVpw/article-cover_image-shrink_600_2000/0/1680491082579?e=2147483647&v=beta&t=42YPQA4r7PjInIjqlfO33V-3CMJaYUAPRQibXsddeGM',
      'techStack': ['Flutter', 'Stripe', 'GetX', 'REST API'],
    },
    {
      'title': 'Social Media App',
      'description':
      'Modern social networking app with real-time messaging, story sharing, and content discovery features.',
      'imageUrl':
      'https://th.bing.com/th/id/OIP.TUfXZtS56l8Jqm3I_Of16QHaE7?rs=1&pid=ImgDetMain',
      'techStack': ['Flutter', 'Socket.io', 'Provider', 'MongoDB'],
    },
    {
      'title': 'Food Delivery App',
      'description':
      'Restaurant delivery app with real-time order tracking, payment integration, and driver management system.',
      'imageUrl':
      'https://cdn.dribbble.com/userupload/11293182/file/original-5273d800c16cf4310e94c1c059d8271b.jpg?resize=%7Bwidth%7Dx%7Bheight%7D&vertical=center',
      'techStack': ['Flutter', 'Google Maps', 'Riverpod', 'Node.js'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Projects',
              style: GoogleFonts.raleway(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = constraints.maxWidth > 800 ? 2 : 1;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: projects.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.6,
                ),
                itemBuilder: (context, index) {
                  final project = projects[index];
                  return ProjectCard(
                    imageUrl: project['imageUrl'],
                    title: project['title'],
                    description: project['description'],
                    techStack: List<String>.from(project['techStack']),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

//👇 Add this class in the same file or keep it in a separate file
class ProjectCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final List<String> techStack;

  const ProjectCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.techStack,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section
          Image.network(
            imageUrl,
            height: 140,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          // Content section
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: techStack.map((tech) {
                    final isDark = Theme.of(context).brightness == Brightness.dark;
                    return Chip(
                      label: Text(
                        tech,
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
          ),
        ],
      ),
    );
  }
}

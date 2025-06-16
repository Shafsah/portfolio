import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Text(
            'About Me',
            style: GoogleFonts.raleway(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Here you'll find more information about me, what I do, and my current skills",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 48),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Get to know me!',
                      style: GoogleFonts.raleway(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "I'm a Flutter Developer specializing in building beautiful, performant mobile applications that deliver exceptional user experiences. Check out some of my work in the Projects section.",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "I'm passionate about mobile development and enjoy sharing my knowledge about Flutter and Dart through technical articles and open-source contributions.",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "I'm open to Flutter development opportunities where I can contribute, learn and grow. If you have an exciting mobile project that matches my skills and experience, don't hesitate to contact me.",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Contact Me'),
                            content: const Text('How would you like to contact me?'),
                            actions: [
                              TextButton.icon(
                                onPressed: () {
                                  launchUrl(Uri.parse('mailto:hafsashah916@gmail.com'));
                                },
                                icon: const Icon(Icons.email),
                                label: const Text('Email'),
                              ),
                              TextButton.icon(
                                onPressed: () {
                                  launchUrl(Uri.parse('tel:+923122469750'));
                                },
                                icon: const Icon(Icons.phone),
                                label: const Text('Call'),
                              ),
                            ],
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                      ),
                      child: const Text(
                        'Contact Me',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(width: 48),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Experience',
                      style: GoogleFonts.raleway(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const ExperienceItem(
                      title: 'Junior Flutter Developer',
                      company: 'Inseyab Consulting & Information Solutions LLC',
                      period: 'August 2024 - Present',
                      achievements: [
                        'Developing and maintaining Flutter applications',
                        'Collaborating with team members on mobile projects',
                      ],
                    ),
                    const SizedBox(height: 24),
                    const ExperienceItem(
                      title: 'Trainee Flutter Developer',
                      company: 'Inseyab Consulting & Information Solutions LLC',
                      period: 'March 2024 - August 2024',
                      achievements: [
                        'Learned advanced Flutter development practices',
                        'Assisted in developing mobile applications',
                      ],
                    ),
                    const SizedBox(height: 24),
                    const ExperienceItem(
                      title: 'Flutter Developer Intern',
                      company: 'Inseyab Consulting & Information Solutions LLC',
                      period: 'August 2023 - March 2024',
                      achievements: [
                        'Gained hands-on experience with Flutter development',
                        'Worked on various mobile app features and components',
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ExperienceItem extends StatelessWidget {
  final String title;
  final String company;
  final String period;
  final List<String> achievements;

  const ExperienceItem({
    super.key,
    required this.title,
    required this.company,
    required this.period,
    required this.achievements,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          company,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const FaIcon(
              FontAwesomeIcons.calendar,
              size: 14,
            ),
            const SizedBox(width: 8),
            Text(
              period,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...achievements.map(
              (achievement) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: FaIcon(
                    FontAwesomeIcons.check,
                    size: 14,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(child: Text(achievement)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

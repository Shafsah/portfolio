import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  final VoidCallback onHomeTap;
  final VoidCallback onAboutTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onContactTap;

  const FooterSection({
    super.key,
    required this.onHomeTap,
    required this.onAboutTap,
    required this.onProjectsTap,
    required this.onSkillsTap,
    required this.onContactTap,
  });

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Container(
      color: isDark ? const Color(0xFF0B1120) : Colors.grey[200],
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Syeda Hafsa Shah",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "A passionate Flutter Developer building\ncreative and functional web and mobile applications.",
                      style: TextStyle(height: 1.5),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => _launchUrl('https://github.com/Shafsah'),
                          icon: FaIcon(
                            FontAwesomeIcons.github,
                            color: theme.iconTheme.color,
                          ),
                          tooltip: 'GitHub',
                        ),
                        IconButton(
                          onPressed: () => _launchUrl('https://www.linkedin.com/in/syeda-hafsa-shah-aba15a21b/'),
                          icon: FaIcon(
                            FontAwesomeIcons.linkedin,
                            color: theme.iconTheme.color,
                          ),
                          tooltip: 'LinkedIn',
                        ),
                        IconButton(
                          onPressed: () => _launchUrl('mailto:hafsashah916@gmail.com'),
                          icon: FaIcon(
                            FontAwesomeIcons.solidEnvelope,
                            color: theme.iconTheme.color,
                          ),
                          tooltip: 'Email',
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Center Column - Quick Links
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Quick Links",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    TextButton(onPressed: onHomeTap, child: const Text("Home")),
                    TextButton(onPressed: onAboutTap, child: const Text("About")),
                    TextButton(onPressed: onProjectsTap, child: const Text("Projects")),
                    TextButton(onPressed: onSkillsTap, child: const Text("Skills")),
                    TextButton(onPressed: onContactTap, child: const Text("Contact")),
                  ],
                ),
              ),

              // Right Column - Contact Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Contact Info",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 12),
                    Text("Karachi, Pakistan"),
                    Text("hafsashah916@gmail.com"),
                    Text("+923122469750"),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("© 2025 Syeda Hafsa Shah. All rights reserved."),
              Row(
                children: const [
                  Text("Designed & Built with "),
                  Icon(Icons.favorite, size: 16, color: Colors.red),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

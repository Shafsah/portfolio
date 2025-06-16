import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/widgets/about_section.dart';
import 'package:portfolio/widgets/hero_section.dart';
import 'package:portfolio/theme_provider.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer_section.dart';
import '../widgets/process_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/skills_section.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  // Global keys for sections
  final heroKey = GlobalKey();
  final aboutKey = GlobalKey();
  final projectsKey = GlobalKey();
  final skillsKey = GlobalKey();
  final contactKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeModeProvider) == ThemeMode.dark;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: Theme.of(context).colorScheme.background,
            title: Text(
              'Syeda Hafsa Shah',
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
                tooltip: 'Toggle Theme',
                onPressed: () {
                  ref.read(themeModeProvider.notifier).state =
                  isDarkMode ? ThemeMode.light : ThemeMode.dark;
                },
              ),
              TextButton(
                onPressed: () => _scrollToSection(heroKey),
                child: const Text('Home'),
              ),
              TextButton(
                onPressed: () => _scrollToSection(aboutKey),
                child: const Text('About'),
              ),
              TextButton(
                onPressed: () => _scrollToSection(projectsKey),
                child: const Text('Projects'),
              ),
              TextButton(
                onPressed: () => _scrollToSection(skillsKey),
                child: const Text('Skills'),
              ),
              TextButton(
                onPressed: () => _scrollToSection(contactKey),
                child: const Text('Contact'),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(key: heroKey, child: const HeroSection()),
                Container(key: aboutKey, child: const AboutSection()),
                Container(key: projectsKey, child: const ProjectsSection()),
                Container(key: skillsKey, child: const SkillsSection()),
                const DevelopmentProcessCard(),
                Container(key: contactKey, child: const ContactMeSection()),
                FooterSection(
                  onHomeTap: () => _scrollToSection(heroKey),
                  onAboutTap: () => _scrollToSection(aboutKey),
                  onProjectsTap: () => _scrollToSection(projectsKey),
                  onSkillsTap: () => _scrollToSection(skillsKey),
                  onContactTap: () => _scrollToSection(contactKey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}

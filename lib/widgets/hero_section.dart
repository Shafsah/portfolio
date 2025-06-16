import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';


class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      height: MediaQuery.of(context).size.height - 80,
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Flutter Developer',
            style: textTheme.titleSmall?.copyWith(
              color: theme.colorScheme.primary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Hi, I'm Syeda Hafsa Shah",
            style: GoogleFonts.raleway(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: textTheme.headlineMedium?.color,
            ),
          ),
          const SizedBox(height: 8),
          DefaultTextStyle(
            style: textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: textTheme.headlineMedium?.color,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'I build amazing mobile apps',
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              repeatForever: true,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            "I'm a passionate Flutter developer creating beautiful, high-performance mobile applications. Specializing in cross-platform development and delivering exceptional user experiences.",
            style: textTheme.bodyLarge?.copyWith(
              color: isDark ? Colors.grey[300] : Colors.grey[800],
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 32),

          OutlinedButton(
            onPressed: () async {
              final url = 'assets/resume/Syeda Hafsa Shah Resume.pdf';

              // For web
              if (Uri.base.scheme == 'http' || Uri.base.scheme == 'https') {
                _launchUrl(url); // will open if it's hosted
              } else {
                // For mobile or desktop, copy to temporary directory and open
                final bytes = await DefaultAssetBundle.of(context).load(url);
                final buffer = bytes.buffer;
                final tempDir = await getTemporaryDirectory();
                final filePath = '${tempDir.path}/HafsaResume.pdf';
                final file = File(filePath);
                await file.writeAsBytes(
                  buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes),
                );
                await OpenFile.open(file.path);
              }
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
            ),
            child: Text(
              'Download CV',
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 32),
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
    );
  }
}

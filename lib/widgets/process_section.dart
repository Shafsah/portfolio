import 'package:flutter/material.dart';

class DevelopmentProcessCard extends StatelessWidget {
  const DevelopmentProcessCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [Colors.blueGrey.shade900, Colors.blueGrey.shade800]
              : [Colors.blue.shade50, Colors.cyan.shade50],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return constraints.maxWidth > 600
              ? Row(
            children: [
              // Left side - Text
              Expanded(child: _buildTextContent(context)),
              // Right side - Image
              _buildImageOverlay(),
            ],
          )
              : Column(
            children: [
              _buildTextContent(context),
              _buildImageOverlay(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Development Process',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'I follow a systematic approach to mobile app development that ensures high-quality, performant, and user-friendly applications. My process includes thorough planning, iterative development, comprehensive testing, and continuous deployment.',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 32,
            runSpacing: 16,
            children: [
              _buildFeature(Icons.layers, 'Clean Architecture', 'Maintainable code'),
              _buildFeature(Icons.design_services, 'UI/UX Focus', 'Beautiful interfaces'),
              _buildFeature(Icons.code, 'Best Practices', 'Flutter standards'),
              _buildFeature(Icons.bug_report, 'Testing', 'Quality assurance'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeature(IconData icon, String title, String subtitle) {
    return SizedBox(
      width: 200,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.deepPurple),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              Text(subtitle, style: const TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImageOverlay() {
    return Container(
      width: 280,
      height: 280,
      margin: const EdgeInsets.all(16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/developer.jpg', // Replace with your image path
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.3), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          const Positioned(
            left: 12,
            bottom: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Flutter Development',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Text(
                  'Building beautiful cross-platform apps',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

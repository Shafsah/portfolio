import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContactInfoCard extends StatelessWidget {
  const ContactInfoCard({super.key});

  Widget _buildInfoItem(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 28, color: Color(0xFF00BFA6)),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 2),
              Text(value, style: const TextStyle(fontSize: 15)),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Get In Touch',
          style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold,
            color: Color(0xFF00BFA6),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          "I'm currently available for freelance work or full-time positions. "
              "If you have a project that needs some creative touch, I'd love to hear about it.",
          style: TextStyle(fontSize: 15),
        ),
        const SizedBox(height: 24),
        _buildInfoItem(Icons.email, 'Email', 'hafsashah916@gmail.com'),
        _buildInfoItem(Icons.phone, 'Phone', '+923122469750'),
        _buildInfoItem(Icons.location_on, 'Location', 'Karachi, Pakistan'),
      ],
    );
  }
}

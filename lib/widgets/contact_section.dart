import 'package:flutter/material.dart';

import 'contact_form.dart';
import 'contact_info_card.dart';

class ContactMeSection extends StatelessWidget {
  const ContactMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black87;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Contact Me',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Have a question or want to work together? Feel free to reach out!',
                style: TextStyle(fontSize: 16, color: textColor.withOpacity(0.7)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              LayoutBuilder(
                builder: (context, constraints) {
                  return Flex(
                    direction: constraints.maxWidth > 700 ? Axis.horizontal : Axis.vertical,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left - Contact Info
                      Expanded(
                        flex: 2,
                        child: ContactInfoCard(),
                      ),
                      const SizedBox(width: 40, height: 40),
                      // Right - Form
                      Expanded(
                        flex: 2,
                        child: ContactForm(),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

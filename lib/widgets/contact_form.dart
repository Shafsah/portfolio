import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();

  bool _isSending = false;
  String? _statusMessage;

  Future<void> _sendForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isSending = true;
      _statusMessage = null;
    });

    const endpoint = 'https://formspree.io/f/mnnvvlvd'; // ✅ Your real Formspree link

    try {
      final response = await http.post(
        Uri.parse(endpoint),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': emailController.text,
          'message': '''
Name: ${nameController.text}
Subject: ${subjectController.text}

${messageController.text}
''', // ✅ Combines name + subject + message into one field
        }),
      );

      if (response.statusCode == 200) {
        setState(() => _statusMessage = '✅ Message sent successfully!');
        nameController.clear();
        emailController.clear();
        subjectController.clear();
        messageController.clear();
      } else {
        print('Formspree Error: ${response.body}');
        setState(() => _statusMessage = '❌ Failed to send message. Please try again.');
      }
    } catch (e) {
      print('Exception: $e');
      setState(() => _statusMessage = '⚠️ Something went wrong.');
    } finally {
      setState(() => _isSending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildTextField(
            label: 'Your Name',
            hint: 'Syeda Hafsa Shah',
            controller: nameController,
            validator: (v) =>
            v == null || v.isEmpty ? 'Please enter your name' : null,
          ),
          const SizedBox(height: 12),
          _buildTextField(
            label: 'Your Email',
            hint: 'hafsashah916@gmail.com',
            controller: emailController,
            inputType: TextInputType.emailAddress,
            validator: (v) {
              if (v == null || v.isEmpty) return 'Please enter your email';
              final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
              if (!emailRegex.hasMatch(v)) return 'Please enter a valid email';
              return null;
            },
          ),
          const SizedBox(height: 12),
          _buildTextField(
            label: 'Subject',
            hint: 'Project Inquiry',
            controller: subjectController,
            validator: (v) =>
            v == null || v.isEmpty ? 'Please enter a subject' : null,
          ),
          const SizedBox(height: 12),
          _buildTextField(
            label: 'Your Message',
            hint: 'Hi Hafsa, I\'d like to talk about...',
            controller: messageController,
            maxLines: 5,
            validator: (v) =>
            v == null || v.isEmpty ? 'Please enter your message' : null,
          ),
          const SizedBox(height: 20),
          if (_statusMessage != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                _statusMessage!,
                style: TextStyle(
                  color: _statusMessage!.contains('✅')
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _isSending ? null : _sendForm,
              icon: const Icon(Icons.send),
              label: Text(_isSending ? 'Sending...' : 'Send Message'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00BFA6),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    int maxLines = 1,
    TextInputType inputType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: inputType,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          ),
        ),
      ],
    );
  }
}

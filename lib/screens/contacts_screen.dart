import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Контакты'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildContactCard(
              icon: Icons.chat,
              title: 'ВКонтакте',
              value: 'vk.com/sarnight',
              onTap: () => _launchUrl('https://vk.com/sarnight'),
              color: const Color(0xFF2787F5),
            ),
            const SizedBox(height: 16),
            _buildContactCard(
              icon: Icons.email,
              title: 'Email',
              value: 'zlobin-av@inbox.ru',
              onTap: () => _launchUrl('mailto:zlobin-av@inbox.ru'),
              color: const Color(0xFFD44638),
            ),
            const SizedBox(height: 16),
            _buildContactCard(
              icon: Icons.phone,
              title: 'Телефон',
              value: '+7 960-357-88-99',
              onTap: () => _launchUrl('tel:+79603578899'),
              color: const Color(0xFF25D366),
            ),
            const SizedBox(height: 16),
            _buildContactCard(
              icon: Icons.location_on,
              title: 'Адрес',
              value: 'г. Саратов, ул. Вольская, 127/133',
              onTap: () => _launchUrl('https://maps.yandex.ru/?text=Саратов, ул. Вольская, 127/133'),
              color: const Color(0xFFFF6B00),
            ),
            const Spacer(),
            const Column(
              children: [
                Text(
                  'ИП «СарНайт» | Саратов, ул. Вольская, 127/133 | 24/7',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  '© 2026 СарНайт — твой ночной фастфуд в Саратове',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF141428), Color(0xFF1A1A3A)],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0x44FF6B00)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  const SizedBox(height: 4),
                  Text(value, style: const TextStyle(color: Colors.white, fontSize: 14)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
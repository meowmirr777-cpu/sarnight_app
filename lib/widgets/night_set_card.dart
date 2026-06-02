import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/cart_item.dart';

class NightSetCard extends StatelessWidget {
  final Map<String, dynamic> set;

  const NightSetCard({super.key, required this.set});

  void _orderViaVK(BuildContext context) {
    final message = 'Здравствуйте! Хочу заказать сет: ${set['name']} (${set['newPrice']}₽)';
    final url = 'https://vk.com/im?sel=-239118072&text=${Uri.encodeComponent(message)}';
    _launchUrl(url);
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _showComposition(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF141428), Color(0xFF1A1A3A)],
          ),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                set['image'],
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    color: const Color(0x22FF6B00),
                    child: const Icon(Icons.restaurant_menu, size: 80, color: Color(0xFFFF6B00)),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Text(
              set['name'],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFF6B00),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              set['desc'],
              style: const TextStyle(fontSize: 16, color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${set['newPrice']} ₽',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF6B00),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final cart = Provider.of<CartModel>(context, listen: false);
                  cart.addItem(CartItem(
                    id: set['id'],
                    name: set['name'],
                    description: set['desc'],
                    price: set['newPrice'],
                    imagePath: set['image'],
                  ));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Сет добавлен в корзину'),
                      duration: Duration(seconds: 1),
                      backgroundColor: Color(0xFFFF6B00),
                    ),
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6B00),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Добавить в корзину', style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
            const SizedBox(height: 12),
            // Кнопка "Заказать через ВКонтакте"
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  _orderViaVK(context);
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF2787F5), width: 1.5),
                  backgroundColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.chat, color: Color(0xFF2787F5), size: 20),
                    SizedBox(width: 8),
                    Text('Заказать через ВКонтакте', style: TextStyle(fontSize: 16, color: Color(0xFF2787F5))),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFFF6B00)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Закрыть', style: TextStyle(fontSize: 16, color: Color(0xFFFF6B00))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addToCart(BuildContext context) {
    final cart = Provider.of<CartModel>(context, listen: false);
    
    cart.addItem(CartItem(
      id: set['id'],
      name: set['name'],
      description: set['desc'],
      price: set['newPrice'],
      imagePath: set['image'],
    ));
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${set['name']} добавлен в корзину'),
        duration: const Duration(seconds: 1),
        backgroundColor: const Color(0xFFFF6B00),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showComposition(context),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF141428), Color(0xFF1A1A3A)],
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0x44FF6B00)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                set['image'],
                width: double.infinity,
                fit: BoxFit.fitWidth,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 150,
                    width: double.infinity,
                    color: const Color(0x22FF6B00),
                    child: const Icon(
                      Icons.restaurant_menu,
                      size: 50,
                      color: Color(0xFFFF6B00),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    set['name'],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF6B00),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    set['desc'],
                    style: const TextStyle(fontSize: 11, color: Color(0xFFCCCCCC)),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        '${set['oldPrice']} ₽',
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Color(0xFF888888),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${set['newPrice']} ₽',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF6B00),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _addToCart(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF6B00),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Text(
                        'Заказать',
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class NightSetCard extends StatelessWidget {
  final Map<String, dynamic> set;

  const NightSetCard({super.key, required this.set});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          // Картинка — теперь видна полностью!
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              set['image'],
              width: double.infinity,
              height: 160,
              fit: BoxFit.fitWidth,  // ← Изменено! Показывает всю ширину, высота подстраивается
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 160,
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
          // Информация
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
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Сет добавлен в корзину!'),
                          duration: Duration(seconds: 1),
                          backgroundColor: Color(0xFFFF6B00),
                        ),
                      );
                    },
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
    );
  }
}
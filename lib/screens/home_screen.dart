import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/night_set_card.dart';
import '../widgets/bottom_nav_bar.dart';
import 'menu_screen.dart';
import 'cart_screen.dart';
import 'contacts_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const [
          HomeContent(),
          MenuScreen(),
          CartScreen(),
          ContactsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    
    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _showDiscountInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A3A),
        title: const Text(
          '🌙 Ночная скидка 10%',
          style: TextStyle(color: Color(0xFFFF6B00)),
        ),
        content: const Text(
          'Скидка действует на все заказы,\nоформленные с 00:00 до 06:00.\nАвтоматически применяется при оформлении заказа.\n\nМинимальная сумма заказа — 450 ₽.\nДоставка бесплатная!',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Понятно', style: TextStyle(color: Color(0xFFFF6B00))),
          ),
        ],
      ),
    );
  }

  void _showFeatureInfo(BuildContext context, String title, String description) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A3A),
        title: Text(
          title,
          style: const TextStyle(color: Color(0xFFFF6B00)),
        ),
        content: Text(
          description,
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Понятно', style: TextStyle(color: Color(0xFFFF6B00))),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF0A0A1A), Color(0xFF1A1A3A)],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Кликабельная надпись о скидке
                    GestureDetector(
                      onTap: () => _showDiscountInfo(context),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0x22FF6B00),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Text(
                          '🌙 Работаем 24/7 | Ночная скидка 10% 🌙',
                          style: TextStyle(color: Color(0xFFFF6B00), fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Бургеры, \nдомашняя кухня\nи хрустящий картофель фри',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Круглосуточная доставка в Саратове. Минимальный заказ — 450 ₽. Бесплатная доставка.',
                      style: TextStyle(color: Color(0xFFCCCCCC), fontSize: 14),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        // Кликабельная кнопка 24/7
                        GestureDetector(
                          onTap: () => _showFeatureInfo(
                            context,
                            '🕐 Круглосуточная работа',
                            'Мы работаем без выходных 24 часа в сутки, 7 дней в неделю!\n\nЗаказывайте любимые блюда в любое время дня и ночи.',
                          ),
                          child: _buildFeature(Icons.access_time, '24/7'),
                        ),
                        const SizedBox(width: 24),
                        // Кликабельная кнопка доставка
                        GestureDetector(
                          onTap: () => _showFeatureInfo(
                            context,
                            '🚚 Быстрая доставка',
                            'Среднее время доставки — до 45 минут.\n\nМы заботимся о том, чтобы ваша еда приезжала горячей и свежей!',
                          ),
                          child: _buildFeature(Icons.delivery_dining, 'до 45 минут'),
                        ),
                        const SizedBox(width: 24),
                        // Кликабельная кнопка минимальный заказ
                        GestureDetector(
                          onTap: () => _showFeatureInfo(
                            context,
                            '💰 Минимальный заказ',
                            'Минимальная сумма заказа — 450 ₽.\n\nДоставка по городу — БЕСПЛАТНО!\n\nНочная скидка 10% с 00:00 до 06:00.',
                          ),
                          child: _buildFeature(Icons.currency_ruble, 'от 450 ₽'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '🌙 Ночные сеты',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Спецпредложения с 00:00 до 06:00. Скидка до 170 ₽',
                  style: TextStyle(color: Color(0xFFAAAAAA)),
                ),
                const SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    mainAxisExtent: 340,
                  ),
                  itemCount: MenuData.nightSets.length,
                  itemBuilder: (context, index) {
                    return NightSetCard(set: MenuData.nightSets[index]);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeature(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: const Color(0xFFFF6B00)),
        const SizedBox(width: 6),
        Text(text, style: const TextStyle(color: Colors.white, fontSize: 13)),
      ],
    );
  }
}
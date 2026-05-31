import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/menu_card.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Наше меню'),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: '🍔 Бургеры'),
                Tab(text: '🍟 Закуски'),
                Tab(text: '🍲 Домашняя'),
                Tab(text: '🍗 Курица'),
                Tab(text: '🥤 Напитки'),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildMenuGrid(MenuData.burgers),
            _buildMenuGrid(MenuData.snacks),
            _buildMenuGrid(MenuData.homeFood),
            _buildMenuGrid(MenuData.chicken),
            _buildMenuGrid(MenuData.drinks),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuGrid(List<dynamic> items) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 300,  // Увеличено для fitWidth
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return MenuCard(item: items[index]);
      },
    );
  }
}
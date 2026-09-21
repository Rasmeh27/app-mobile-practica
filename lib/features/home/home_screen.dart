import 'package:flutter/material.dart';

import '../../app/app_theme.dart';
import '../category/category_screen.dart';
import 'category_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quiz App',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: AppTheme.background,
          padding: const EdgeInsets.all(16),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.92,
            children: [
              CategoryCard(
                icon: '📚',
                title: 'General Knowledge',
                subtitle: 'Test your general knowledge',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const CategoryScreen(
                        title: 'General Knowledge',
                        segment: 'general',
                      ),
                    ),
                  );
                },
              ),
              CategoryCard(
                icon: '🔬',
                title: 'Science',
                subtitle: 'Questions about science and nature',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const CategoryScreen(
                        title: 'Science',
                        segment: 'science',
                      ),
                    ),
                  );
                },
              ),
              CategoryCard(
                icon: '🏛️',
                title: 'History',
                subtitle: 'Historical events and figures',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const CategoryScreen(
                        title: 'History',
                        segment: 'history',
                      ),
                    ),
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
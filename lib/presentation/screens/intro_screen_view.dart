import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/app_coordinator/app_coordinator.dart';

final List<Map<String, dynamic>> introPages = [
  {
    'icon': Icons.rocket_launch,
    'title': 'Hızlı Başlangıç',
    'description': 'Uygulamaya hemen dalın ve keşfetmeye başlayın.',
    'color': Colors.blue,
  },
  {
    'icon': Icons.design_services,
    'title': 'Özelleştirilebilir',
    'description':
        'Ayarları kendinize göre düzenleyin ve deneyiminizi kişiselleştirin.',
    'color': Colors.green,
  },
  {
    'icon': Icons.thumb_up_alt,
    'title': 'Kullanıma Hazır',
    'description': 'Tüm özellikler parmaklarınızın ucunda sizi bekliyor.',
    'color': Colors.purple,
  },
];

class IntroScreenView extends StatefulWidget {
  const IntroScreenView({super.key});

  @override
  State<IntroScreenView> createState() => _IntroScreenView();
}

class _IntroScreenView extends State<IntroScreenView> {
  int _currentPage = 0;
  Appcoordinator appcoordinator = Appcoordinator();

  void _goNextPage() {
    setState(() {
      if (_currentPage < 2) {
        _currentPage = _currentPage + 1;
      } else if (_currentPage == 2) {
        appcoordinator.navigateToMain();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final introPage = introPages[_currentPage];
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
        color: introPage['color'] as Color,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 700),
              child: Column(
                key: ValueKey<int>(_currentPage),
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    introPage['icon'] as IconData,
                    size: 100.0,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 30.0),
                  Text(
                    introPage['title'] as String,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15.0),
                  _descriptionText(introPage['description']),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {
            _goNextPage();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          ),
          child: Text(
            _currentPage == introPage.length - 1 ? 'Bitir' : 'İleri',
            style: TextStyle(fontSize: 18, color: introPage['color'] as Color),
          ),
        ),
      ),
    );
  }

  Widget _descriptionText(String description) {
    return Text(
      description,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.white70, fontSize: 18.0),
    );
  }
}

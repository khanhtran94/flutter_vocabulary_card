part of '../app/vocabulary_app.dart';

class ScreenGalleryPage extends StatelessWidget {
  const ScreenGalleryPage({super.key});

  static final screens = <_DemoScreen>[
    _DemoScreen('1. Dashboard / Home', Icons.home_outlined, (c) => const DashboardScreen()),
    _DemoScreen('2. Paste Text screen', Icons.paste_outlined, (c) => const PasteTextScreen()),
    _DemoScreen('3. Extracted Vocabulary Preview', Icons.view_list_outlined, (c) => const ExtractedPreviewScreen()),
    _DemoScreen('4. Flashcard Created Success', Icons.check_circle_outline, (c) => const FlashcardCreatedSuccessScreen()),
    _DemoScreen('5. Study Today screen', Icons.today_outlined, (c) => const StudyTodayScreen()),
    _DemoScreen('6. Flashcard Study screen', Icons.style_outlined, (c) => const FlashcardStudyScreen()),
    _DemoScreen('7. Multiple Choice Quiz screen', Icons.quiz_outlined, (c) => const MultipleChoiceQuizScreen()),
    _DemoScreen('8. Typing Quiz screen', Icons.keyboard_alt_outlined, (c) => const TypingQuizScreen()),
    _DemoScreen('9. Study Result screen', Icons.emoji_events_outlined, (c) => const StudyResultScreen()),
    _DemoScreen('10. Vocabulary Library screen', Icons.library_books_outlined, (c) => const VocabularyLibraryScreen()),
    _DemoScreen('11. Flashcard Detail screen', Icons.chrome_reader_mode_outlined, (c) => const FlashcardDetailScreen()),
    _DemoScreen('12. Review Calendar screen', Icons.calendar_month_outlined, (c) => const ReviewCalendarScreen()),
    _DemoScreen('13. Statistics screen', Icons.bar_chart_outlined, (c) => const StatisticsScreen()),
    _DemoScreen('14. Settings screen', Icons.settings_outlined, (c) => const SettingsScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Scaffold(
      appBar: AppBar(
        title: const Text('VocabFlow Screens'),
        backgroundColor: AppColors.background,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(scale.w(16)),
          children: [
            _GalleryHeader(scale: scale),
            SizedBox(height: scale.h(16)),
            ...screens.map(
              (screen) => Padding(
                padding: EdgeInsets.only(bottom: scale.h(12)),
                child: _GalleryTile(
                  screen: screen,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => screen.builder(context)),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GalleryHeader extends StatelessWidget {
  const _GalleryHeader({required this.scale});

  final Scale scale;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(scale.w(20)),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(scale.r(24)),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'UI mockups',
            style: TextStyle(
              fontSize: scale.sp(28),
              fontWeight: FontWeight.w700,
              color: AppColors.text,
            ),
          ),
          SizedBox(height: scale.h(8)),
          Text(
            'Responsive layout with Android screen scaling based on a 390×844 design frame.',
            style: TextStyle(
              fontSize: scale.sp(15),
              height: 1.45,
              color: AppColors.textSoft,
            ),
          ),
        ],
      ),
    );
  }
}

class _GalleryTile extends StatelessWidget {
  const _GalleryTile({required this.screen, required this.onTap});

  final _DemoScreen screen;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(scale.r(18)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(scale.r(18)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: scale.w(16), vertical: scale.h(16)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(scale.r(18)),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: [
              Container(
                width: scale.w(48),
                height: scale.w(48),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(scale.r(14)),
                ),
                child: Icon(screen.icon, color: AppColors.primary, size: scale.w(24)),
              ),
              SizedBox(width: scale.w(14)),
              Expanded(
                child: Text(
                  screen.title,
                  style: TextStyle(
                    fontSize: scale.sp(16),
                    fontWeight: FontWeight.w600,
                    color: AppColors.text,
                  ),
                ),
              ),
              Icon(Icons.chevron_right, color: AppColors.textMuted, size: scale.w(22)),
            ],
          ),
        ),
      ),
    );
  }
}

class _DemoScreen {
  const _DemoScreen(this.title, this.icon, this.builder);

  final String title;
  final IconData icon;
  final WidgetBuilder builder;
}

class AppShell extends StatelessWidget {
  const AppShell({
    super.key,
    required this.title,
    required this.child,
    this.showBottomNav = true,
    this.selectedIndex = 0,
  });

  final String title;
  final Widget child;
  final bool showBottomNav;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Text(title),
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: scale.w(16)),
            child: const CircleAvatar(
              radius: 16,
              backgroundColor: AppColors.surfaceMuted,
              child: Icon(Icons.person, size: 18, color: AppColors.textSoft),
            ),
          ),
        ],
      ),
      body: SafeArea(child: child),
      bottomNavigationBar: showBottomNav ? _BottomNav(selectedIndex: selectedIndex) : null,
    );
  }
}

class _BottomNav extends StatelessWidget {
  const _BottomNav({required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    const items = [
      (Icons.home_outlined, 'Trang chủ'),
      (Icons.school_outlined, 'Học tập'),
      (Icons.collections_bookmark_outlined, 'Bộ thẻ'),
      (Icons.person_outline, 'Cá nhân'),
    ];
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: scale.w(8), vertical: scale.h(6)),
          child: Row(
            children: List.generate(items.length, (index) {
              final item = items[index];
              final active = index == selectedIndex;
              return Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: scale.h(10)),
                  decoration: BoxDecoration(
                    color: active ? AppColors.primary.withValues(alpha: 0.10) : Colors.transparent,
                    borderRadius: BorderRadius.circular(scale.r(14)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(item.$1, color: active ? AppColors.primary : AppColors.textMuted, size: scale.w(22)),
                      SizedBox(height: scale.h(4)),
                      Text(
                        item.$2,
                        style: TextStyle(
                          fontSize: scale.sp(11),
                          fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                          color: active ? AppColors.primary : AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}



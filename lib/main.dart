import 'dart:math' as math;

import 'package:flutter/material.dart';

void main() {
  runApp(const VocabularyApp());
}

class VocabularyApp extends StatelessWidget {
  const VocabularyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VocabFlow',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.light,
          surface: AppColors.surface,
        ).copyWith(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          tertiary: AppColors.tertiary,
          surface: AppColors.surface,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            height: 1.25,
            letterSpacing: -0.4,
          ),
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            height: 1.25,
          ),
          headlineSmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            height: 1.25,
          ),
          bodyLarge: TextStyle(
            fontSize: 18,
            height: 1.45,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            height: 1.45,
          ),
          bodySmall: TextStyle(
            fontSize: 14,
            height: 1.4,
          ),
        ),
      ),
      home: const ScreenGalleryPage(),
    );
  }
}

class AppColors {
  static const background = Color(0xFFF8FAFC);
  static const surface = Colors.white;
  static const surfaceSoft = Color(0xFFF1F5F9);
  static const surfaceMuted = Color(0xFFE2E8F0);
  static const primary = Color(0xFF3B82F6);
  static const primaryDark = Color(0xFF2563EB);
  static const secondary = Color(0xFF10B981);
  static const tertiary = Color(0xFFFCA5A5);
  static const danger = Color(0xFFF87171);
  static const text = Color(0xFF0F172A);
  static const textSoft = Color(0xFF475569);
  static const textMuted = Color(0xFF94A3B8);
  static const border = Color(0xFFE2E8F0);
}

class Scale {
  Scale._(this.context)
      : width = MediaQuery.sizeOf(context).width,
        height = MediaQuery.sizeOf(context).height {
    wFactor = width / 390.0;
    hFactor = height / 844.0;
    textFactor = math.min(wFactor, hFactor);
  }

  final BuildContext context;
  final double width;
  final double height;
  late final double wFactor;
  late final double hFactor;
  late final double textFactor;

  double w(double value) => value * wFactor;
  double h(double value) => value * hFactor;
  double sp(double value) => value * textFactor;
  double r(double value) => value * math.min(wFactor, hFactor);
}

extension ScaleX on BuildContext {
  Scale get scale => Scale._(this);
}

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
                  color: AppColors.primary.withOpacity(0.12),
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
                    color: active ? AppColors.primary.withOpacity(0.10) : Colors.transparent,
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

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return AppShell(
      title: 'Xin chào, Minh',
      selectedIndex: 0,
      child: ListView(
        padding: EdgeInsets.fromLTRB(scale.w(16), scale.h(8), scale.w(16), scale.h(24)),
        children: [
          _HeroCard(
            title: 'Hôm nay bạn đã học 18 từ',
            subtitle: 'Còn 6 từ nữa để hoàn thành mục tiêu 30 từ.',
            progress: 0.6,
            buttonText: 'Bắt đầu học',
          ),
          SizedBox(height: scale.h(16)),
          Row(
            children: [
              Expanded(child: _StatCard(label: 'Đã nhớ', value: '142', icon: Icons.check_circle_outline, color: AppColors.secondary)),
              SizedBox(width: scale.w(12)),
              Expanded(child: _StatCard(label: 'Cần ôn', value: '28', icon: Icons.refresh_outlined, color: AppColors.danger)),
            ],
          ),
          SizedBox(height: scale.h(16)),
          _SectionHeader(title: 'Lối tắt', action: 'Xem tất cả'),
          SizedBox(height: scale.h(12)),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: scale.w(12),
            mainAxisSpacing: scale.h(12),
            childAspectRatio: 1.55,
            children: const [
              _ShortcutCard(title: 'Dán văn bản', icon: Icons.paste_outlined, color: AppColors.primary),
              _ShortcutCard(title: 'Bộ thẻ', icon: Icons.collections_bookmark_outlined, color: AppColors.secondary),
              _ShortcutCard(title: 'Lịch ôn', icon: Icons.calendar_month_outlined, color: AppColors.tertiary),
              _ShortcutCard(title: 'Thống kê', icon: Icons.bar_chart_outlined, color: AppColors.primaryDark),
            ],
          ),
          SizedBox(height: scale.h(16)),
          _SectionHeader(title: 'Sắp tới', action: 'Chi tiết'),
          SizedBox(height: scale.h(12)),
          const _UpcomingList(),
        ],
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({
    required this.title,
    required this.subtitle,
    required this.progress,
    required this.buttonText,
  });

  final String title;
  final String subtitle;
  final double progress;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Container(
      padding: EdgeInsets.all(scale.w(20)),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(scale.r(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: scale.w(54),
            height: scale.w(54),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.16),
              borderRadius: BorderRadius.circular(scale.r(18)),
            ),
            child: Icon(Icons.auto_stories_outlined, color: Colors.white, size: scale.w(28)),
          ),
          SizedBox(height: scale.h(16)),
          Text(
            title,
            style: TextStyle(
              fontSize: scale.sp(24),
              fontWeight: FontWeight.w700,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          SizedBox(height: scale.h(8)),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: scale.sp(15),
              color: Colors.white.withOpacity(0.88),
              height: 1.45,
            ),
          ),
          SizedBox(height: scale.h(16)),
          ClipRRect(
            borderRadius: BorderRadius.circular(scale.r(999)),
            child: LinearProgressIndicator(
              minHeight: scale.h(8),
              value: progress,
              backgroundColor: Colors.white.withOpacity(0.18),
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.secondary),
            ),
          ),
          SizedBox(height: scale.h(12)),
          SizedBox(
            width: double.infinity,
            height: scale.h(48),
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.primaryDark,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(scale.r(14))),
              ),
              onPressed: () {},
              child: Text(buttonText),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Container(
      padding: EdgeInsets.all(scale.w(16)),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(scale.r(18)),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: scale.w(24)),
          SizedBox(height: scale.h(18)),
          Text(
            value,
            style: TextStyle(fontSize: scale.sp(26), fontWeight: FontWeight.w700, color: AppColors.text),
          ),
          SizedBox(height: scale.h(4)),
          Text(label, style: TextStyle(fontSize: scale.sp(13), color: AppColors.textSoft)),
        ],
      ),
    );
  }
}

class _ShortcutCard extends StatelessWidget {
  const _ShortcutCard({
    required this.title,
    required this.icon,
    required this.color,
  });

  final String title;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Container(
      padding: EdgeInsets.all(scale.w(16)),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(scale.r(18)),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: scale.w(40),
            height: scale.w(40),
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(scale.r(12)),
            ),
            child: Icon(icon, color: color, size: scale.w(22)),
          ),
          Text(
            title,
            style: TextStyle(fontSize: scale.sp(15), fontWeight: FontWeight.w600, color: AppColors.text),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.action});

  final String title;
  final String action;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: scale.sp(18), fontWeight: FontWeight.w700, color: AppColors.text)),
        Text(action, style: TextStyle(fontSize: scale.sp(13), color: AppColors.primary, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class _UpcomingList extends StatelessWidget {
  const _UpcomingList();

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    final items = [
      ('Study today', '08:30', AppColors.primary),
      ('Review flashcards', '12:15', AppColors.secondary),
      ('Quiz practice', '20:00', AppColors.tertiary),
    ];
    return Column(
      children: items
          .map(
            (item) => Padding(
              padding: EdgeInsets.only(bottom: scale.h(12)),
              child: Container(
                padding: EdgeInsets.all(scale.w(16)),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(scale.r(18)),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: [
                    Container(
                      width: scale.w(12),
                      height: scale.w(12),
                      decoration: BoxDecoration(color: item.$3, shape: BoxShape.circle),
                    ),
                    SizedBox(width: scale.w(12)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.$1, style: TextStyle(fontSize: scale.sp(15), fontWeight: FontWeight.w600)),
                          SizedBox(height: scale.h(4)),
                          Text('Ngày hôm nay', style: TextStyle(fontSize: scale.sp(13), color: AppColors.textSoft)),
                        ],
                      ),
                    ),
                    Text(item.$2, style: TextStyle(fontSize: scale.sp(13), color: AppColors.textMuted)),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class PasteTextScreen extends StatelessWidget {
  const PasteTextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return AppShell(
      title: 'Dán văn bản',
      selectedIndex: 0,
      child: ListView(
        padding: EdgeInsets.all(scale.w(16)),
        children: [
          _ScreenTitle(
            title: 'Nhập nội dung cần trích xuất',
            subtitle: 'Dán đoạn văn tiếng Anh vào đây, hệ thống sẽ tạo danh sách từ vựng để học.',
          ),
          SizedBox(height: scale.h(16)),
          _InputPanel(
            height: scale.h(260),
            hint: 'Paste your text here...\n\nThe quick brown fox jumps over the lazy dog.',
          ),
          SizedBox(height: scale.h(16)),
          Row(
            children: [
              Expanded(child: _PillButton(text: 'Tải file', icon: Icons.upload_file_outlined, filled: false)),
              SizedBox(width: scale.w(12)),
              Expanded(child: _PillButton(text: 'Tạo từ vựng', icon: Icons.auto_fix_high_outlined, filled: true)),
            ],
          ),
          SizedBox(height: scale.h(16)),
          const _InfoCard(
            title: 'Mẹo',
            body: 'Văn bản càng rõ nghĩa thì danh sách từ vựng sinh ra càng chính xác.',
            icon: Icons.lightbulb_outline,
          ),
        ],
      ),
    );
  }
}

class ExtractedPreviewScreen extends StatelessWidget {
  const ExtractedPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return AppShell(
      title: 'Xem trước từ vựng',
      selectedIndex: 2,
      child: ListView(
        padding: EdgeInsets.all(scale.w(16)),
        children: [
          _ScreenTitle(
            title: 'Đã trích xuất 18 từ',
            subtitle: 'Kiểm tra, chỉnh sửa hoặc bỏ bớt từ trước khi tạo bộ thẻ.',
          ),
          SizedBox(height: scale.h(16)),
          ...[
            ('abundant', 'dồi dào, phong phú', true),
            ('resilient', 'bền bỉ, kiên cường', true),
            ('subtle', 'tinh tế, khó nhận thấy', false),
            ('anticipate', 'dự đoán trước', true),
          ].map(
            (item) => Padding(
              padding: EdgeInsets.only(bottom: scale.h(12)),
              child: _VocabularyPreviewTile(
                word: item.$1,
                meaning: item.$2,
                selected: item.$3,
              ),
            ),
          ),
          SizedBox(height: scale.h(8)),
          _PillButton(text: 'Tạo flashcards', icon: Icons.style_outlined, filled: true),
        ],
      ),
    );
  }
}

class FlashcardCreatedSuccessScreen extends StatelessWidget {
  const FlashcardCreatedSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return AppShell(
      title: 'Thành công',
      selectedIndex: 2,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(scale.w(16)),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(scale.w(24)),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(scale.r(28)),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: scale.w(92),
                  height: scale.w(92),
                  decoration: BoxDecoration(
                    color: AppColors.secondary.withOpacity(0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.check_circle, color: AppColors.secondary, size: scale.w(54)),
                ),
                SizedBox(height: scale.h(20)),
                Text(
                  'Bộ thẻ đã được tạo',
                  style: TextStyle(fontSize: scale.sp(26), fontWeight: FontWeight.w700, color: AppColors.text),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: scale.h(8)),
                Text(
                  'Bạn có thể bắt đầu học ngay hoặc xem lại danh sách từ.',
                  style: TextStyle(fontSize: scale.sp(15), color: AppColors.textSoft, height: 1.45),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: scale.h(20)),
                Row(
                  children: [
                    Expanded(child: _PillButton(text: 'Xem bộ thẻ', icon: Icons.collections_bookmark_outlined, filled: false)),
                    SizedBox(width: scale.w(12)),
                    Expanded(child: _PillButton(text: 'Học ngay', icon: Icons.play_arrow, filled: true)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StudyTodayScreen extends StatelessWidget {
  const StudyTodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return AppShell(
      title: 'Học hôm nay',
      selectedIndex: 1,
      child: ListView(
        padding: EdgeInsets.all(scale.w(16)),
        children: [
          _ScreenTitle(
            title: '3 bài cần hoàn thành',
            subtitle: 'Danh sách học tập được sắp xếp theo mức độ ưu tiên.',
          ),
          SizedBox(height: scale.h(16)),
          ...[
            ('Flashcards ôn tập', '12 thẻ', 0.72, AppColors.primary),
            ('Multiple choice', '8 câu', 0.42, AppColors.secondary),
            ('Typing quiz', '10 câu', 0.18, AppColors.tertiary),
          ].map(
            (item) => Padding(
              padding: EdgeInsets.only(bottom: scale.h(12)),
              child: _StudyPlanCard(
                title: item.$1,
                detail: item.$2,
                progress: item.$3,
                color: item.$4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FlashcardStudyScreen extends StatelessWidget {
  const FlashcardStudyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return AppShell(
      title: 'Flashcard học',
      selectedIndex: 1,
      child: Padding(
        padding: EdgeInsets.all(scale.w(16)),
        child: Column(
          children: [
            _ScreenTitle(
              title: '1 / 12',
              subtitle: 'Chạm để lật thẻ. Kéo sang trái/phải để chuyển thẻ.',
            ),
            SizedBox(height: scale.h(16)),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(scale.w(24)),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(scale.r(28)),
                  border: Border.all(color: AppColors.border),
                  boxShadow: const [
                    BoxShadow(color: Color(0x0D000000), blurRadius: 20, offset: Offset(0, 8)),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Text('abundant', style: TextStyle(fontSize: scale.sp(14), color: AppColors.textMuted)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'phong phú',
                          style: TextStyle(fontSize: scale.sp(28), fontWeight: FontWeight.w700, color: AppColors.text),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: scale.h(12)),
                        Container(width: scale.w(56), height: 1, color: AppColors.border),
                        SizedBox(height: scale.h(12)),
                        Text(
                          'Example: The region has abundant rainfall.',
                          style: TextStyle(fontSize: scale.sp(16), color: AppColors.textSoft, height: 1.5),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: _ActionChip(text: 'Cần xem lại', color: AppColors.danger, icon: Icons.close)),
                        SizedBox(width: scale.w(12)),
                        Expanded(child: _ActionChip(text: 'Tôi nhớ', color: AppColors.secondary, icon: Icons.check)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MultipleChoiceQuizScreen extends StatelessWidget {
  const MultipleChoiceQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return AppShell(
      title: 'Trắc nghiệm',
      selectedIndex: 1,
      child: ListView(
        padding: EdgeInsets.all(scale.w(16)),
        children: [
          _QuizProgress(scale: scale, progress: 0.4, label: 'Câu 4 / 10'),
          SizedBox(height: scale.h(20)),
          Text(
            '“subtle” nghĩa là gì?',
            style: TextStyle(fontSize: scale.sp(26), fontWeight: FontWeight.w700, color: AppColors.text, height: 1.25),
          ),
          SizedBox(height: scale.h(16)),
          ...[
            'Rõ ràng, dễ nhận thấy',
            'Tinh tế, khó nhận ra',
            'Đông đúc, hỗn loạn',
            'Rộng lớn, bao la',
          ].map(
            (answer) => Padding(
              padding: EdgeInsets.only(bottom: scale.h(12)),
              child: _AnswerOption(text: answer, selected: answer == 'Tinh tế, khó nhận ra'),
            ),
          ),
          SizedBox(height: scale.h(8)),
          _PillButton(text: 'Tiếp tục', icon: Icons.arrow_forward, filled: true),
        ],
      ),
    );
  }
}

class TypingQuizScreen extends StatelessWidget {
  const TypingQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return AppShell(
      title: 'Điền từ',
      selectedIndex: 1,
      child: ListView(
        padding: EdgeInsets.all(scale.w(16)),
        children: [
          _QuizProgress(scale: scale, progress: 0.8, label: 'Câu 8 / 10'),
          SizedBox(height: scale.h(20)),
          Text(
            'Nhập từ tiếng Anh cho nghĩa: “kiên cường, bền bỉ”',
            style: TextStyle(fontSize: scale.sp(22), fontWeight: FontWeight.w700, color: AppColors.text, height: 1.3),
          ),
          SizedBox(height: scale.h(16)),
          _InputPanel(height: scale.h(64), hint: 'Type your answer'),
          SizedBox(height: scale.h(16)),
          Row(
            children: [
              Expanded(child: _PillButton(text: 'Gợi ý', icon: Icons.tips_and_updates_outlined, filled: false)),
              SizedBox(width: scale.w(12)),
              Expanded(child: _PillButton(text: 'Nộp', icon: Icons.send_outlined, filled: true)),
            ],
          ),
        ],
      ),
    );
  }
}

class StudyResultScreen extends StatelessWidget {
  const StudyResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return AppShell(
      title: 'Kết quả',
      selectedIndex: 1,
      child: ListView(
        padding: EdgeInsets.all(scale.w(16)),
        children: [
          Container(
            padding: EdgeInsets.all(scale.w(24)),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(scale.r(28)),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              children: [
                Text('92%', style: TextStyle(fontSize: scale.sp(48), fontWeight: FontWeight.w800, color: AppColors.primary)),
                SizedBox(height: scale.h(8)),
                Text('Hoàn thành xuất sắc', style: TextStyle(fontSize: scale.sp(22), fontWeight: FontWeight.w700)),
                SizedBox(height: scale.h(12)),
                Text(
                  'Bạn đã trả lời đúng 23/25 câu hỏi.',
                  style: TextStyle(fontSize: scale.sp(15), color: AppColors.textSoft),
                ),
                SizedBox(height: scale.h(20)),
                Row(
                  children: const [
                    Expanded(child: _ResultMetric(label: 'Đúng', value: '23', color: AppColors.secondary)),
                    SizedBox(width: 12),
                    Expanded(child: _ResultMetric(label: 'Sai', value: '2', color: AppColors.danger)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: scale.h(16)),
          _PillButton(text: 'Ôn lại lỗi sai', icon: Icons.refresh_outlined, filled: false),
          SizedBox(height: scale.h(12)),
          _PillButton(text: 'Tiếp tục học', icon: Icons.arrow_forward, filled: true),
        ],
      ),
    );
  }
}

class VocabularyLibraryScreen extends StatelessWidget {
  const VocabularyLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return AppShell(
      title: 'Bộ thẻ',
      selectedIndex: 2,
      child: ListView(
        padding: EdgeInsets.all(scale.w(16)),
        children: [
          _InputPanel(height: scale.h(52), hint: 'Tìm từ, cụm từ hoặc bộ thẻ'),
          SizedBox(height: scale.h(16)),
          Row(
            children: [
              Expanded(child: _FilterChip(text: 'Tất cả', selected: true)),
              SizedBox(width: scale.w(8)),
              Expanded(child: _FilterChip(text: 'Đang học', selected: false)),
              SizedBox(width: scale.w(8)),
              Expanded(child: _FilterChip(text: 'Đã nhớ', selected: false)),
            ],
          ),
          SizedBox(height: scale.h(16)),
          ...[
            ('Everyday Vocabulary', '42 từ', 'Cập nhật 2 giờ trước'),
            ('Business English', '18 từ', 'Đang học'),
            ('Academic Terms', '76 từ', 'Đã hoàn thành 68%'),
          ].map(
            (item) => Padding(
              padding: EdgeInsets.only(bottom: scale.h(12)),
              child: _LibraryCard(title: item.$1, count: item.$2, subtitle: item.$3),
            ),
          ),
        ],
      ),
    );
  }
}

class FlashcardDetailScreen extends StatelessWidget {
  const FlashcardDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return AppShell(
      title: 'Chi tiết thẻ',
      selectedIndex: 2,
      child: ListView(
        padding: EdgeInsets.all(scale.w(16)),
        children: [
          Container(
            padding: EdgeInsets.all(scale.w(24)),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(scale.r(28)),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('abundant', style: TextStyle(fontSize: scale.sp(30), fontWeight: FontWeight.w700)),
                SizedBox(height: scale.h(12)),
                Text('phong phú, dồi dào', style: TextStyle(fontSize: scale.sp(20), color: AppColors.primaryDark)),
                SizedBox(height: scale.h(16)),
                Container(height: 1, color: AppColors.border),
                SizedBox(height: scale.h(16)),
                Text(
                  'Example sentence',
                  style: TextStyle(fontSize: scale.sp(13), fontWeight: FontWeight.w700, color: AppColors.textMuted),
                ),
                SizedBox(height: scale.h(6)),
                Text(
                  'The region receives abundant rainfall in the monsoon season.',
                  style: TextStyle(fontSize: scale.sp(16), color: AppColors.textSoft, height: 1.5),
                ),
              ],
            ),
          ),
          SizedBox(height: scale.h(16)),
          Row(
            children: [
              Expanded(child: _PillButton(text: 'Sửa', icon: Icons.edit_outlined, filled: false)),
              SizedBox(width: scale.w(12)),
              Expanded(child: _PillButton(text: 'Ôn ngay', icon: Icons.play_arrow, filled: true)),
            ],
          ),
        ],
      ),
    );
  }
}

class ReviewCalendarScreen extends StatelessWidget {
  const ReviewCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return AppShell(
      title: 'Lịch ôn',
      selectedIndex: 2,
      child: ListView(
        padding: EdgeInsets.all(scale.w(16)),
        children: [
          _CalendarHeader(scale: scale),
          SizedBox(height: scale.h(16)),
          _CalendarGrid(scale: scale),
          SizedBox(height: scale.h(16)),
          const _InfoCard(
            title: 'Gợi ý',
            body: 'Các ô màu đậm là ngày bạn đã học nhiều từ hơn mức trung bình.',
            icon: Icons.info_outline,
          ),
        ],
      ),
    );
  }
}

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return AppShell(
      title: 'Thống kê',
      selectedIndex: 2,
      child: ListView(
        padding: EdgeInsets.all(scale.w(16)),
        children: [
          Row(
            children: [
              Expanded(child: _StatCard(label: 'Từ đã học', value: '312', icon: Icons.menu_book_outlined, color: AppColors.primary)),
              SizedBox(width: scale.w(12)),
              Expanded(child: _StatCard(label: 'Chuỗi ngày', value: '18', icon: Icons.local_fire_department_outlined, color: AppColors.secondary)),
            ],
          ),
          SizedBox(height: scale.h(16)),
          Container(
            padding: EdgeInsets.all(scale.w(20)),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(scale.r(24)),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tiến độ 7 ngày', style: TextStyle(fontSize: scale.sp(18), fontWeight: FontWeight.w700)),
                SizedBox(height: scale.h(16)),
                SizedBox(
                  height: scale.h(180),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      _Bar(heightFactor: 0.35, label: 'T2'),
                      _Bar(heightFactor: 0.52, label: 'T3'),
                      _Bar(heightFactor: 0.42, label: 'T4'),
                      _Bar(heightFactor: 0.72, label: 'T5'),
                      _Bar(heightFactor: 0.88, label: 'T6'),
                      _Bar(heightFactor: 0.61, label: 'T7'),
                      _Bar(heightFactor: 0.48, label: 'CN'),
                    ],
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

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return AppShell(
      title: 'Cài đặt',
      selectedIndex: 3,
      child: ListView(
        padding: EdgeInsets.all(scale.w(16)),
        children: [
          Container(
            padding: EdgeInsets.all(scale.w(20)),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(scale.r(24)),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: scale.w(28),
                  backgroundColor: AppColors.primary.withOpacity(0.12),
                  child: Icon(Icons.person, color: AppColors.primary, size: scale.w(28)),
                ),
                SizedBox(width: scale.w(16)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Minh Trần', style: TextStyle(fontSize: scale.sp(18), fontWeight: FontWeight.w700)),
                    SizedBox(height: scale.h(4)),
                    Text('Premium learner', style: TextStyle(fontSize: scale.sp(13), color: AppColors.textSoft)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: scale.h(16)),
          ...[
            ('Thông báo', Icons.notifications_none_outlined),
            ('Ngôn ngữ', Icons.language_outlined),
            ('Đồng bộ', Icons.sync_outlined),
            ('Trợ giúp', Icons.help_outline),
          ].map(
            (item) => Padding(
              padding: EdgeInsets.only(bottom: scale.h(12)),
              child: _SettingsRow(title: item.$1, icon: item.$2),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScreenTitle extends StatelessWidget {
  const _ScreenTitle({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: scale.sp(26), fontWeight: FontWeight.w700, color: AppColors.text, height: 1.2),
        ),
        SizedBox(height: scale.h(8)),
        Text(
          subtitle,
          style: TextStyle(fontSize: scale.sp(15), color: AppColors.textSoft, height: 1.45),
        ),
      ],
    );
  }
}

class _InputPanel extends StatelessWidget {
  const _InputPanel({required this.height, required this.hint});

  final double height;
  final String hint;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Container(
      height: height,
      padding: EdgeInsets.all(scale.w(16)),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(scale.r(20)),
        border: Border.all(color: AppColors.border),
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          hint,
          style: TextStyle(fontSize: scale.sp(15), color: AppColors.textMuted, height: 1.5),
        ),
      ),
    );
  }
}

class _PillButton extends StatelessWidget {
  const _PillButton({required this.text, required this.icon, required this.filled});

  final String text;
  final IconData icon;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return SizedBox(
      height: scale.h(48),
      child: filled
          ? FilledButton.icon(
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(scale.r(14))),
              ),
              onPressed: () {},
              icon: Icon(icon, size: scale.w(18)),
              label: Text(text),
            )
          : OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primary,
                side: const BorderSide(color: AppColors.border),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(scale.r(14))),
              ),
              onPressed: () {},
              icon: Icon(icon, size: scale.w(18)),
              label: Text(text),
            ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.title, required this.body, required this.icon});

  final String title;
  final String body;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Container(
      padding: EdgeInsets.all(scale.w(16)),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(scale.r(18)),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primary, size: scale.w(22)),
          SizedBox(width: scale.w(12)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: scale.sp(15), fontWeight: FontWeight.w700)),
                SizedBox(height: scale.h(4)),
                Text(body, style: TextStyle(fontSize: scale.sp(14), color: AppColors.textSoft, height: 1.45)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VocabularyPreviewTile extends StatelessWidget {
  const _VocabularyPreviewTile({
    required this.word,
    required this.meaning,
    required this.selected,
  });

  final String word;
  final String meaning;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Container(
      padding: EdgeInsets.all(scale.w(16)),
      decoration: BoxDecoration(
        color: selected ? AppColors.primary.withOpacity(0.08) : AppColors.surface,
        borderRadius: BorderRadius.circular(scale.r(18)),
        border: Border.all(color: selected ? AppColors.primary.withOpacity(0.25) : AppColors.border),
      ),
      child: Row(
        children: [
          Checkbox(
            value: selected,
            onChanged: (_) {},
            activeColor: AppColors.primary,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(word, style: TextStyle(fontSize: scale.sp(17), fontWeight: FontWeight.w700)),
                SizedBox(height: scale.h(4)),
                Text(meaning, style: TextStyle(fontSize: scale.sp(14), color: AppColors.textSoft)),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: AppColors.textMuted, size: scale.w(22)),
        ],
      ),
    );
  }
}

class _StudyPlanCard extends StatelessWidget {
  const _StudyPlanCard({
    required this.title,
    required this.detail,
    required this.progress,
    required this.color,
  });

  final String title;
  final String detail;
  final double progress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Container(
      padding: EdgeInsets.all(scale.w(16)),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(scale.r(18)),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: scale.w(40),
                height: scale.w(40),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(scale.r(12)),
                ),
                child: Icon(Icons.task_alt_outlined, color: color, size: scale.w(22)),
              ),
              SizedBox(width: scale.w(12)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontSize: scale.sp(16), fontWeight: FontWeight.w700)),
                    SizedBox(height: scale.h(4)),
                    Text(detail, style: TextStyle(fontSize: scale.sp(13), color: AppColors.textSoft)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: scale.h(14)),
          ClipRRect(
            borderRadius: BorderRadius.circular(scale.r(999)),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: scale.h(8),
              backgroundColor: AppColors.surfaceMuted,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuizProgress extends StatelessWidget {
  const _QuizProgress({required this.scale, required this.progress, required this.label});

  final Scale scale;
  final double progress;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: TextStyle(fontSize: scale.sp(14), color: AppColors.textSoft)),
            Text('${(progress * 100).round()}%', style: TextStyle(fontSize: scale.sp(14), color: AppColors.primary, fontWeight: FontWeight.w700)),
          ],
        ),
        SizedBox(height: scale.h(8)),
        ClipRRect(
          borderRadius: BorderRadius.circular(scale.r(999)),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: scale.h(8),
            backgroundColor: AppColors.surfaceMuted,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.secondary),
          ),
        ),
      ],
    );
  }
}

class _AnswerOption extends StatelessWidget {
  const _AnswerOption({required this.text, required this.selected});

  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Container(
      padding: EdgeInsets.all(scale.w(16)),
      decoration: BoxDecoration(
        color: selected ? AppColors.primary.withOpacity(0.10) : AppColors.surface,
        borderRadius: BorderRadius.circular(scale.r(18)),
        border: Border.all(color: selected ? AppColors.primary : AppColors.border),
      ),
      child: Row(
        children: [
          Icon(selected ? Icons.radio_button_checked : Icons.radio_button_off, color: selected ? AppColors.primary : AppColors.textMuted),
          SizedBox(width: scale.w(12)),
          Expanded(
            child: Text(text, style: TextStyle(fontSize: scale.sp(15), fontWeight: selected ? FontWeight.w700 : FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}

class _ActionChip extends StatelessWidget {
  const _ActionChip({required this.text, required this.color, required this.icon});

  final String text;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return SizedBox(
      height: scale.h(48),
      child: FilledButton.icon(
        style: FilledButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(scale.r(14))),
        ),
        onPressed: () {},
        icon: Icon(icon, size: scale.w(18)),
        label: Text(text),
      ),
    );
  }
}

class _ResultMetric extends StatelessWidget {
  const _ResultMetric({required this.label, required this.value, required this.color});

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Container(
      padding: EdgeInsets.all(scale.w(16)),
      decoration: BoxDecoration(
        color: color.withOpacity(0.10),
        borderRadius: BorderRadius.circular(scale.r(18)),
      ),
      child: Column(
        children: [
          Text(value, style: TextStyle(fontSize: scale.sp(26), fontWeight: FontWeight.w800, color: color)),
          SizedBox(height: scale.h(4)),
          Text(label, style: TextStyle(fontSize: scale.sp(13), color: AppColors.textSoft)),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.text, required this.selected});

  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Container(
      padding: EdgeInsets.symmetric(vertical: scale.h(10)),
      decoration: BoxDecoration(
        color: selected ? AppColors.primary : AppColors.surface,
        borderRadius: BorderRadius.circular(scale.r(14)),
        border: Border.all(color: selected ? AppColors.primary : AppColors.border),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: scale.sp(13),
          fontWeight: FontWeight.w600,
          color: selected ? Colors.white : AppColors.textSoft,
        ),
      ),
    );
  }
}

class _LibraryCard extends StatelessWidget {
  const _LibraryCard({required this.title, required this.count, required this.subtitle});

  final String title;
  final String count;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Container(
      padding: EdgeInsets.all(scale.w(16)),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(scale.r(18)),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: scale.w(52),
            height: scale.w(52),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.10),
              borderRadius: BorderRadius.circular(scale.r(16)),
            ),
            child: Icon(Icons.collections_bookmark_outlined, color: AppColors.primary, size: scale.w(26)),
          ),
          SizedBox(width: scale.w(14)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: scale.sp(16), fontWeight: FontWeight.w700)),
                SizedBox(height: scale.h(4)),
                Text(subtitle, style: TextStyle(fontSize: scale.sp(13), color: AppColors.textSoft)),
              ],
            ),
          ),
          Text(count, style: TextStyle(fontSize: scale.sp(13), color: AppColors.textMuted)),
        ],
      ),
    );
  }
}

class _SettingsRow extends StatelessWidget {
  const _SettingsRow({required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: scale.w(16), vertical: scale.h(16)),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(scale.r(18)),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.textSoft),
          SizedBox(width: scale.w(12)),
          Expanded(
            child: Text(title, style: TextStyle(fontSize: scale.sp(15), fontWeight: FontWeight.w600)),
          ),
          Icon(Icons.chevron_right, color: AppColors.textMuted, size: scale.w(22)),
        ],
      ),
    );
  }
}

class _CalendarHeader extends StatelessWidget {
  const _CalendarHeader({required this.scale});

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tháng 6, 2026', style: TextStyle(fontSize: scale.sp(20), fontWeight: FontWeight.w700)),
              SizedBox(height: scale.h(4)),
              Text('Lịch ôn cá nhân hóa', style: TextStyle(fontSize: scale.sp(13), color: AppColors.textSoft)),
            ],
          ),
          const Icon(Icons.calendar_month, color: AppColors.primary),
        ],
      ),
    );
  }
}

class _CalendarGrid extends StatelessWidget {
  const _CalendarGrid({required this.scale});

  final Scale scale;

  @override
  Widget build(BuildContext context) {
    const days = [
      'M',
      'T',
      'W',
      'T',
      'F',
      'S',
      'S',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
      '11',
      '12',
      '13',
      '14',
      '15',
      '16',
      '17',
      '18',
      '19',
      '20',
      '21',
      '22',
      '23',
      '24',
      '25',
      '26',
      '27',
      '28',
      '29',
      '30',
    ];

    return Container(
      padding: EdgeInsets.all(scale.w(16)),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(scale.r(24)),
        border: Border.all(color: AppColors.border),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: days.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          mainAxisSpacing: scale.w(8),
          crossAxisSpacing: scale.w(8),
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final item = days[index];
          final isHeader = index < 7;
          final isActive = item == '18';
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isActive ? AppColors.primary : isHeader ? Colors.transparent : AppColors.surfaceSoft,
              borderRadius: BorderRadius.circular(scale.r(12)),
            ),
            child: Text(
              item,
              style: TextStyle(
                fontSize: scale.sp(13),
                fontWeight: isHeader || isActive ? FontWeight.w700 : FontWeight.w500,
                color: isActive ? Colors.white : isHeader ? AppColors.textMuted : AppColors.textSoft,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Bar extends StatelessWidget {
  const _Bar({required this.heightFactor, required this.label});

  final double heightFactor;
  final String label;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: scale.h(120) * heightFactor,
            width: scale.w(18),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(scale.r(999)),
            ),
          ),
          SizedBox(height: scale.h(8)),
          Text(label, style: TextStyle(fontSize: scale.sp(12), color: AppColors.textMuted)),
        ],
      ),
    );
  }
}

part of vocabulary_app;

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
      (Icons.home_outlined, 'Trang ch?'),
      (Icons.school_outlined, 'H?c t?p'),
      (Icons.collections_bookmark_outlined, 'B? th?'),
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
              Text('L?ch ôn cá nhân hóa', style: TextStyle(fontSize: scale.sp(13), color: AppColors.textSoft)),
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

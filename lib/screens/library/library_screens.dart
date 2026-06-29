part of vocabulary_app;

class VocabularyLibraryScreen extends StatelessWidget {
  const VocabularyLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return AppShell(
      title: 'B? th?',
      selectedIndex: 2,
      child: ListView(
        padding: EdgeInsets.all(scale.w(16)),
        children: [
          _InputPanel(height: scale.h(52), hint: 'Tìm t?, c?m t? ho?c b? th?'),
          SizedBox(height: scale.h(16)),
          Row(
            children: [
              Expanded(child: _FilterChip(text: 'T?t c?', selected: true)),
              SizedBox(width: scale.w(8)),
              Expanded(child: _FilterChip(text: 'Ðang h?c', selected: false)),
              SizedBox(width: scale.w(8)),
              Expanded(child: _FilterChip(text: 'Ðã nh?', selected: false)),
            ],
          ),
          SizedBox(height: scale.h(16)),
          ...[
            ('Everyday Vocabulary', '42 t?', 'C?p nh?t 2 gi? tru?c'),
            ('Business English', '18 t?', 'Ðang h?c'),
            ('Academic Terms', '76 t?', 'Ðã hoàn thành 68%'),
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
      title: 'Chi ti?t th?',
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
                Text('phong phú, d?i dào', style: TextStyle(fontSize: scale.sp(20), color: AppColors.primaryDark)),
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
              Expanded(child: _PillButton(text: 'S?a', icon: Icons.edit_outlined, filled: false)),
              SizedBox(width: scale.w(12)),
              Expanded(child: _PillButton(text: 'Ôn ngay', icon: Icons.play_arrow, filled: true)),
            ],
          ),
        ],
      ),
    );
  }
}

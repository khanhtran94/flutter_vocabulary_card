part of vocabulary_app;

class PasteTextScreen extends StatelessWidget {
  const PasteTextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return AppShell(
      title: 'Dán van b?n',
      selectedIndex: 0,
      child: ListView(
        padding: EdgeInsets.all(scale.w(16)),
        children: [
          _ScreenTitle(
            title: 'Nh?p n?i dung c?n trích xu?t',
            subtitle: 'Dán do?n van ti?ng Anh vào dây, h? th?ng s? t?o danh sách t? v?ng d? h?c.',
          ),
          SizedBox(height: scale.h(16)),
          _InputPanel(
            height: scale.h(260),
            hint: 'Paste your text here...\n\nThe quick brown fox jumps over the lazy dog.',
          ),
          SizedBox(height: scale.h(16)),
          Row(
            children: [
              Expanded(child: _PillButton(text: 'T?i file', icon: Icons.upload_file_outlined, filled: false)),
              SizedBox(width: scale.w(12)),
              Expanded(child: _PillButton(text: 'T?o t? v?ng', icon: Icons.auto_fix_high_outlined, filled: true)),
            ],
          ),
          SizedBox(height: scale.h(16)),
          const _InfoCard(
            title: 'M?o',
            body: 'Van b?n càng rõ nghia thì danh sách t? v?ng sinh ra càng chính xác.',
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
      title: 'Xem tru?c t? v?ng',
      selectedIndex: 2,
      child: ListView(
        padding: EdgeInsets.all(scale.w(16)),
        children: [
          _ScreenTitle(
            title: 'Ðã trích xu?t 18 t?',
            subtitle: 'Ki?m tra, ch?nh s?a ho?c b? b?t t? tru?c khi t?o b? th?.',
          ),
          SizedBox(height: scale.h(16)),
          ...[
            ('abundant', 'd?i dào, phong phú', true),
            ('resilient', 'b?n b?, kiên cu?ng', true),
            ('subtle', 'tinh t?, khó nh?n th?y', false),
            ('anticipate', 'd? doán tru?c', true),
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
          _PillButton(text: 'T?o flashcards', icon: Icons.style_outlined, filled: true),
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
                  'B? th? dã du?c t?o',
                  style: TextStyle(fontSize: scale.sp(26), fontWeight: FontWeight.w700, color: AppColors.text),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: scale.h(8)),
                Text(
                  'B?n có th? b?t d?u h?c ngay ho?c xem l?i danh sách t?.',
                  style: TextStyle(fontSize: scale.sp(15), color: AppColors.textSoft, height: 1.45),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: scale.h(20)),
                Row(
                  children: [
                    Expanded(child: _PillButton(text: 'Xem b? th?', icon: Icons.collections_bookmark_outlined, filled: false)),
                    SizedBox(width: scale.w(12)),
                    Expanded(child: _PillButton(text: 'H?c ngay', icon: Icons.play_arrow, filled: true)),
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


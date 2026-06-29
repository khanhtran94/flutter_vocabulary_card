part of '../../app/vocabulary_app.dart';

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
                    color: AppColors.secondary.withValues(alpha: 0.12),
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




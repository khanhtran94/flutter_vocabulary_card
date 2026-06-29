part of vocabulary_app;

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



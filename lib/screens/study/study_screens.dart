part of vocabulary_app;

class StudyTodayScreen extends StatelessWidget {
  const StudyTodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return AppShell(
      title: 'H?c hôm nay',
      selectedIndex: 1,
      child: ListView(
        padding: EdgeInsets.all(scale.w(16)),
        children: [
          _ScreenTitle(
            title: '3 bài c?n hoàn thành',
            subtitle: 'Danh sách h?c t?p du?c s?p x?p theo m?c d? uu tiên.',
          ),
          SizedBox(height: scale.h(16)),
          ...[
            ('Flashcards ôn t?p', '12 th?', 0.72, AppColors.primary),
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
      title: 'Flashcard h?c',
      selectedIndex: 1,
      child: Padding(
        padding: EdgeInsets.all(scale.w(16)),
        child: Column(
          children: [
            _ScreenTitle(
              title: '1 / 12',
              subtitle: 'Ch?m d? l?t th?. Kéo sang trái/ph?i d? chuy?n th?.',
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
                        Expanded(child: _ActionChip(text: 'C?n xem l?i', color: AppColors.danger, icon: Icons.close)),
                        SizedBox(width: scale.w(12)),
                        Expanded(child: _ActionChip(text: 'Tôi nh?', color: AppColors.secondary, icon: Icons.check)),
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
      title: 'Tr?c nghi?m',
      selectedIndex: 1,
      child: ListView(
        padding: EdgeInsets.all(scale.w(16)),
        children: [
          _QuizProgress(scale: scale, progress: 0.4, label: 'Câu 4 / 10'),
          SizedBox(height: scale.h(20)),
          Text(
            '“subtle” nghia là gì?',
            style: TextStyle(fontSize: scale.sp(26), fontWeight: FontWeight.w700, color: AppColors.text, height: 1.25),
          ),
          SizedBox(height: scale.h(16)),
          ...[
            'Rõ ràng, d? nh?n th?y',
            'Tinh t?, khó nh?n ra',
            'Ðông dúc, h?n lo?n',
            'R?ng l?n, bao la',
          ].map(
            (answer) => Padding(
              padding: EdgeInsets.only(bottom: scale.h(12)),
              child: _AnswerOption(text: answer, selected: answer == 'Tinh t?, khó nh?n ra'),
            ),
          ),
          SizedBox(height: scale.h(8)),
          _PillButton(text: 'Ti?p t?c', icon: Icons.arrow_forward, filled: true),
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
      title: 'Ði?n t?',
      selectedIndex: 1,
      child: ListView(
        padding: EdgeInsets.all(scale.w(16)),
        children: [
          _QuizProgress(scale: scale, progress: 0.8, label: 'Câu 8 / 10'),
          SizedBox(height: scale.h(20)),
          Text(
            'Nh?p t? ti?ng Anh cho nghia: “kiên cu?ng, b?n b?”',
            style: TextStyle(fontSize: scale.sp(22), fontWeight: FontWeight.w700, color: AppColors.text, height: 1.3),
          ),
          SizedBox(height: scale.h(16)),
          _InputPanel(height: scale.h(64), hint: 'Type your answer'),
          SizedBox(height: scale.h(16)),
          Row(
            children: [
              Expanded(child: _PillButton(text: 'G?i ý', icon: Icons.tips_and_updates_outlined, filled: false)),
              SizedBox(width: scale.w(12)),
              Expanded(child: _PillButton(text: 'N?p', icon: Icons.send_outlined, filled: true)),
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
      title: 'K?t qu?',
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
                Text('Hoàn thành xu?t s?c', style: TextStyle(fontSize: scale.sp(22), fontWeight: FontWeight.w700)),
                SizedBox(height: scale.h(12)),
                Text(
                  'B?n dã tr? l?i dúng 23/25 câu h?i.',
                  style: TextStyle(fontSize: scale.sp(15), color: AppColors.textSoft),
                ),
                SizedBox(height: scale.h(20)),
                Row(
                  children: const [
                    Expanded(child: _ResultMetric(label: 'Ðúng', value: '23', color: AppColors.secondary)),
                    SizedBox(width: 12),
                    Expanded(child: _ResultMetric(label: 'Sai', value: '2', color: AppColors.danger)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: scale.h(16)),
          _PillButton(text: 'Ôn l?i l?i sai', icon: Icons.refresh_outlined, filled: false),
          SizedBox(height: scale.h(12)),
          _PillButton(text: 'Ti?p t?c h?c', icon: Icons.arrow_forward, filled: true),
        ],
      ),
    );
  }
}

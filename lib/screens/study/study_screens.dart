part of '../../app/vocabulary_app.dart';

class StudyTodayScreen extends StatelessWidget {
  const StudyTodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: const _BottomNav(selectedIndex: 0),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(scale.w(20), scale.h(18), scale.w(20), scale.h(12)),
                decoration: const BoxDecoration(
                  color: AppColors.background,
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFC2C6D6)),
                  ),
                ),
                child: SafeArea(
                  bottom: false,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: scale.w(20),
                            backgroundColor: const Color(0xFFD8E2FF),
                            child: Icon(Icons.person, color: AppColors.primary, size: scale.w(20)),
                          ),
                          SizedBox(width: scale.w(12)),
                          Text(
                            'Text2Card',
                            style: TextStyle(
                              fontSize: scale.sp(24),
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.fromLTRB(scale.w(20), scale.h(24), scale.w(20), scale.h(170)),
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Học hôm nay',
                                style: TextStyle(
                                  fontSize: scale.sp(24),
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.text,
                                ),
                              ),
                              SizedBox(height: scale.h(4)),
                              Text(
                                'Bạn có 12 từ cần ôn để giữ tiến độ.',
                                style: TextStyle(
                                  fontSize: scale.sp(16),
                                  color: AppColors.textSoft,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: scale.w(12), vertical: scale.h(8)),
                          decoration: BoxDecoration(
                            color: const Color(0xFF6CF8BB),
                            borderRadius: BorderRadius.circular(scale.r(12)),
                            border: Border.all(color: const Color(0x4DC2C6D6)),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.local_fire_department, size: scale.w(18), color: const Color(0xFF00714D)),
                              SizedBox(width: scale.w(4)),
                              Text(
                                'Chuỗi: 5 ngày',
                                style: TextStyle(
                                  fontSize: scale.sp(12),
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF00714D),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: scale.h(24)),
                    _TodayProgressCard(scale: scale),
                    SizedBox(height: scale.h(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Danh sách từ vựng',
                          style: TextStyle(
                            fontSize: scale.sp(20),
                            fontWeight: FontWeight.w600,
                            color: AppColors.text,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: scale.w(8), vertical: scale.h(4)),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD8E2FF),
                            borderRadius: BorderRadius.circular(scale.r(999)),
                          ),
                          child: Text(
                            '12 từ mới',
                            style: TextStyle(
                              fontSize: scale.sp(12),
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: scale.h(12)),
                    const _TodayWordCard(
                      word: 'consistency',
                      level: 'B2',
                      meaning: 'sự đều đặn',
                      historyLabel: 'Lần 2/5',
                      statusLabel: 'Ôn hôm nay',
                      pillLabel: 'Reviewing',
                      pillBackground: Color(0x336CF8BB),
                      pillForeground: AppColors.secondary,
                      statusIcon: Icons.event_repeat,
                      statusColor: AppColors.primary,
                    ),
                    SizedBox(height: 12),
                    const _TodayWordCard(
                      word: 'persistent',
                      level: 'C1',
                      meaning: 'kiên trì, bền bỉ',
                      historyLabel: 'Lần 1/5',
                      statusLabel: 'Đang trễ',
                      pillLabel: 'Learning',
                      pillBackground: Color(0x33FFDAD6),
                      pillForeground: Color(0xFFBA1A1A),
                      statusIcon: Icons.priority_high,
                      statusColor: AppColors.tertiary,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: scale.h(80),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: scale.w(20), vertical: scale.h(16)),
              child: SafeArea(
                top: false,
                child: SizedBox(
                  height: scale.h(48),
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(scale.r(16)),
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.play_circle_fill, size: scale.w(20)),
                    label: Text(
                      'Bắt đầu học',
                      style: TextStyle(fontSize: scale.sp(20), fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TodayProgressCard extends StatelessWidget {
  const _TodayProgressCard({required this.scale});

  final Scale scale;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(scale.w(20)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(scale.r(16)),
        border: Border.all(color: const Color(0xFFC2C6D6)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TIẾN ĐỘ',
                    style: TextStyle(
                      fontSize: scale.sp(12),
                      fontWeight: FontWeight.w700,
                      color: AppColors.textMuted,
                    ),
                  ),
                  SizedBox(height: scale.h(4)),
                  Text(
                    '0/12 hoàn thành',
                    style: TextStyle(
                      fontSize: scale.sp(20),
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              Text(
                '0%',
                style: TextStyle(
                  fontSize: scale.sp(14),
                  color: AppColors.textSoft,
                ),
              ),
            ],
          ),
          SizedBox(height: scale.h(12)),
          ClipRRect(
            borderRadius: BorderRadius.circular(scale.r(999)),
            child: const LinearProgressIndicator(
              value: 0.08,
              minHeight: 8,
              backgroundColor: Color(0xFFECEEF0),
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}

class _TodayWordCard extends StatelessWidget {
  const _TodayWordCard({
    required this.word,
    required this.level,
    required this.meaning,
    required this.historyLabel,
    required this.statusLabel,
    required this.pillLabel,
    required this.pillBackground,
    required this.pillForeground,
    required this.statusIcon,
    required this.statusColor,
  });

  final String word;
  final String level;
  final String meaning;
  final String historyLabel;
  final String statusLabel;
  final String pillLabel;
  final Color pillBackground;
  final Color pillForeground;
  final IconData statusIcon;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Container(
      padding: EdgeInsets.all(scale.w(16)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(scale.r(16)),
        border: Border.all(color: const Color(0xFFC2C6D6)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      word,
                      style: TextStyle(
                        fontSize: scale.sp(20),
                        fontWeight: FontWeight.w600,
                        color: AppColors.text,
                      ),
                    ),
                    SizedBox(width: scale.w(8)),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: scale.w(6), vertical: scale.h(2)),
                      decoration: BoxDecoration(
                        color: const Color(0xFFECEEF0),
                        borderRadius: BorderRadius.circular(scale.r(8)),
                      ),
                      child: Text(
                        level,
                        style: TextStyle(
                          fontSize: scale.sp(10),
                          fontWeight: FontWeight.w700,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: scale.h(4)),
                Text(
                  meaning,
                  style: TextStyle(
                    fontSize: scale.sp(16),
                    color: AppColors.textSoft,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: scale.h(10)),
                Row(
                  children: [
                    Icon(Icons.history, size: scale.w(14), color: AppColors.textMuted),
                    SizedBox(width: scale.w(4)),
                    Text(
                      historyLabel,
                      style: TextStyle(
                        fontSize: scale.sp(12),
                        color: AppColors.textMuted,
                      ),
                    ),
                    SizedBox(width: scale.w(16)),
                    Icon(statusIcon, size: scale.w(14), color: statusColor),
                    SizedBox(width: scale.w(4)),
                    Text(
                      statusLabel,
                      style: TextStyle(
                        fontSize: scale.sp(12),
                        color: statusColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: scale.w(12)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: scale.w(10), vertical: scale.h(6)),
                decoration: BoxDecoration(
                  color: pillBackground,
                  borderRadius: BorderRadius.circular(scale.r(999)),
                  border: Border.all(color: pillForeground.withValues(alpha: 0.2)),
                ),
                child: Text(
                  pillLabel,
                  style: TextStyle(
                    fontSize: scale.sp(12),
                    fontWeight: FontWeight.w600,
                    color: pillForeground,
                  ),
                ),
              ),
              SizedBox(height: scale.h(8)),
              Icon(Icons.chevron_right, color: AppColors.textMuted, size: scale.w(22)),
            ],
          ),
        ],
      ),
    );
  }
}

class FlashcardStudyScreen extends StatefulWidget {
  const FlashcardStudyScreen({super.key});

  @override
  State<FlashcardStudyScreen> createState() => _FlashcardStudyScreenState();
}

class _FlashcardStudyScreenState extends State<FlashcardStudyScreen> {
  bool _flipped = false;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: Container(
                  width: scale.w(600),
                  height: scale.w(600),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.05),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(scale.w(20), scale.h(16), scale.w(20), scale.h(24)),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.close),
                        color: AppColors.textSoft,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'TIẾN ĐỘ',
                              style: TextStyle(
                                fontSize: scale.sp(12),
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                                color: AppColors.textSoft,
                              ),
                            ),
                            SizedBox(height: scale.h(4)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(scale.r(999)),
                                  child: SizedBox(
                                    width: scale.w(128),
                                    child: const LinearProgressIndicator(
                                      value: 0.25,
                                      minHeight: 8,
                                      backgroundColor: Color(0xFFECEEF0),
                                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                                    ),
                                  ),
                                ),
                                SizedBox(width: scale.w(8)),
                                Text(
                                  '3/12',
                                  style: TextStyle(
                                    fontSize: scale.sp(12),
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textSoft,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: scale.w(10), vertical: scale.h(8)),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2F4F6),
                          borderRadius: BorderRadius.circular(scale.r(999)),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.favorite, color: AppColors.danger, size: scale.w(18)),
                            SizedBox(width: scale.w(4)),
                            Text(
                              '5',
                              style: TextStyle(
                                fontSize: scale.sp(12),
                                color: AppColors.textSoft,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => setState(() => _flipped = !_flipped),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 350),
                            transitionBuilder: (child, animation) {
                              final rotate = Tween(begin: 0.92, end: 1.0).animate(animation);
                              return ScaleTransition(scale: rotate, child: child);
                            },
                            child: _flipped
                                ? _FlashcardBack(key: const ValueKey('back'))
                                : _FlashcardFront(key: const ValueKey('front')),
                          ),
                        ),
                        SizedBox(height: scale.h(24)),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: scale.h(52),
                                child: OutlinedButton.icon(
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: AppColors.danger,
                                    backgroundColor: Colors.white,
                                    side: const BorderSide(color: Color(0xFFBA1A1A)),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(scale.r(16)),
                                    ),
                                  ),
                                  onPressed: () {},
                                  icon: Icon(Icons.sentiment_dissatisfied, size: scale.w(18)),
                                  label: Text(
                                    'Chưa nhớ',
                                    style: TextStyle(fontSize: scale.sp(18), fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: scale.w(12)),
                            Expanded(
                              child: SizedBox(
                                height: scale.h(52),
                                child: FilledButton.icon(
                                  style: FilledButton.styleFrom(
                                    backgroundColor: AppColors.secondary,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(scale.r(16)),
                                    ),
                                  ),
                                  onPressed: () {},
                                  icon: Icon(Icons.check_circle, size: scale.w(18)),
                                  label: Text(
                                    'Tôi nhớ',
                                    style: TextStyle(fontSize: scale.sp(18), fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: scale.h(24)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _FlashcardSecondaryAction(
                              icon: Icons.replay,
                              label: 'Nghe lại',
                            ),
                            SizedBox(width: scale.w(32)),
                            _FlashcardSecondaryAction(
                              icon: Icons.edit,
                              label: 'Sửa thẻ',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FlashcardFront extends StatelessWidget {
  const _FlashcardFront({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Container(
      key: key,
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: scale.w(400), minHeight: scale.h(500)),
      padding: EdgeInsets.all(scale.w(24)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(scale.r(24)),
        border: Border.all(color: const Color(0xFFC2C6D6)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Spacer(),
          Text(
            'struggle with',
            style: TextStyle(
              fontSize: scale.sp(32),
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: scale.h(16)),
          Container(
            width: scale.w(56),
            height: scale.w(56),
            decoration: BoxDecoration(
              color: const Color(0xFF2170E4),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.volume_up, color: Colors.white, size: scale.w(28)),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.touch_app, color: AppColors.textMuted, size: scale.w(18)),
              SizedBox(width: scale.w(6)),
              Text(
                'Nhấn để xem nghĩa',
                style: TextStyle(
                  fontSize: scale.sp(14),
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FlashcardBack extends StatelessWidget {
  const _FlashcardBack({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Container(
      key: key,
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: scale.w(400), minHeight: scale.h(500)),
      padding: EdgeInsets.all(scale.w(24)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(scale.r(24)),
        border: Border.all(color: const Color(0xFFC2C6D6)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Spacer(),
          Text(
            'struggle with',
            style: TextStyle(
              fontSize: scale.sp(20),
              color: AppColors.textSoft.withValues(alpha: 0.6),
            ),
          ),
          SizedBox(height: scale.h(12)),
          Container(
            width: scale.w(48),
            height: 2,
            color: const Color(0xFFC2C6D6),
          ),
          SizedBox(height: scale.h(16)),
          Text(
            'vật lộn với',
            style: TextStyle(
              fontSize: scale.sp(32),
              fontWeight: FontWeight.w700,
              color: AppColors.secondary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: scale.h(16)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: scale.w(16)),
            child: Text(
              '"She had to struggle with a difficult decision."',
              style: TextStyle(
                fontSize: scale.sp(16),
                color: AppColors.textSoft,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          Text(
            'Nhấn để quay lại',
            style: TextStyle(
              fontSize: scale.sp(14),
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}

class _FlashcardSecondaryAction extends StatelessWidget {
  const _FlashcardSecondaryAction({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(scale.w(10)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(scale.r(999)),
          ),
          child: Icon(icon, color: AppColors.textSoft, size: scale.w(22)),
        ),
        SizedBox(height: scale.h(4)),
        Text(
          label,
          style: TextStyle(
            fontSize: scale.sp(12),
            color: AppColors.textSoft,
          ),
        ),
      ],
    );
  }
}

class MultipleChoiceQuizScreen extends StatelessWidget {
  const MultipleChoiceQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned.fill(
            child: IgnorePointer(
              child: Opacity(
                opacity: 0.3,
                child: Stack(
                  children: [
                    Positioned(
                      top: -scale.h(80),
                      right: -scale.w(60),
                      child: Container(
                        width: scale.w(220),
                        height: scale.w(220),
                        decoration: const BoxDecoration(
                          color: Color(0xFFD8E2FF),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -scale.h(60),
                      left: -scale.w(40),
                      child: Container(
                        width: scale.w(180),
                        height: scale.w(180),
                        decoration: const BoxDecoration(
                          color: Color(0xFF6CF8BB),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(scale.w(20), scale.h(16), scale.w(20), scale.h(8)),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.close),
                        color: AppColors.textSoft,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: scale.w(12)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.timer, size: scale.w(18), color: AppColors.textSoft),
                                  SizedBox(width: scale.w(4)),
                                  Text(
                                    '02:45',
                                    style: TextStyle(
                                      fontSize: scale.sp(12),
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textSoft,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: scale.h(8)),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(scale.r(999)),
                                child: SizedBox(
                                  width: scale.w(200),
                                  child: const LinearProgressIndicator(
                                    value: 0.3333,
                                    minHeight: 8,
                                    backgroundColor: Color(0xFFE0E3E5),
                                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF6CF8BB)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        '4/12',
                        style: TextStyle(
                          fontSize: scale.sp(12),
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.fromLTRB(scale.w(20), scale.h(12), scale.w(20), scale.h(180)),
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(scale.w(24)),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(scale.r(16)),
                          border: Border.all(color: const Color(0xFFC2C6D6)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x0A000000),
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              'CHỌN NGHĨA ĐÚNG',
                              style: TextStyle(
                                fontSize: scale.sp(12),
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                                color: AppColors.textSoft,
                              ),
                            ),
                            SizedBox(height: scale.h(16)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'come up with',
                                  style: TextStyle(
                                    fontSize: scale.sp(28),
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primary,
                                  ),
                                ),
                                SizedBox(width: scale.w(8)),
                                Container(
                                  width: scale.w(40),
                                  height: scale.w(40),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFD8E2FF),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.volume_up, color: const Color(0xFF004395), size: scale.w(20)),
                                ),
                              ],
                            ),
                            SizedBox(height: scale.h(16)),
                            Text(
                              '"She came up with a new idea."',
                              style: TextStyle(
                                fontSize: scale.sp(16),
                                color: AppColors.textSoft,
                                fontStyle: FontStyle.italic,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: scale.h(16)),
                      const _QuizOptionCard(
                        letter: 'A',
                        text: 'chăm sóc',
                      ),
                      SizedBox(height: 12),
                      const _QuizOptionCard(
                        letter: 'B',
                        text: 'nghĩ ra / nảy ra',
                        selected: true,
                        correct: true,
                      ),
                      SizedBox(height: 12),
                      const _QuizOptionCard(
                        letter: 'C',
                        text: 'nhìn về phía trước',
                      ),
                      SizedBox(height: 12),
                      const _QuizOptionCard(
                        letter: 'D',
                        text: 'từ bỏ',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.background,
                border: Border(
                  top: BorderSide(color: Color(0xFFC2C6D6)),
                ),
              ),
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(scale.w(20), scale.h(16), scale.w(20), scale.h(16)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: scale.w(48),
                            height: scale.w(48),
                            decoration: const BoxDecoration(
                              color: AppColors.secondary,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.sentiment_very_satisfied,
                              color: Colors.white,
                              size: scale.w(28),
                            ),
                          ),
                          SizedBox(width: scale.w(12)),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Chính xác!',
                                  style: TextStyle(
                                    fontSize: scale.sp(20),
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.secondary,
                                  ),
                                ),
                                SizedBox(height: scale.h(2)),
                                Text(
                                  'Bạn đang làm rất tốt, tiếp tục phát huy!',
                                  style: TextStyle(
                                    fontSize: scale.sp(14),
                                    color: AppColors.textSoft,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: scale.h(12)),
                      SizedBox(
                        width: double.infinity,
                        height: scale.h(48),
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(scale.r(16)),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Tiếp tục',
                            style: TextStyle(
                              fontSize: scale.sp(16),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuizOptionCard extends StatelessWidget {
  const _QuizOptionCard({
    required this.letter,
    required this.text,
    this.selected = false,
    this.correct = false,
  });

  final String letter;
  final String text;
  final bool selected;
  final bool correct;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    final background = selected ? const Color(0x336CF8BB) : Colors.white;
    final borderColor = selected ? AppColors.secondary : const Color(0xFFC2C6D6);
    final borderWidth = selected ? 2.0 : 1.0;
    final chipBackground = selected ? AppColors.secondary : const Color(0xFFE0E3E5);
    final chipForeground = selected ? Colors.white : AppColors.textSoft;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(scale.w(16)),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(scale.r(16)),
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      child: Row(
        children: [
          Container(
            width: scale.w(40),
            height: scale.w(40),
            decoration: BoxDecoration(
              color: chipBackground,
              borderRadius: BorderRadius.circular(scale.r(10)),
            ),
            child: Center(
              child: Text(
                letter,
                style: TextStyle(
                  fontSize: scale.sp(16),
                  fontWeight: FontWeight.w700,
                  color: chipForeground,
                ),
              ),
            ),
          ),
          SizedBox(width: scale.w(16)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: scale.sp(18),
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                color: AppColors.text,
              ),
            ),
          ),
          if (correct)
            Icon(
              Icons.check_circle,
              color: AppColors.secondary,
              size: scale.w(22),
            ),
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
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(scale.w(20), scale.h(12), scale.w(20), scale.h(12)),
                  decoration: const BoxDecoration(
                    color: AppColors.background,
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFC2C6D6)),
                    ),
                  ),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.close),
                            color: AppColors.textSoft,
                          ),
                          SizedBox(width: scale.w(4)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Text2Card',
                                style: TextStyle(
                                  fontSize: scale.sp(20),
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primary,
                                ),
                              ),
                              Text(
                                'Nhập tiếng Anh',
                                style: TextStyle(
                                  fontSize: scale.sp(12),
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textSoft,
                                  letterSpacing: 0.8,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '7/12',
                            style: TextStyle(
                              fontSize: scale.sp(12),
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                          ),
                          SizedBox(height: scale.h(6)),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(scale.r(999)),
                            child: SizedBox(
                              width: scale.w(96),
                              child: const LinearProgressIndicator(
                                value: 0.58,
                                minHeight: 6,
                                backgroundColor: Color(0xFFECEEF0),
                                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.fromLTRB(scale.w(20), scale.h(24), scale.w(20), scale.h(120)),
                    children: [
                      Container(
                        padding: EdgeInsets.all(scale.w(24)),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(scale.r(16)),
                          border: Border.all(color: const Color(0xFFC2C6D6)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x0A000000),
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.translate, size: scale.w(20), color: AppColors.primary),
                                SizedBox(width: scale.w(8)),
                                Text(
                                  'NHẬP TỪ/CỤM TỪ TIẾNG ANH',
                                  style: TextStyle(
                                    fontSize: scale.sp(12),
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textSoft,
                                    letterSpacing: 0.8,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: scale.h(20)),
                            Text(
                              'gặp khó khăn với',
                              style: TextStyle(
                                fontSize: scale.sp(28),
                                fontWeight: FontWeight.w700,
                                color: AppColors.text,
                                height: 1.2,
                              ),
                            ),
                            SizedBox(height: scale.h(8)),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: scale.sp(18),
                                  fontStyle: FontStyle.italic,
                                  color: AppColors.textSoft,
                                  height: 1.5,
                                ),
                                children: const [
                                  TextSpan(text: '"I '),
                                  TextSpan(
                                    text: '______',
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Color(0x4D0058BE),
                                      decorationThickness: 2,
                                    ),
                                  ),
                                  TextSpan(text: ' consistency."'),
                                ],
                              ),
                            ),
                            SizedBox(height: scale.h(20)),
                            Container(
                              width: double.infinity,
                              height: scale.h(128),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF2F4F6),
                                borderRadius: BorderRadius.circular(scale.r(12)),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.keyboard,
                                  size: scale.w(64),
                                  color: AppColors.primary.withValues(alpha: 0.2),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: scale.h(24)),
                      Container(
                        height: scale.h(56),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(scale.r(16)),
                          border: Border.all(color: const Color(0xFFC2C6D6)),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Nhập câu trả lời...',
                            hintStyle: TextStyle(
                              fontSize: scale.sp(18),
                              color: AppColors.textSoft,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: scale.w(16),
                              vertical: scale.h(16),
                            ),
                            suffixIcon: Icon(Icons.edit_note, color: AppColors.textSoft.withValues(alpha: 0.5)),
                          ),
                          style: TextStyle(
                            fontSize: scale.sp(18),
                            color: AppColors.text,
                          ),
                          autofocus: true,
                        ),
                      ),
                      SizedBox(height: scale.h(12)),
                      SizedBox(
                        width: double.infinity,
                        height: scale.h(48),
                        child: FilledButton.icon(
                          style: FilledButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(scale.r(16)),
                            ),
                          ),
                          onPressed: () {},
                          label: Text(
                            'Kiểm tra',
                            style: TextStyle(
                              fontSize: scale.sp(16),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          icon: Icon(Icons.check_circle, size: scale.w(20)),
                        ),
                      ),
                      SizedBox(height: scale.h(20)),
                      Row(
                        children: const [
                          Expanded(
                            child: _TypingActionCard(
                              icon: Icons.lightbulb_outline,
                              label: 'Gợi ý',
                              accentColor: AppColors.primary,
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: _TypingActionCard(
                              icon: Icons.volume_up_outlined,
                              label: 'Phát âm',
                              accentColor: AppColors.primary,
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: _TypingActionCard(
                              icon: Icons.fast_forward,
                              label: 'Bỏ qua',
                              accentColor: AppColors.danger,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: scale.w(20),
            right: scale.w(20),
            bottom: scale.h(24),
            child: SafeArea(
              top: false,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: scale.w(16), vertical: scale.h(12)),
                decoration: BoxDecoration(
                  color: const Color(0xFF2D3133),
                  borderRadius: BorderRadius.circular(scale.r(12)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x33000000),
                      blurRadius: 16,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Nhấn "Enter" để kiểm tra nhanh',
                        style: TextStyle(
                          fontSize: scale.sp(14),
                          color: const Color(0xFFEFF1F3),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'OK',
                        style: TextStyle(
                          fontSize: scale.sp(12),
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFD8E2FF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TypingActionCard extends StatelessWidget {
  const _TypingActionCard({
    required this.icon,
    required this.label,
    required this.accentColor,
  });

  final IconData icon;
  final String label;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: scale.w(8), vertical: scale.h(16)),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F4F6),
        borderRadius: BorderRadius.circular(scale.r(16)),
        border: Border.all(color: const Color(0x4DC2C6D6)),
      ),
      child: Column(
        children: [
          Icon(icon, size: scale.w(24), color: accentColor),
          SizedBox(height: scale.h(8)),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: scale.sp(12),
              fontWeight: FontWeight.w600,
              color: AppColors.textSoft,
            ),
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
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: const _BottomNav(selectedIndex: 1),
      body: Stack(
        children: [
          Positioned.fill(
            child: IgnorePointer(
              child: Stack(
                children: [
                  Positioned(
                    top: -scale.h(40),
                    right: -scale.w(20),
                    child: Container(
                      width: scale.w(180),
                      height: scale.w(180),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.06),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: scale.h(120),
                    left: -scale.w(50),
                    child: Container(
                      width: scale.w(140),
                      height: scale.w(140),
                      decoration: const BoxDecoration(
                        color: Color(0x146CF8BB),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(scale.w(20), scale.h(12), scale.w(20), scale.h(12)),
                  decoration: const BoxDecoration(
                    color: AppColors.background,
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFC2C6D6)),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Text2Card',
                        style: TextStyle(
                          fontSize: scale.sp(24),
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                      const Spacer(),
                      CircleAvatar(
                        radius: scale.w(20),
                        backgroundColor: const Color(0xFFD8E2FF),
                        child: Icon(Icons.person, color: AppColors.onPrimaryFixed, size: scale.w(20)),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.fromLTRB(scale.w(20), scale.h(24), scale.w(20), scale.h(24)),
                    children: [
                      Column(
                        children: [
                          Container(
                            width: scale.w(128),
                            height: scale.w(128),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xFF3B82F6), Color(0xFF10B981)],
                              ),
                              shape: BoxShape.circle,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x330058BE),
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Icon(
                                Icons.celebration,
                                color: Colors.white,
                                size: scale.w(64),
                              ),
                            ),
                          ),
                          SizedBox(height: scale.h(16)),
                          Text(
                            'Hoàn thành buổi học!',
                            style: TextStyle(
                              fontSize: scale.sp(28),
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: scale.h(8)),
                          Text(
                            'Thật tuyệt vời! Bạn đã hoàn thành mục tiêu hôm nay.',
                            style: TextStyle(
                              fontSize: scale.sp(16),
                              color: AppColors.textSoft,
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(height: scale.h(24)),
                      Container(
                        padding: EdgeInsets.all(scale.w(16)),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2F4F6),
                          borderRadius: BorderRadius.circular(scale.r(16)),
                          border: Border.all(color: const Color(0xFFC2C6D6)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x0D000000),
                              blurRadius: 12,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'TIẾN ĐỘ HÔM NAY',
                                  style: TextStyle(
                                    fontSize: scale.sp(12),
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.8,
                                    color: AppColors.textSoft,
                                  ),
                                ),
                                Text(
                                  '100%',
                                  style: TextStyle(
                                    fontSize: scale.sp(20),
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.secondary,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: scale.h(12)),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(scale.r(999)),
                              child: const LinearProgressIndicator(
                                value: 1,
                                minHeight: 16,
                                backgroundColor: Color(0xFFE6E8EA),
                                valueColor: AlwaysStoppedAnimation<Color>(AppColors.secondary),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: scale.h(24)),
                      Container(
                        padding: EdgeInsets.all(scale.w(16)),
                        decoration: BoxDecoration(
                          color: AppColors.primaryContainer,
                          borderRadius: BorderRadius.circular(scale.r(16)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x0D000000),
                              blurRadius: 12,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tổng số từ',
                                    style: TextStyle(
                                      fontSize: scale.sp(14),
                                      color: AppColors.onPrimaryContainer.withValues(alpha: 0.8),
                                    ),
                                  ),
                                  SizedBox(height: scale.h(4)),
                                  Text(
                                    'Bạn đã học 12 từ',
                                    style: TextStyle(
                                      fontSize: scale.sp(24),
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.onPrimaryContainer,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.auto_stories,
                              size: scale.w(40),
                              color: AppColors.onPrimaryContainer.withValues(alpha: 0.2),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: scale.h(12)),
                      Row(
                        children: const [
                          Expanded(
                            child: _StudyResultStatCard(
                              icon: Icons.check_circle,
                              iconColor: AppColors.secondary,
                              label: 'Chính xác',
                              value: 'Đúng: 9',
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: _StudyResultStatCard(
                              icon: Icons.history_edu,
                              iconColor: AppColors.danger,
                              label: 'Cần ôn lại',
                              value: 'Cần ôn lại: 3',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: scale.h(12)),
                      Row(
                        children: const [
                          Expanded(
                            child: _StudyResultStatCard(
                              icon: Icons.trending_up,
                              iconColor: AppColors.primary,
                              label: 'Cải thiện',
                              value: 'Tiến độ: 8',
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: _StudyResultStatCard(
                              icon: Icons.verified,
                              iconColor: Color(0xFF00714D),
                              label: 'Ghi nhớ',
                              value: 'Đã ghi nhớ: 2',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: scale.h(24)),
                      _StudyResultActionButton(
                        icon: Icons.school,
                        label: 'Học thêm từ mới',
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        borderColor: AppColors.primary,
                      ),
                      SizedBox(height: scale.h(12)),
                      _StudyResultActionButton(
                        icon: Icons.restart_alt,
                        label: 'Ôn lại từ sai',
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.primary,
                        borderColor: const Color(0xFFC2C6D6),
                      ),
                      SizedBox(height: scale.h(12)),
                      _StudyResultActionButton(
                        icon: Icons.home,
                        label: 'Về trang chủ',
                        backgroundColor: const Color(0xFFF2F4F6),
                        foregroundColor: AppColors.textSoft,
                        borderColor: const Color(0xFFF2F4F6),
                      ),
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

class _StudyResultStatCard extends StatelessWidget {
  const _StudyResultStatCard({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Container(
      padding: EdgeInsets.all(scale.w(16)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(scale.r(16)),
        border: Border.all(color: const Color(0xFFC2C6D6)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: scale.w(18), color: iconColor),
              SizedBox(width: scale.w(6)),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: scale.sp(12),
                    fontWeight: FontWeight.w600,
                    color: iconColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: scale.h(8)),
          Text(
            value,
            style: TextStyle(
              fontSize: scale.sp(20),
              fontWeight: FontWeight.w600,
              color: AppColors.text,
            ),
          ),
        ],
      ),
    );
  }
}

class _StudyResultActionButton extends StatelessWidget {
  const _StudyResultActionButton({
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.borderColor,
  });

  final IconData icon;
  final String label;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return SizedBox(
      width: double.infinity,
      height: scale.h(52),
      child: FilledButton.icon(
        style: FilledButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          side: BorderSide(color: borderColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(scale.r(16)),
          ),
          elevation: 0,
        ),
        onPressed: () {},
        icon: Icon(icon, size: scale.w(20)),
        label: Text(
          label,
          style: TextStyle(
            fontSize: scale.sp(20),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}



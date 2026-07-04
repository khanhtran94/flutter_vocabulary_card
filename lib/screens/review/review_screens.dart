part of '../../app/vocabulary_app.dart';

class ReviewCalendarScreen extends StatelessWidget {
  const ReviewCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: const _BottomNav(selectedIndex: 1),
      body: SafeArea(
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
                  Container(
                    width: scale.w(40),
                    height: scale.w(40),
                    decoration: BoxDecoration(
                      color: const Color(0xFFECEEF0),
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFFC2C6D6)),
                    ),
                    child: Icon(Icons.person, color: AppColors.textSoft, size: scale.w(20)),
                  ),
                  SizedBox(width: scale.w(12)),
                  Expanded(
                    child: Text(
                      'Lich on tap',
                      style: TextStyle(
                        fontSize: scale.sp(24),
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.fromLTRB(scale.w(20), scale.h(24), scale.w(20), scale.h(24)),
                children: [
                  Container(
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
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Thang 6, 2026',
                              style: TextStyle(
                                fontSize: scale.sp(20),
                                fontWeight: FontWeight.w600,
                                color: AppColors.text,
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.chevron_left),
                                  color: AppColors.text,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.chevron_right),
                                  color: AppColors.text,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: scale.h(8)),
                        const _ReviewCalendarGrid(),
                      ],
                    ),
                  ),
                  SizedBox(height: scale.h(24)),
                  Text(
                    'DANH SACH ON TAP',
                    style: TextStyle(
                      fontSize: scale.sp(12),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.8,
                      color: AppColors.textMuted,
                    ),
                  ),
                  SizedBox(height: scale.h(8)),
                  const _ReviewTaskCard(
                    icon: Icons.today,
                    title: 'Hom nay',
                    subtitle: 'Lich trinh de xuat',
                    countLabel: '12 tu',
                    countColor: AppColors.primary,
                    selected: true,
                    badgeLabel: 'Dang cho',
                  ),
                  SizedBox(height: 12),
                  const _ReviewTaskCard(
                    icon: Icons.event,
                    title: 'Ngay mai',
                    subtitle: 'Du kien on tap',
                    countLabel: '5 tu',
                  ),
                  SizedBox(height: 12),
                  const _ReviewTaskCard(
                    icon: Icons.calendar_month,
                    title: '27/06',
                    subtitle: 'Cuoi tuan',
                    countLabel: '8 tu',
                  ),
                  SizedBox(height: scale.h(24)),
                  Container(
                    padding: EdgeInsets.all(scale.w(24)),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(scale.r(16)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.lightbulb, color: Colors.white, size: scale.w(40)),
                        SizedBox(height: scale.h(24)),
                        Text(
                          'Meo hoc tap',
                          style: TextStyle(
                            fontSize: scale.sp(20),
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: scale.h(8)),
                        Text(
                          '"Su dung Spaced Repetition de toi uu hoa kha nang ghi nho dai han."',
                          style: TextStyle(
                            fontSize: scale.sp(14),
                            fontStyle: FontStyle.italic,
                            height: 1.5,
                            color: Colors.white.withValues(alpha: 0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: scale.h(16)),
                  Container(
                    padding: EdgeInsets.all(scale.w(24)),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6CF8BB),
                      borderRadius: BorderRadius.circular(scale.r(16)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.trending_up, color: const Color(0xFF005236), size: scale.w(18)),
                                  SizedBox(width: scale.w(4)),
                                  Text(
                                    'TIEN DO TUAN',
                                    style: TextStyle(
                                      fontSize: scale.sp(12),
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.8,
                                      color: const Color(0xFF005236),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: scale.h(20)),
                              Text(
                                '85%',
                                style: TextStyle(
                                  fontSize: scale.sp(28),
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF005236),
                                ),
                              ),
                              SizedBox(height: scale.h(4)),
                              Text(
                                'Da hoan thanh',
                                style: TextStyle(
                                  fontSize: scale.sp(14),
                                  color: const Color(0xFF005236),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: scale.w(64),
                          height: scale.w(64),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: scale.w(64),
                                height: scale.w(64),
                                child: const CircularProgressIndicator(
                                  value: 0.85,
                                  strokeWidth: 4,
                                  backgroundColor: Color(0x33005236),
                                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF005236)),
                                ),
                              ),
                              Text(
                                '85',
                                style: TextStyle(
                                  fontSize: scale.sp(14),
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF005236),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReviewCalendarGrid extends StatelessWidget {
  const _ReviewCalendarGrid();

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    const weekdays = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];
    const days = [
      (25, false, false, false),
      (26, false, false, false),
      (27, false, false, false),
      (28, false, false, false),
      (29, false, false, false),
      (30, false, false, false),
      (31, false, false, false),
      (1, true, false, false),
      (2, false, false, false),
      (3, true, false, false),
      (4, false, false, false),
      (5, true, false, false),
      (6, false, false, false),
      (7, false, false, false),
      (8, false, false, false),
      (9, true, false, false),
      (10, false, false, false),
      (11, false, false, false),
      (12, true, false, false),
      (13, false, false, false),
      (14, false, false, false),
      (15, true, true, true),
      (16, true, false, false),
      (17, false, false, false),
      (18, true, false, false),
      (19, false, false, false),
      (20, false, false, false),
      (21, false, false, false),
      (22, true, false, false),
      (23, false, false, false),
      (24, false, false, false),
      (25, false, false, false),
      (26, false, false, false),
      (27, true, false, false),
      (28, false, false, false),
    ];

    return Column(
      children: [
        Row(
          children: weekdays.map((day) {
            final isSaturday = day == 'T7';
            final isSunday = day == 'CN';
            return Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: scale.h(8)),
                child: Text(
                  day,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: scale.sp(12),
                    fontWeight: FontWeight.w600,
                    color: isSaturday
                        ? AppColors.primary
                        : isSunday
                            ? AppColors.danger
                            : AppColors.textMuted,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: days.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            mainAxisSpacing: 8,
            crossAxisSpacing: 0,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final day = days[index];
            final isCurrentMonth = index >= 7;
            final hasDot = day.$2;
            final isToday = day.$3;
            final invertDot = day.$4;
            final textColor = isCurrentMonth ? AppColors.text : AppColors.textMuted.withValues(alpha: 0.5);
            return Container(
              decoration: BoxDecoration(
                color: isToday ? AppColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(scale.r(12)),
                boxShadow: isToday
                    ? const [
                        BoxShadow(
                          color: Color(0x260058BE),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${day.$1}',
                    style: TextStyle(
                      fontSize: scale.sp(16),
                      fontWeight: isToday ? FontWeight.w700 : FontWeight.w400,
                      color: isToday ? Colors.white : textColor,
                    ),
                  ),
                  if (hasDot) ...[
                    SizedBox(height: scale.h(4)),
                    Container(
                      width: scale.w(4),
                      height: scale.w(4),
                      decoration: BoxDecoration(
                        color: invertDot ? Colors.white : AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class _ReviewTaskCard extends StatelessWidget {
  const _ReviewTaskCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.countLabel,
    this.countColor = AppColors.textSoft,
    this.selected = false,
    this.badgeLabel,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String countLabel;
  final Color countColor;
  final bool selected;
  final String? badgeLabel;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Container(
      padding: EdgeInsets.all(scale.w(16)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(scale.r(16)),
        border: Border.all(color: selected ? AppColors.primary : const Color(0xFFC2C6D6)),
        boxShadow: selected
            ? const [
                BoxShadow(
                  color: Color(0x140058BE),
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Row(
        children: [
          Container(
            width: scale.w(48),
            height: scale.w(48),
            decoration: BoxDecoration(
              color: selected ? const Color(0xFFD8E2FF) : const Color(0xFFECEEF0),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: selected ? AppColors.primary : AppColors.textSoft, size: scale.w(24)),
          ),
          SizedBox(width: scale.w(16)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: scale.sp(18),
                    fontWeight: FontWeight.w700,
                    color: AppColors.text,
                  ),
                ),
                SizedBox(height: scale.h(2)),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: scale.sp(14),
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                countLabel,
                style: TextStyle(
                  fontSize: scale.sp(20),
                  fontWeight: FontWeight.w600,
                  color: countColor,
                ),
              ),
              if (badgeLabel != null) ...[
                SizedBox(height: scale.h(4)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: scale.w(8), vertical: scale.h(2)),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6CF8BB),
                    borderRadius: BorderRadius.circular(scale.r(999)),
                  ),
                  child: Text(
                    badgeLabel!,
                    style: TextStyle(
                      fontSize: scale.sp(12),
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF00714D),
                    ),
                  ),
                ),
              ],
            ],
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
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: const _BottomNav(selectedIndex: 3),
      body: SafeArea(
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
                  Container(
                    width: scale.w(40),
                    height: scale.w(40),
                    decoration: BoxDecoration(
                      color: const Color(0xFFECEEF0),
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFFC2C6D6)),
                    ),
                    child: Icon(Icons.person, color: AppColors.textSoft, size: scale.w(20)),
                  ),
                  SizedBox(width: scale.w(12)),
                  Expanded(
                    child: Text(
                      'Thong ke',
                      style: TextStyle(
                        fontSize: scale.sp(24),
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.fromLTRB(scale.w(20), scale.h(16), scale.w(20), scale.h(24)),
                children: [
                  Row(
                    children: const [
                      Expanded(
                        child: _StatisticsSummaryCard(
                          label: 'TONG',
                          value: '120',
                          unit: 'tu',
                          valueColor: AppColors.primary,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _StatisticsSummaryCard(
                          label: 'STREAK',
                          value: '5',
                          unit: 'ngay',
                          valueColor: AppColors.tertiary,
                          footerIcon: Icons.local_fire_department,
                          footerText: 'Dang duy tri',
                          footerColor: AppColors.secondary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: scale.h(12)),
                  Row(
                    children: const [
                      Expanded(
                        child: _StatisticsProgressCard(
                          label: 'DANG HOC',
                          value: '35',
                          progress: 0.29,
                          progressColor: AppColors.primary,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _StatisticsProgressCard(
                          label: 'DA NHO',
                          value: '60',
                          progress: 0.50,
                          progressColor: AppColors.secondary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: scale.h(24)),
                  Container(
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
                        Text(
                          'Hoat dong 7 ngay qua',
                          style: TextStyle(
                            fontSize: scale.sp(20),
                            fontWeight: FontWeight.w600,
                            color: AppColors.text,
                          ),
                        ),
                        SizedBox(height: scale.h(16)),
                        SizedBox(
                          height: scale.h(160),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              _StatisticsBar(heightFactor: 0.40, label: 'T2'),
                              _StatisticsBar(heightFactor: 0.65, label: 'T3'),
                              _StatisticsBar(heightFactor: 0.30, label: 'T4'),
                              _StatisticsBar(heightFactor: 0.85, label: 'T5'),
                              _StatisticsBar(heightFactor: 1.00, label: 'T6', active: true),
                              _StatisticsBar(heightFactor: 0.10, label: 'T7', muted: true),
                              _StatisticsBar(heightFactor: 0.05, label: 'CN', muted: true),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: scale.h(24)),
                  Text(
                    'Thanh tuu',
                    style: TextStyle(
                      fontSize: scale.sp(20),
                      fontWeight: FontWeight.w600,
                      color: AppColors.text,
                    ),
                  ),
                  SizedBox(height: scale.h(12)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [
                        _AchievementBadge(
                          icon: Icons.workspace_premium,
                          background: Color(0xFF6CF8BB),
                          foreground: Color(0xFF00714D),
                          label: '5 days streak',
                        ),
                        SizedBox(width: 12),
                        _AchievementBadge(
                          icon: Icons.military_tech,
                          background: Color(0xFFD8E2FF),
                          foreground: Color(0xFF001A42),
                          label: '50 words remembered',
                        ),
                        SizedBox(width: 12),
                        _AchievementBadge(
                          icon: Icons.lock,
                          background: Color(0xFFE0E3E5),
                          foreground: Color(0xFF727785),
                          label: '100 words expert',
                          locked: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: scale.h(24)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tu yeu',
                        style: TextStyle(
                          fontSize: scale.sp(20),
                          fontWeight: FontWeight.w600,
                          color: AppColors.text,
                        ),
                      ),
                      Text(
                        'Can chu y',
                        style: TextStyle(
                          fontSize: scale.sp(14),
                          color: AppColors.textSoft,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: scale.h(12)),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(scale.r(16)),
                      border: Border.all(color: const Color(0xFFC2C6D6)),
                    ),
                    child: const Column(
                      children: [
                        _WeakWordRow(
                          word: 'Meticulous',
                          phonetic: '/məˈtɪk.jə.ləs/',
                          errorCount: 'Sai 4 lan',
                        ),
                        Divider(height: 1, color: Color(0xFFC2C6D6)),
                        _WeakWordRow(
                          word: 'Pragmatic',
                          phonetic: '/præɡˈmæt.ɪk/',
                          errorCount: 'Sai 3 lan',
                        ),
                        Divider(height: 1, color: Color(0xFFC2C6D6)),
                        _WeakWordRow(
                          word: 'Eloquent',
                          phonetic: '/ˈel.ə.kwənt/',
                          errorCount: 'Sai 3 lan',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: scale.h(16)),
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
                      icon: Icon(Icons.refresh, size: scale.w(20)),
                      label: Text(
                        'On lai tu yeu',
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
          ],
        ),
      ),
    );
  }
}

class _StatisticsSummaryCard extends StatelessWidget {
  const _StatisticsSummaryCard({
    required this.label,
    required this.value,
    required this.unit,
    required this.valueColor,
    this.footerIcon,
    this.footerText,
    this.footerColor,
  });

  final String label;
  final String value;
  final String unit;
  final Color valueColor;
  final IconData? footerIcon;
  final String? footerText;
  final Color? footerColor;

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
          Text(
            label,
            style: TextStyle(
              fontSize: scale.sp(12),
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
              color: AppColors.textSoft,
            ),
          ),
          SizedBox(height: scale.h(8)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: scale.sp(28),
                  fontWeight: FontWeight.w700,
                  color: valueColor,
                ),
              ),
              SizedBox(width: scale.w(4)),
              Padding(
                padding: EdgeInsets.only(bottom: scale.h(4)),
                child: Text(
                  unit,
                  style: TextStyle(
                    fontSize: scale.sp(14),
                    color: AppColors.textSoft,
                  ),
                ),
              ),
            ],
          ),
          if (footerText != null && footerIcon != null && footerColor != null) ...[
            SizedBox(height: scale.h(8)),
            Row(
              children: [
                Icon(footerIcon, size: scale.w(14), color: footerColor),
                SizedBox(width: scale.w(4)),
                Text(
                  footerText!,
                  style: TextStyle(
                    fontSize: scale.sp(12),
                    fontWeight: FontWeight.w700,
                    color: footerColor,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _StatisticsProgressCard extends StatelessWidget {
  const _StatisticsProgressCard({
    required this.label,
    required this.value,
    required this.progress,
    required this.progressColor,
  });

  final String label;
  final String value;
  final double progress;
  final Color progressColor;

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
          Text(
            label,
            style: TextStyle(
              fontSize: scale.sp(12),
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
              color: AppColors.textSoft,
            ),
          ),
          SizedBox(height: scale.h(8)),
          Text(
            value,
            style: TextStyle(
              fontSize: scale.sp(24),
              fontWeight: FontWeight.w600,
              color: AppColors.text,
            ),
          ),
          SizedBox(height: scale.h(12)),
          ClipRRect(
            borderRadius: BorderRadius.circular(scale.r(999)),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              backgroundColor: const Color(0xFFE0E3E5),
              valueColor: AlwaysStoppedAnimation<Color>(progressColor),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatisticsBar extends StatelessWidget {
  const _StatisticsBar({
    required this.heightFactor,
    required this.label,
    this.active = false,
    this.muted = false,
  });

  final double heightFactor;
  final String label;
  final bool active;
  final bool muted;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    final color = active
        ? AppColors.primaryContainer
        : muted
            ? const Color(0xFFE0E3E5)
            : const Color(0xFFD8E2FF);
    final labelColor = active ? AppColors.primary : AppColors.textMuted;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: scale.w(24),
            height: scale.h(100 * heightFactor),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(scale.r(8)),
                topRight: Radius.circular(scale.r(8)),
              ),
            ),
          ),
          SizedBox(height: scale.h(8)),
          Text(
            label,
            style: TextStyle(
              fontSize: scale.sp(10),
              fontWeight: FontWeight.w700,
              color: labelColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _AchievementBadge extends StatelessWidget {
  const _AchievementBadge({
    required this.icon,
    required this.background,
    required this.foreground,
    required this.label,
    this.locked = false,
  });

  final IconData icon;
  final Color background;
  final Color foreground;
  final String label;
  final bool locked;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Opacity(
      opacity: locked ? 0.6 : 1,
      child: Container(
        width: scale.w(128),
        padding: EdgeInsets.all(scale.w(12)),
        decoration: BoxDecoration(
          color: locked ? const Color(0xFFECEEF0) : Colors.white,
          borderRadius: BorderRadius.circular(scale.r(16)),
          border: Border.all(color: const Color(0xFFC2C6D6)),
        ),
        child: Column(
          children: [
            Container(
              width: scale.w(64),
              height: scale.w(64),
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: foreground, size: scale.w(32)),
            ),
            SizedBox(height: scale.h(8)),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: scale.sp(12),
                fontWeight: FontWeight.w600,
                color: locked ? AppColors.textMuted : AppColors.text,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WeakWordRow extends StatelessWidget {
  const _WeakWordRow({
    required this.word,
    required this.phonetic,
    required this.errorCount,
  });

  final String word;
  final String phonetic;
  final String errorCount;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Padding(
      padding: EdgeInsets.all(scale.w(16)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  word,
                  style: TextStyle(
                    fontSize: scale.sp(20),
                    fontWeight: FontWeight.w600,
                    color: AppColors.text,
                  ),
                ),
                SizedBox(height: scale.h(4)),
                Text(
                  phonetic,
                  style: TextStyle(
                    fontSize: scale.sp(14),
                    fontStyle: FontStyle.italic,
                    color: AppColors.textSoft,
                  ),
                ),
              ],
            ),
          ),
          Text(
            errorCount,
            style: TextStyle(
              fontSize: scale.sp(14),
              fontWeight: FontWeight.w700,
              color: AppColors.danger,
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
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: const _BottomNav(selectedIndex: 3),
      body: SafeArea(
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
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back),
                    color: AppColors.textSoft,
                  ),
                  Expanded(
                    child: Text(
                      'Cai dat',
                      style: TextStyle(
                        fontSize: scale.sp(24),
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  Container(
                    width: scale.w(40),
                    height: scale.w(40),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD8E2FF),
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFFD8E2FF), width: 2),
                    ),
                    child: Icon(Icons.person, color: AppColors.onPrimaryFixed, size: scale.w(20)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.fromLTRB(scale.w(20), scale.h(24), scale.w(20), scale.h(24)),
                children: [
                  Container(
                    padding: EdgeInsets.all(scale.w(16)),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(scale.r(16)),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
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
                        Container(
                          width: scale.w(64),
                          height: scale.w(64),
                          decoration: const BoxDecoration(
                            color: Color(0xFFD8E2FF),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.person, color: AppColors.primary, size: scale.w(32)),
                        ),
                        SizedBox(width: scale.w(16)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ten nguoi dung',
                                style: TextStyle(
                                  fontSize: scale.sp(20),
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.text,
                                ),
                              ),
                              SizedBox(height: scale.h(4)),
                              Text(
                                'user@example.com',
                                style: TextStyle(
                                  fontSize: scale.sp(14),
                                  color: AppColors.textSoft,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.edit),
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: scale.h(24)),
                  _SettingsSectionHeader(icon: Icons.school, title: 'Hoc tap'),
                  SizedBox(height: scale.h(12)),
                  Container(
                    decoration: _settingsGroupDecoration(scale),
                    child: Column(
                      children: [
                        _SettingsValueRow(
                          title: 'So tu moi moi ngay',
                          trailing: Container(
                            padding: EdgeInsets.symmetric(horizontal: scale.w(16), vertical: scale.h(8)),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE6E8EA),
                              borderRadius: BorderRadius.circular(scale.r(12)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '15',
                                  style: TextStyle(
                                    fontSize: scale.sp(16),
                                    color: AppColors.primary,
                                  ),
                                ),
                                SizedBox(width: scale.w(8)),
                                Icon(Icons.expand_more, color: AppColors.primary, size: scale.w(18)),
                              ],
                            ),
                          ),
                        ),
                        const Divider(height: 1, color: Color(0xFFC2C6D6)),
                        const _SettingsSimpleRow(
                          title: 'Che do mac dinh',
                          value: 'Flashcard',
                          valueColor: AppColors.primary,
                        ),
                        const Divider(height: 1, color: Color(0xFFC2C6D6)),
                        const _SettingsToggleRow(
                          title: 'Tu dong phat audio',
                          enabled: true,
                        ),
                        const Divider(height: 1, color: Color(0xFFC2C6D6)),
                        const _SettingsSimpleRow(
                          title: 'Giong doc',
                          value: 'US English',
                          trailingChevron: true,
                        ),
                        const Divider(height: 1, color: Color(0xFFC2C6D6)),
                        const _SettingsSimpleRow(
                          title: 'Muc do',
                          value: 'Intermediate',
                          trailingChevron: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: scale.h(24)),
                  _SettingsSectionHeader(icon: Icons.history, title: 'On tap'),
                  SizedBox(height: scale.h(12)),
                  Container(
                    decoration: _settingsGroupDecoration(scale),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(scale.w(16)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Chu ky on tap (ngay)',
                                      style: TextStyle(
                                        fontSize: scale.sp(16),
                                        color: AppColors.text,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Tuy chinh',
                                    style: TextStyle(
                                      fontSize: scale.sp(12),
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: scale.h(12)),
                              const Row(
                                children: [
                                  Expanded(child: _ReviewCycleChip(label: '1', outlined: true)),
                                  SizedBox(width: 8),
                                  Expanded(child: _ReviewCycleChip(label: '3')),
                                  SizedBox(width: 8),
                                  Expanded(child: _ReviewCycleChip(label: '5', selected: true)),
                                  SizedBox(width: 8),
                                  Expanded(child: _ReviewCycleChip(label: '7')),
                                  SizedBox(width: 8),
                                  Expanded(child: _ReviewCycleChip(label: '12')),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(height: 1, color: Color(0xFFC2C6D6)),
                        const _SettingsToggleRow(
                          title: 'Nhac hoc moi ngay',
                          enabled: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: scale.h(24)),
                  _SettingsSectionHeader(icon: Icons.storage, title: 'Du lieu'),
                  SizedBox(height: scale.h(12)),
                  Container(
                    decoration: _settingsGroupDecoration(scale),
                    child: const Column(
                      children: [
                        _SettingsActionRow(
                          icon: Icons.file_upload,
                          title: 'Export',
                        ),
                        Divider(height: 1, color: Color(0xFFC2C6D6)),
                        _SettingsActionRow(
                          icon: Icons.file_download,
                          title: 'Import',
                        ),
                        Divider(height: 1, color: Color(0xFFC2C6D6)),
                        _SettingsActionRow(
                          icon: Icons.delete_forever,
                          title: 'Xoa toan bo du lieu',
                          danger: true,
                          showChevron: false,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: scale.h(24)),
                  Opacity(
                    opacity: 0.4,
                    child: Column(
                      children: [
                        Text(
                          'Text2Card v2.4.0',
                          style: TextStyle(
                            fontSize: scale.sp(12),
                            fontWeight: FontWeight.w600,
                            color: AppColors.text,
                          ),
                        ),
                        SizedBox(height: scale.h(4)),
                        Text(
                          'Cam on ban da lua chon Text2Card de chinh phuc Anh ngu',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: scale.sp(14),
                            color: AppColors.text,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

BoxDecoration _settingsGroupDecoration(Scale scale) {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(scale.r(16)),
    border: Border.all(color: const Color(0xFFC2C6D6)),
  );
}

class _SettingsSectionHeader extends StatelessWidget {
  const _SettingsSectionHeader({
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Row(
      children: [
        Icon(icon, color: AppColors.primary, size: scale.w(20)),
        SizedBox(width: scale.w(6)),
        Text(
          title,
          style: TextStyle(
            fontSize: scale.sp(20),
            fontWeight: FontWeight.w600,
            color: AppColors.text,
          ),
        ),
      ],
    );
  }
}

class _SettingsValueRow extends StatelessWidget {
  const _SettingsValueRow({
    required this.title,
    required this.trailing,
  });

  final String title;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Padding(
      padding: EdgeInsets.all(scale.w(16)),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: scale.sp(16),
                color: AppColors.text,
              ),
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}

class _SettingsSimpleRow extends StatelessWidget {
  const _SettingsSimpleRow({
    required this.title,
    required this.value,
    this.valueColor = AppColors.textSoft,
    this.trailingChevron = false,
  });

  final String title;
  final String value;
  final Color valueColor;
  final bool trailingChevron;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Padding(
      padding: EdgeInsets.all(scale.w(16)),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: scale.sp(16),
                color: AppColors.text,
              ),
            ),
          ),
          Row(
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: scale.sp(16),
                  fontWeight: valueColor == AppColors.primary ? FontWeight.w500 : FontWeight.w400,
                  color: valueColor,
                ),
              ),
              if (trailingChevron) ...[
                SizedBox(width: scale.w(4)),
                Icon(Icons.chevron_right, size: scale.w(18), color: AppColors.textSoft),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _SettingsToggleRow extends StatelessWidget {
  const _SettingsToggleRow({
    required this.title,
    required this.enabled,
  });

  final String title;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Padding(
      padding: EdgeInsets.all(scale.w(16)),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: scale.sp(16),
                color: AppColors.text,
              ),
            ),
          ),
          Container(
            width: scale.w(44),
            height: scale.h(24),
            padding: EdgeInsets.all(scale.w(2)),
            decoration: BoxDecoration(
              color: enabled ? AppColors.primary : const Color(0xFFC2C6D6),
              borderRadius: BorderRadius.circular(scale.r(999)),
            ),
            child: Align(
              alignment: enabled ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: scale.w(20),
                height: scale.w(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ReviewCycleChip extends StatelessWidget {
  const _ReviewCycleChip({
    required this.label,
    this.selected = false,
    this.outlined = false,
  });

  final String label;
  final bool selected;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Container(
      padding: EdgeInsets.symmetric(vertical: scale.h(8)),
      decoration: BoxDecoration(
        color: selected ? AppColors.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(scale.r(8)),
        border: Border.all(
          color: outlined || selected ? AppColors.primary : const Color(0xFFC2C6D6),
        ),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: scale.sp(16),
          fontWeight: FontWeight.w700,
          color: selected
              ? Colors.white
              : outlined
                  ? AppColors.primary
                  : AppColors.textSoft,
        ),
      ),
    );
  }
}

class _SettingsActionRow extends StatelessWidget {
  const _SettingsActionRow({
    required this.icon,
    required this.title,
    this.danger = false,
    this.showChevron = true,
  });

  final IconData icon;
  final String title;
  final bool danger;
  final bool showChevron;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    final color = danger ? AppColors.danger : AppColors.textSoft;
    return Padding(
      padding: EdgeInsets.all(scale.w(16)),
      child: Row(
        children: [
          Icon(icon, size: scale.w(22), color: color),
          SizedBox(width: scale.w(16)),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: scale.sp(16),
                fontWeight: danger ? FontWeight.w600 : FontWeight.w400,
                color: danger ? AppColors.danger : AppColors.text,
              ),
            ),
          ),
          if (showChevron)
            Icon(Icons.chevron_right, size: scale.w(18), color: AppColors.textSoft),
        ],
      ),
    );
  }
}

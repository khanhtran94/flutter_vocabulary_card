part of '../../app/vocabulary_app.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  void _open(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        titleSpacing: scale.w(16),
        title: Row(
          children: [
            Container(
              width: scale.w(32),
              height: scale.w(32),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(scale.r(10)),
              ),
              child: Icon(Icons.style, color: Colors.white, size: scale.w(18)),
            ),
            SizedBox(width: scale.w(8)),
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
        actions: [
          Padding(
            padding: EdgeInsets.only(right: scale.w(16)),
            child: InkWell(
              onTap: () => _open(context, const SettingsScreen()),
              customBorder: const CircleBorder(),
              child: CircleAvatar(
                radius: scale.w(20),
                backgroundColor: AppColors.surface,
                child: Icon(
                  Icons.person,
                  color: AppColors.textSoft,
                  size: scale.w(20),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const _BottomNav(selectedIndex: 0),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: EdgeInsets.fromLTRB(scale.w(20), scale.h(24), scale.w(20), scale.h(32)),
          children: [
            Text.rich(
              TextSpan(
                text: 'Chào bạn, hôm nay bạn có ',
                children: [
                  TextSpan(
                    text: '12',
                    style: TextStyle(color: AppColors.primary),
                  ),
                  const TextSpan(text: ' từ cần ôn'),
                ],
              ),
              style: TextStyle(
                fontSize: scale.sp(28),
                fontWeight: FontWeight.w700,
                height: 1.25,
                color: AppColors.text,
              ),
            ),
            SizedBox(height: scale.h(4)),
            Text(
              'Học 10 phút để giữ chuỗi ngày học của bạn.',
              style: TextStyle(
                fontSize: scale.sp(16),
                height: 1.45,
                color: AppColors.textSoft,
              ),
            ),
            SizedBox(height: scale.h(24)),
            SizedBox(
              width: double.infinity,
              height: scale.h(64),
              child: FilledButton.icon(
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF2170E4),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(scale.r(16)),
                  ),
                ),
                onPressed: () => _open(context, const StudyTodayScreen()),
                icon: Icon(Icons.play_circle_fill, size: scale.w(24)),
                label: Text(
                  'Bắt đầu học hôm nay',
                  style: TextStyle(fontSize: scale.sp(20), fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(height: scale.h(12)),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: scale.w(12),
              mainAxisSpacing: scale.h(12),
              childAspectRatio: 1,
              children: [
                _DashboardStatCard(
                  label: 'Cần ôn',
                  value: '12',
                  valueColor: AppColors.danger,
                  icon: Icons.schedule,
                  iconBackground: Color(0xFFFFDAD6),
                  iconColor: Color(0xFF93000A),
                  onTap: () => _open(context, const ReviewCalendarScreen()),
                ),
                _DashboardStatCard(
                  label: 'Đang học',
                  value: '35',
                  valueColor: AppColors.primary,
                  icon: Icons.auto_stories,
                  iconBackground: Color(0xFFD8E2FF),
                  iconColor: Color(0xFF004395),
                  onTap: () => _open(context, const VocabularyLibraryScreen()),
                ),
                _DashboardStatCard(
                  label: 'Đã ghi nhớ',
                  value: '60',
                  valueColor: AppColors.secondary,
                  icon: Icons.task_alt,
                  iconBackground: Color(0xFF6CF8BB),
                  iconColor: Color(0xFF00714D),
                  onTap: () => _open(context, const VocabularyLibraryScreen()),
                ),
                _DashboardStatCard(
                  label: 'Streak',
                  value: '5 ngày',
                  valueColor: AppColors.tertiary,
                  icon: Icons.local_fire_department,
                  iconBackground: Color(0xFFFFDAD9),
                  iconColor: Color(0xFF723335),
                  onTap: () => _open(context, const StatisticsScreen()),
                ),
              ],
            ),
            SizedBox(height: scale.h(12)),
            _WeeklyProgressCard(scale: scale),
            SizedBox(height: scale.h(12)),
            Text(
              'Thao tác nhanh',
              style: TextStyle(
                fontSize: scale.sp(20),
                fontWeight: FontWeight.w600,
                color: AppColors.text,
              ),
            ),
            SizedBox(height: scale.h(12)),
            _QuickActionButton(
              icon: Icons.add_box_outlined,
              onPressed: () => _open(context, const PasteTextScreen()),
              title: 'Nhập đoạn tiếng Anh mới',
            ),
            SizedBox(height: 12),
            _QuickActionButton(
              icon: Icons.folder_open_outlined,
              onPressed: () => _open(context, const VocabularyLibraryScreen()),
              title: 'Xem kho từ vựng',
            ),
            SizedBox(height: 12),
            _QuickActionButton(
              icon: Icons.calendar_month_outlined,
              onPressed: () => _open(context, const ReviewCalendarScreen()),
              title: 'Lịch ôn tập',
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardStatCard extends StatelessWidget {
  const _DashboardStatCard({
    required this.label,
    required this.value,
    required this.valueColor,
    required this.icon,
    required this.iconBackground,
    required this.iconColor,
    required this.onTap,
  });

  final String label;
  final String value;
  final Color valueColor;
  final IconData icon;
  final Color iconBackground;
  final Color iconColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(scale.r(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(scale.r(16)),
        child: Container(
          padding: EdgeInsets.all(scale.w(16)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(scale.r(16)),
            border: Border.all(color: const Color(0xFFC2C6D6)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: scale.w(40),
                height: scale.w(40),
                decoration: BoxDecoration(
                  color: iconBackground,
                  borderRadius: BorderRadius.circular(scale.r(12)),
                ),
                child: Icon(icon, color: iconColor, size: scale.w(22)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: scale.sp(12),
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSoft,
                    ),
                  ),
                  SizedBox(height: scale.h(4)),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: scale.sp(24),
                      fontWeight: FontWeight.w700,
                      color: valueColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WeeklyProgressCard extends StatelessWidget {
  const _WeeklyProgressCard({required this.scale});

  final Scale scale;

  @override
  Widget build(BuildContext context) {
    const completedDays = 4;
    const totalDays = 7;
    const dayLabels = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];

    return Container(
      padding: EdgeInsets.all(scale.w(16)),
      decoration: BoxDecoration(
        color: const Color(0xFFECEEF0),
        borderRadius: BorderRadius.circular(scale.r(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tuần này: 4/7 ngày đã học',
                style: TextStyle(
                  fontSize: scale.sp(20),
                  fontWeight: FontWeight.w600,
                  color: AppColors.text,
                ),
              ),
              Text(
                'Tốt!',
                style: TextStyle(
                  fontSize: scale.sp(12),
                  fontWeight: FontWeight.w700,
                  color: AppColors.secondary,
                ),
              ),
            ],
          ),
          SizedBox(height: scale.h(16)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(dayLabels.length, (index) {
              final completed = index < completedDays;
              return Column(
                children: [
                  Text(
                    dayLabels[index],
                    style: TextStyle(
                      fontSize: scale.sp(10),
                      fontWeight: FontWeight.w700,
                      color: AppColors.textMuted,
                    ),
                  ),
                  SizedBox(height: scale.h(8)),
                  Container(
                    width: scale.w(32),
                    height: scale.w(32),
                    decoration: BoxDecoration(
                      color: completed ? AppColors.secondary : const Color(0xFFE0E3E5),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      completed ? Icons.check : Icons.radio_button_unchecked,
                      size: scale.w(18),
                      color: completed ? Colors.white : AppColors.textMuted,
                    ),
                  ),
                ],
              );
            }),
          ),
          SizedBox(height: scale.h(24)),
          ClipRRect(
            borderRadius: BorderRadius.circular(scale.r(999)),
            child: LinearProgressIndicator(
              value: 4 / totalDays,
              minHeight: scale.h(8),
              backgroundColor: const Color(0xFFE0E3E5),
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.secondary),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  const _QuickActionButton({
    required this.icon,
    required this.title,
    required this.onPressed,
  });

  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return SizedBox(
      width: double.infinity,
      height: scale.h(56),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: AppColors.text,
          side: const BorderSide(color: Color(0xFFC2C6D6)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(scale.r(16)),
          ),
          padding: EdgeInsets.symmetric(horizontal: scale.w(16)),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(icon, color: AppColors.primary, size: scale.w(24)),
            SizedBox(width: scale.w(16)),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: scale.sp(16),
                  color: AppColors.text,
                ),
              ),
            ),
            Icon(Icons.chevron_right, color: const Color(0xFF727785), size: scale.w(22)),
          ],
        ),
      ),
    );
  }
}

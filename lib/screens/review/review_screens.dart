part of '../../app/vocabulary_app.dart';

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
                  backgroundColor: AppColors.primary.withValues(alpha: 0.12),
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
            style: TextStyle(
              fontSize: scale.sp(26),
              fontWeight: FontWeight.w700,
              color: AppColors.text,
            ),
          ),
          SizedBox(height: scale.h(4)),
          Text(
            label,
            style: TextStyle(
              fontSize: scale.sp(13),
              color: AppColors.textSoft,
            ),
          ),
        ],
      ),
    );
  }
}




part of vocabulary_app;

class ReviewCalendarScreen extends StatelessWidget {
  const ReviewCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return AppShell(
      title: 'L?ch ôn',
      selectedIndex: 2,
      child: ListView(
        padding: EdgeInsets.all(scale.w(16)),
        children: [
          _CalendarHeader(scale: scale),
          SizedBox(height: scale.h(16)),
          _CalendarGrid(scale: scale),
          SizedBox(height: scale.h(16)),
          const _InfoCard(
            title: 'G?i ý',
            body: 'Các ô màu d?m là ngày b?n dã h?c nhi?u t? hon m?c trung bình.',
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
      title: 'Th?ng kê',
      selectedIndex: 2,
      child: ListView(
        padding: EdgeInsets.all(scale.w(16)),
        children: [
          Row(
            children: [
              Expanded(child: _StatCard(label: 'T? dã h?c', value: '312', icon: Icons.menu_book_outlined, color: AppColors.primary)),
              SizedBox(width: scale.w(12)),
              Expanded(child: _StatCard(label: 'Chu?i ngày', value: '18', icon: Icons.local_fire_department_outlined, color: AppColors.secondary)),
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
                Text('Ti?n d? 7 ngày', style: TextStyle(fontSize: scale.sp(18), fontWeight: FontWeight.w700)),
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
      title: 'Cài d?t',
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
                  backgroundColor: AppColors.primary.withOpacity(0.12),
                  child: Icon(Icons.person, color: AppColors.primary, size: scale.w(28)),
                ),
                SizedBox(width: scale.w(16)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Minh Tr?n', style: TextStyle(fontSize: scale.sp(18), fontWeight: FontWeight.w700)),
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
            ('Ngôn ng?', Icons.language_outlined),
            ('Ð?ng b?', Icons.sync_outlined),
            ('Tr? giúp', Icons.help_outline),
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

part of vocabulary_app;

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return AppShell(
      title: 'Xin chào, Minh',
      selectedIndex: 0,
      child: ListView(
        padding: EdgeInsets.fromLTRB(scale.w(16), scale.h(8), scale.w(16), scale.h(24)),
        children: [
          _HeroCard(
            title: 'Hôm nay bạn đã học 18 từ',
            subtitle: 'Còn 6 từ nữa để hoàn thành mục tiêu 30 từ.',
            progress: 0.6,
            buttonText: 'Bắt đầu học',
          ),
          SizedBox(height: scale.h(16)),
          Row(
            children: [
              Expanded(child: _StatCard(label: 'Đã nhớ', value: '142', icon: Icons.check_circle_outline, color: AppColors.secondary)),
              SizedBox(width: scale.w(12)),
              Expanded(child: _StatCard(label: 'Cần ôn', value: '28', icon: Icons.refresh_outlined, color: AppColors.danger)),
            ],
          ),
          SizedBox(height: scale.h(16)),
          _SectionHeader(title: 'Lối tắt', action: 'Xem tất cả'),
          SizedBox(height: scale.h(12)),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: scale.w(12),
            mainAxisSpacing: scale.h(12),
            childAspectRatio: 1.55,
            children: const [
              _ShortcutCard(title: 'Dán văn bản', icon: Icons.paste_outlined, color: AppColors.primary),
              _ShortcutCard(title: 'Bộ thẻ', icon: Icons.collections_bookmark_outlined, color: AppColors.secondary),
              _ShortcutCard(title: 'Lịch ôn', icon: Icons.calendar_month_outlined, color: AppColors.tertiary),
              _ShortcutCard(title: 'Thống kê', icon: Icons.bar_chart_outlined, color: AppColors.primaryDark),
            ],
          ),
          SizedBox(height: scale.h(16)),
          _SectionHeader(title: 'Sắp tới', action: 'Chi tiết'),
          SizedBox(height: scale.h(12)),
          const _UpcomingList(),
        ],
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({
    required this.title,
    required this.subtitle,
    required this.progress,
    required this.buttonText,
  });

  final String title;
  final String subtitle;
  final double progress;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Container(
      padding: EdgeInsets.all(scale.w(20)),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(scale.r(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: scale.w(54),
            height: scale.w(54),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.16),
              borderRadius: BorderRadius.circular(scale.r(18)),
            ),
            child: Icon(Icons.auto_stories_outlined, color: Colors.white, size: scale.w(28)),
          ),
          SizedBox(height: scale.h(16)),
          Text(
            title,
            style: TextStyle(
              fontSize: scale.sp(24),
              fontWeight: FontWeight.w700,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          SizedBox(height: scale.h(8)),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: scale.sp(15),
              color: Colors.white.withOpacity(0.88),
              height: 1.45,
            ),
          ),
          SizedBox(height: scale.h(16)),
          ClipRRect(
            borderRadius: BorderRadius.circular(scale.r(999)),
            child: LinearProgressIndicator(
              minHeight: scale.h(8),
              value: progress,
              backgroundColor: Colors.white.withOpacity(0.18),
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.secondary),
            ),
          ),
          SizedBox(height: scale.h(12)),
          SizedBox(
            width: double.infinity,
            height: scale.h(48),
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.primaryDark,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(scale.r(14))),
              ),
              onPressed: () {},
              child: Text(buttonText),
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
            style: TextStyle(fontSize: scale.sp(26), fontWeight: FontWeight.w700, color: AppColors.text),
          ),
          SizedBox(height: scale.h(4)),
          Text(label, style: TextStyle(fontSize: scale.sp(13), color: AppColors.textSoft)),
        ],
      ),
    );
  }
}

class _ShortcutCard extends StatelessWidget {
  const _ShortcutCard({
    required this.title,
    required this.icon,
    required this.color,
  });

  final String title;
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: scale.w(40),
            height: scale.w(40),
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(scale.r(12)),
            ),
            child: Icon(icon, color: color, size: scale.w(22)),
          ),
          Text(
            title,
            style: TextStyle(fontSize: scale.sp(15), fontWeight: FontWeight.w600, color: AppColors.text),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.action});

  final String title;
  final String action;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: scale.sp(18), fontWeight: FontWeight.w700, color: AppColors.text)),
        Text(action, style: TextStyle(fontSize: scale.sp(13), color: AppColors.primary, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class _UpcomingList extends StatelessWidget {
  const _UpcomingList();

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    final items = [
      ('Study today', '08:30', AppColors.primary),
      ('Review flashcards', '12:15', AppColors.secondary),
      ('Quiz practice', '20:00', AppColors.tertiary),
    ];
    return Column(
      children: items
          .map(
            (item) => Padding(
              padding: EdgeInsets.only(bottom: scale.h(12)),
              child: Container(
                padding: EdgeInsets.all(scale.w(16)),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(scale.r(18)),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: [
                    Container(
                      width: scale.w(12),
                      height: scale.w(12),
                      decoration: BoxDecoration(color: item.$3, shape: BoxShape.circle),
                    ),
                    SizedBox(width: scale.w(12)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.$1, style: TextStyle(fontSize: scale.sp(15), fontWeight: FontWeight.w600)),
                          SizedBox(height: scale.h(4)),
                          Text('Ngày hôm nay', style: TextStyle(fontSize: scale.sp(13), color: AppColors.textSoft)),
                        ],
                      ),
                    ),
                    Text(item.$2, style: TextStyle(fontSize: scale.sp(13), color: AppColors.textMuted)),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}



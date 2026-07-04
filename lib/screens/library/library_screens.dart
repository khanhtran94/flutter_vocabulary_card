part of '../../app/vocabulary_app.dart';

class VocabularyLibraryScreen extends StatelessWidget {
  const VocabularyLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: const _BottomNav(selectedIndex: 2),
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
                      color: AppColors.primaryContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.person, color: AppColors.onPrimaryContainer, size: scale.w(20)),
                  ),
                  SizedBox(width: scale.w(12)),
                  Expanded(
                    child: Text(
                      'Kho từ vựng',
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
                    children: [
                      Expanded(
                        child: Container(
                          height: scale.h(52),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(scale.r(16)),
                            border: Border.all(color: const Color(0xFFC2C6D6)),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Tìm từ hoặc nghĩa...',
                              hintStyle: TextStyle(
                                fontSize: scale.sp(16),
                                color: AppColors.textSoft,
                              ),
                              prefixIcon: Icon(Icons.search, color: AppColors.textSoft, size: scale.w(22)),
                              contentPadding: EdgeInsets.symmetric(vertical: scale.h(14)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: scale.w(8)),
                      Container(
                        width: scale.w(52),
                        height: scale.w(52),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(scale.r(16)),
                          border: Border.all(color: const Color(0xFFC2C6D6)),
                        ),
                        child: Icon(Icons.filter_list, color: AppColors.primary, size: scale.w(24)),
                      ),
                    ],
                  ),
                  SizedBox(height: scale.h(16)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [
                        _LibraryTab(label: 'Tất cả', selected: true),
                        SizedBox(width: 12),
                        _LibraryTab(label: 'Đang học'),
                        SizedBox(width: 12),
                        _LibraryTab(label: 'Cần ôn'),
                        SizedBox(width: 12),
                        _LibraryTab(label: 'Đã ghi nhớ'),
                      ],
                    ),
                  ),
                  SizedBox(height: scale.h(24)),
                  const _VocabularyProgressCard(
                    word: 'consistency',
                    meaning: 'sự đều đặn, tính kiên định',
                    badgeLabel: 'Reviewing',
                    badgeBackground: Color(0xFF6CF8BB),
                    badgeForeground: Color(0xFF00714D),
                    progress: 0.8,
                    progressText: '4/5',
                    progressColor: AppColors.secondary,
                    statusIcon: Icons.event_repeat,
                    statusText: 'Ôn tiếp sau 2 ngày',
                    statusColor: AppColors.primary,
                  ),
                  SizedBox(height: 16),
                  const _VocabularyProgressCard(
                    word: 'resilience',
                    meaning: 'khả năng phục hồi, sự kiên cường',
                    badgeLabel: 'Learning',
                    badgeBackground: Color(0xFFFFDAD9),
                    badgeForeground: Color(0xFF723335),
                    progress: 0.4,
                    progressText: '2/5',
                    progressColor: AppColors.tertiary,
                    statusIcon: Icons.history,
                    statusText: 'Vừa mới học xong',
                    statusColor: AppColors.tertiary,
                  ),
                  SizedBox(height: 16),
                  const _VocabularyProgressCard(
                    word: 'meticulous',
                    meaning: 'tỉ mỉ, trau chuốt',
                    badgeLabel: 'Mastered',
                    badgeBackground: Color(0xFFD8E2FF),
                    badgeForeground: Color(0xFF004395),
                    progress: 1,
                    progressText: '5/5',
                    progressColor: AppColors.primary,
                    statusIcon: Icons.verified,
                    statusText: 'Đã thành thạo hoàn toàn',
                    statusColor: AppColors.secondary,
                    statusFilled: true,
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

class _LibraryTab extends StatelessWidget {
  const _LibraryTab({
    required this.label,
    this.selected = false,
  });

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: scale.w(16), vertical: scale.h(8)),
      decoration: BoxDecoration(
        color: selected ? AppColors.primary : const Color(0xFFE6E8EA),
        borderRadius: BorderRadius.circular(scale.r(999)),
        boxShadow: selected
            ? const [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: scale.sp(12),
          fontWeight: FontWeight.w600,
          color: selected ? Colors.white : AppColors.textSoft,
        ),
      ),
    );
  }
}

class _VocabularyProgressCard extends StatelessWidget {
  const _VocabularyProgressCard({
    required this.word,
    required this.meaning,
    required this.badgeLabel,
    required this.badgeBackground,
    required this.badgeForeground,
    required this.progress,
    required this.progressText,
    required this.progressColor,
    required this.statusIcon,
    required this.statusText,
    required this.statusColor,
    this.statusFilled = false,
  });

  final String word;
  final String meaning;
  final String badgeLabel;
  final Color badgeBackground;
  final Color badgeForeground;
  final double progress;
  final String progressText;
  final Color progressColor;
  final IconData statusIcon;
  final String statusText;
  final Color statusColor;
  final bool statusFilled;

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            word,
                            style: TextStyle(
                              fontSize: scale.sp(20),
                              fontWeight: FontWeight.w600,
                              color: AppColors.text,
                            ),
                          ),
                        ),
                        SizedBox(width: scale.w(4)),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.volume_up),
                          color: AppColors.primary,
                          visualDensity: VisualDensity.compact,
                        ),
                      ],
                    ),
                    Text(
                      meaning,
                      style: TextStyle(
                        fontSize: scale.sp(16),
                        color: AppColors.textSoft,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: scale.w(12), vertical: scale.h(4)),
                decoration: BoxDecoration(
                  color: badgeBackground,
                  borderRadius: BorderRadius.circular(scale.r(999)),
                ),
                child: Text(
                  badgeLabel,
                  style: TextStyle(
                    fontSize: scale.sp(12),
                    fontWeight: FontWeight.w600,
                    color: badgeForeground,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: scale.h(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tiến độ học tập',
                style: TextStyle(
                  fontSize: scale.sp(12),
                  color: AppColors.textSoft,
                ),
              ),
              Text(
                progressText,
                style: TextStyle(
                  fontSize: scale.sp(12),
                  fontWeight: FontWeight.w700,
                  color: AppColors.textSoft,
                ),
              ),
            ],
          ),
          SizedBox(height: scale.h(8)),
          ClipRRect(
            borderRadius: BorderRadius.circular(scale.r(999)),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: const Color(0xFFECEEF0),
              valueColor: AlwaysStoppedAnimation<Color>(progressColor),
            ),
          ),
          SizedBox(height: scale.h(8)),
          Row(
            children: [
              Icon(
                statusFilled ? Icons.verified : statusIcon,
                size: scale.w(18),
                color: statusColor,
              ),
              SizedBox(width: scale.w(6)),
              Expanded(
                child: Text(
                  statusText,
                  style: TextStyle(
                    fontSize: scale.sp(12),
                    fontWeight: FontWeight.w600,
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FlashcardDetailScreen extends StatelessWidget {
  const FlashcardDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: const _BottomNav(selectedIndex: 2),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(scale.w(20), scale.h(8), scale.w(20), scale.h(8)),
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
                    color: AppColors.primary,
                  ),
                  Expanded(
                    child: Text(
                      'Chi tiết từ vựng',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: scale.sp(20),
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert),
                    color: AppColors.textSoft,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.fromLTRB(scale.w(20), scale.h(16), scale.w(20), scale.h(24)),
                children: [
                  Container(
                    height: scale.h(420),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'TIẾNG VIỆT',
                            style: TextStyle(
                              fontSize: scale.sp(12),
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                              color: AppColors.secondary,
                            ),
                          ),
                        ),
                        SizedBox(height: scale.h(8)),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'gặp khó khăn với',
                                style: TextStyle(
                                  fontSize: scale.sp(24),
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.text,
                                  height: 1.3,
                                ),
                              ),
                            ),
                            Icon(Icons.verified, color: const Color(0xFF4EDEA3), size: scale.w(22)),
                          ],
                        ),
                        SizedBox(height: scale.h(24)),
                        Container(height: 1, color: const Color(0xFFC2C6D6)),
                        SizedBox(height: scale.h(24)),
                        Container(
                          padding: EdgeInsets.all(scale.w(16)),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF2F4F6),
                            borderRadius: BorderRadius.circular(scale.r(16)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '"I struggle with consistency."',
                                style: TextStyle(
                                  fontSize: scale.sp(16),
                                  fontStyle: FontStyle.italic,
                                  color: AppColors.textSoft,
                                  height: 1.5,
                                ),
                              ),
                              SizedBox(height: scale.h(4)),
                              Text(
                                'Tôi gặp khó khăn với sự đều đặn.',
                                style: TextStyle(
                                  fontSize: scale.sp(14),
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Center(
                          child: Text(
                            'Nhấn để quay lại',
                            style: TextStyle(
                              fontSize: scale.sp(14),
                              color: AppColors.textMuted,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: scale.h(32)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tiến trình học tập',
                        style: TextStyle(
                          fontSize: scale.sp(20),
                          fontWeight: FontWeight.w600,
                          color: AppColors.text,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: scale.w(12), vertical: scale.h(6)),
                        decoration: BoxDecoration(
                          color: const Color(0xFF6CF8BB),
                          borderRadius: BorderRadius.circular(scale.r(999)),
                        ),
                        child: Text(
                          'Lần học 2/5',
                          style: TextStyle(
                            fontSize: scale.sp(12),
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF00714D),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: scale.h(16)),
                  Container(
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
                    child: const _FlashcardProgressTimeline(),
                  ),
                  SizedBox(height: scale.h(24)),
                  Row(
                    children: const [
                      Expanded(
                        child: _FlashcardStatCard(
                          icon: Icons.check_circle,
                          iconColor: AppColors.secondary,
                          label: 'Số lần đúng',
                          value: '4',
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: _FlashcardStatCard(
                          icon: Icons.cancel,
                          iconColor: AppColors.danger,
                          label: 'Số lần sai',
                          value: '2',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: scale.h(16)),
                  Container(
                    padding: EdgeInsets.all(scale.w(20)),
                    decoration: BoxDecoration(
                      color: AppColors.primaryContainer.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(scale.r(16)),
                      border: Border.all(color: const Color(0xFFC2C6D6)),
                    ),
                    child: Column(
                      children: const [
                        _FlashcardMetaRow(
                          icon: Icons.calendar_today,
                          label: 'Ngày tạo',
                          value: '24/06/2026',
                          valueColor: AppColors.text,
                        ),
                        SizedBox(height: 12),
                        Divider(height: 1, color: Color(0x4DC2C6D6)),
                        SizedBox(height: 12),
                        _FlashcardMetaRow(
                          icon: Icons.event_repeat,
                          label: 'Ôn tiếp',
                          value: '29/06/2026',
                          valueColor: AppColors.primary,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: scale.h(24)),
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
                      icon: Icon(Icons.school, size: scale.w(20)),
                      label: Text(
                        'Học từ này',
                        style: TextStyle(
                          fontSize: scale.sp(16),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: scale.h(16)),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.primary,
                            side: const BorderSide(color: Color(0xFFC2C6D6)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(scale.r(16)),
                            ),
                            padding: EdgeInsets.symmetric(vertical: scale.h(14)),
                          ),
                          onPressed: () {},
                          icon: Icon(Icons.edit_note, size: scale.w(18)),
                          label: Text(
                            'Sửa nghĩa',
                            style: TextStyle(
                              fontSize: scale.sp(14),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: scale.w(16)),
                      Expanded(
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.danger,
                            side: const BorderSide(color: AppColors.danger),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(scale.r(16)),
                            ),
                            padding: EdgeInsets.symmetric(vertical: scale.h(14)),
                          ),
                          onPressed: () {},
                          icon: Icon(Icons.delete, size: scale.w(18)),
                          label: Text(
                            'Xóa thẻ',
                            style: TextStyle(
                              fontSize: scale.sp(14),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
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
    );
  }
}

class _FlashcardProgressTimeline extends StatelessWidget {
  const _FlashcardProgressTimeline();

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    const labels = ['Ngày 1', 'Ngày 3', 'Ngày 5', 'Ngày 10', 'Ngày 30'];
    return Column(
      children: [
        SizedBox(
          height: scale.h(52),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  height: 2,
                  color: const Color(0xFFC2C6D6),
                ),
              ),
              Positioned(
                left: 0,
                right: scale.w(170),
                child: Container(
                  height: 2,
                  color: AppColors.secondary,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(labels.length, (index) {
                  final completed = index < 2;
                  final active = index == 2;
                  return _TimelineStep(
                    label: labels[index],
                    completed: completed,
                    active: active,
                  );
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TimelineStep extends StatelessWidget {
  const _TimelineStep({
    required this.label,
    required this.completed,
    required this.active,
  });

  final String label;
  final bool completed;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    Widget dot;
    if (completed) {
      dot = Container(
        width: scale.w(24),
        height: scale.w(24),
        decoration: const BoxDecoration(
          color: AppColors.secondary,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.check, color: Colors.white, size: scale.w(14)),
      );
    } else if (active) {
      dot = Container(
        width: scale.w(24),
        height: scale.w(24),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primary, width: 2),
        ),
        child: Center(
          child: Container(
            width: scale.w(8),
            height: scale.w(8),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
    } else {
      dot = Container(
        width: scale.w(24),
        height: scale.w(24),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFC2C6D6), width: 2),
        ),
      );
    }

    return Column(
      children: [
        dot,
        SizedBox(height: scale.h(8)),
        Text(
          label,
          style: TextStyle(
            fontSize: scale.sp(10),
            fontWeight: FontWeight.w700,
            color: active
                ? AppColors.primary
                : completed
                    ? AppColors.textSoft
                    : AppColors.textMuted,
          ),
        ),
      ],
    );
  }
}

class _FlashcardStatCard extends StatelessWidget {
  const _FlashcardStatCard({
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
        color: const Color(0xFFF7F9FB),
        borderRadius: BorderRadius.circular(scale.r(16)),
        border: Border.all(color: const Color(0xFFC2C6D6)),
      ),
      child: Row(
        children: [
          Container(
            width: scale.w(40),
            height: scale.w(40),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: scale.w(20)),
          ),
          SizedBox(width: scale.w(12)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: scale.sp(12),
                    color: AppColors.textMuted,
                  ),
                ),
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
          ),
        ],
      ),
    );
  }
}

class _FlashcardMetaRow extends StatelessWidget {
  const _FlashcardMetaRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.valueColor,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Row(
      children: [
        Icon(icon, size: scale.w(18), color: AppColors.primary),
        SizedBox(width: scale.w(8)),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: scale.sp(14),
              color: AppColors.textSoft,
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: scale.sp(14),
            fontWeight: FontWeight.w600,
            color: valueColor,
          ),
        ),
      ],
    );
  }
}



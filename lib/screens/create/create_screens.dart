part of '../../app/vocabulary_app.dart';

class CreateDeckScreen extends StatefulWidget {
  const CreateDeckScreen({super.key});

  @override
  State<CreateDeckScreen> createState() => _CreateDeckScreenState();
}

class _CreateDeckScreenState extends State<CreateDeckScreen> {
  final _formKey = GlobalKey<FormState>();
  final _deckNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _englishController = TextEditingController();
  final _vietnameseController = TextEditingController();
  final List<NewFlashcard> _cards = [];
  late final CreateFlashcardsController _controller;

  @override
  void initState() {
    super.initState();
    final services = AppServices.instance;
    _controller = CreateFlashcardsController(
      deckRepository: services.deckRepository,
      cardRepository: services.cardRepository,
    )..addListener(_refresh);
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_refresh)
      ..dispose();
    _deckNameController.dispose();
    _descriptionController.dispose();
    _englishController.dispose();
    _vietnameseController.dispose();
    super.dispose();
  }

  void _refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  void _addCard() {
    final english = _englishController.text.trim();
    final vietnamese = _vietnameseController.text.trim();
    if (english.isEmpty || vietnamese.isEmpty) {
      return;
    }
    setState(() {
      _cards.add(NewFlashcard(english: english, vietnamese: vietnamese));
      _englishController.clear();
      _vietnameseController.clear();
    });
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (_englishController.text.trim().isNotEmpty ||
        _vietnameseController.text.trim().isNotEmpty) {
      _addCard();
    }
    final deckId = await _controller.createDeckWithCards(
      deckName: _deckNameController.text,
      description: _descriptionController.text,
      cards: _cards,
    );
    if (!mounted) {
      return;
    }
    if (deckId != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đã lưu bộ flashcard trên thiết bị.')),
      );
      Navigator.of(context).pop();
    } else if (_controller.errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_controller.errorMessage!)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Scaffold(
      appBar: AppBar(title: const Text('Tạo bộ flashcard offline')),
      backgroundColor: AppColors.background,
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(scale.w(20)),
          children: [
            TextFormField(
              controller: _deckNameController,
              decoration: const InputDecoration(
                labelText: 'Tên bộ thẻ',
                border: OutlineInputBorder(),
              ),
              validator: (value) => value == null || value.trim().isEmpty
                  ? 'Vui lòng nhập tên bộ thẻ'
                  : null,
            ),
            SizedBox(height: scale.h(12)),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Mô tả (không bắt buộc)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: scale.h(24)),
            Text(
              'Thêm flashcard',
              style: TextStyle(
                fontSize: scale.sp(20),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: scale.h(12)),
            TextFormField(
              controller: _englishController,
              decoration: const InputDecoration(
                labelText: 'Tiếng Anh',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: scale.h(12)),
            TextFormField(
              controller: _vietnameseController,
              decoration: const InputDecoration(
                labelText: 'Nghĩa tiếng Việt',
                border: OutlineInputBorder(),
              ),
              onFieldSubmitted: (_) => _addCard(),
            ),
            SizedBox(height: scale.h(12)),
            OutlinedButton.icon(
              onPressed: _addCard,
              icon: const Icon(Icons.add),
              label: const Text('Thêm vào danh sách'),
            ),
            if (_cards.isNotEmpty) ...[
              SizedBox(height: scale.h(20)),
              ..._cards.indexed.map(
                (entry) => Card(
                  child: ListTile(
                    title: Text(entry.$2.english),
                    subtitle: Text(entry.$2.vietnamese),
                    trailing: IconButton(
                      onPressed: () => setState(() => _cards.removeAt(entry.$1)),
                      icon: const Icon(Icons.delete_outline),
                    ),
                  ),
                ),
              ),
            ],
            SizedBox(height: scale.h(24)),
            FilledButton.icon(
              onPressed: _controller.isSaving ? null : _save,
              icon: _controller.isSaving
                  ? const SizedBox.square(
                      dimension: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.save),
              label: Text(
                _controller.isSaving
                    ? 'Đang lưu...'
                    : 'Lưu bộ thẻ (${_cards.length})',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PasteTextScreen extends StatelessWidget {
  const PasteTextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: const _BottomNav(selectedIndex: 1),
      body: Column(
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
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back),
                    color: AppColors.primary,
                  ),
                  SizedBox(width: scale.w(4)),
                  Expanded(
                    child: Text(
                      'Tạo flashcard từ đoạn văn',
                      style: TextStyle(
                        fontSize: scale.sp(20),
                        fontWeight: FontWeight.w600,
                        color: AppColors.text,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: scale.w(20),
                    backgroundColor: const Color(0xFFE6E8EA),
                    child: Icon(Icons.person, color: AppColors.textSoft, size: scale.w(20)),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.fromLTRB(scale.w(20), scale.h(24), scale.w(20), scale.h(32)),
              children: [
                Text(
                  'Dán đoạn tiếng Anh bạn muốn học. Ứng dụng sẽ tự tìm từ/cụm từ quan trọng để tạo flashcard.',
                  style: TextStyle(
                    fontSize: scale.sp(16),
                    height: 1.5,
                    color: AppColors.textSoft,
                  ),
                ),
                SizedBox(height: scale.h(24)),
                _PasteTextArea(scale: scale),
                SizedBox(height: scale.h(32)),
                const _OptionToggleRow(
                  icon: Icons.auto_awesome,
                  title: 'Ưu tiên cụm từ',
                  enabled: true,
                ),
                SizedBox(height: 12),
                const _OptionToggleRow(
                  icon: Icons.filter_alt_outlined,
                  title: 'Bỏ qua từ quá dễ',
                  enabled: false,
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(child: _TargetLevelField(scale: scale)),
                    SizedBox(width: scale.w(12)),
                    Expanded(child: _ExampleCheckboxField(scale: scale)),
                  ],
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
                    icon: Icon(Icons.analytics, size: scale.w(20)),
                    label: Text(
                      'Phân tích đoạn văn',
                      style: TextStyle(
                        fontSize: scale.sp(18),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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

class _PasteTextArea extends StatelessWidget {
  const _PasteTextArea({required this.scale});

  final Scale scale;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(scale.r(16)),
        border: Border.all(color: const Color(0xFFC2C6D6)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          TextField(
            maxLines: 13,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(scale.w(16)),
              hintText:
                  'The rapid evolution of artificial intelligence has revolutionized how we approach language acquisition. By leveraging natural language processing, students can now decompose complex academic texts into manageable lexical chunks, allowing for more precise memorization. This cognitive ease is essential for mastering advanced linguistic nuances without feeling overwhelmed by dense terminology.',
              hintStyle: TextStyle(
                fontSize: scale.sp(16),
                height: 1.5,
                color: AppColors.text,
              ),
            ),
          ),
          Positioned(
            right: scale.w(16),
            bottom: scale.h(16),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: scale.w(12), vertical: scale.h(6)),
              decoration: BoxDecoration(
                color: const Color(0xCCECEEF0),
                borderRadius: BorderRadius.circular(scale.r(999)),
                border: Border.all(color: const Color(0xFFC2C6D6)),
              ),
              child: Text(
                '128 words',
                style: TextStyle(
                  fontSize: scale.sp(12),
                  fontWeight: FontWeight.w600,
                  color: AppColors.textMuted,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OptionToggleRow extends StatelessWidget {
  const _OptionToggleRow({
    required this.icon,
    required this.title,
    required this.enabled,
  });

  final IconData icon;
  final String title;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Container(
      padding: EdgeInsets.all(scale.w(16)),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F4F6),
        borderRadius: BorderRadius.circular(scale.r(16)),
        border: Border.all(color: const Color(0x80C2C6D6)),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: scale.w(22)),
          SizedBox(width: scale.w(12)),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: scale.sp(16),
                fontWeight: FontWeight.w500,
                color: AppColors.text,
              ),
            ),
          ),
          _ToggleSwitch(enabled: enabled),
        ],
      ),
    );
  }
}

class _ToggleSwitch extends StatelessWidget {
  const _ToggleSwitch({required this.enabled});

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Container(
      width: scale.w(48),
      height: scale.h(26),
      padding: EdgeInsets.all(scale.w(3)),
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
    );
  }
}

class _TargetLevelField extends StatelessWidget {
  const _TargetLevelField({required this.scale});

  final Scale scale;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: scale.w(4), bottom: scale.h(6)),
          child: Text(
            'TRÌNH ĐỘ MỤC TIÊU',
            style: TextStyle(
              fontSize: scale.sp(12),
              fontWeight: FontWeight.w600,
              color: AppColors.textMuted,
            ),
          ),
        ),
        Container(
          height: scale.h(52),
          padding: EdgeInsets.symmetric(horizontal: scale.w(16)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(scale.r(16)),
            border: Border.all(color: const Color(0xFFC2C6D6)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Intermediate',
                  style: TextStyle(fontSize: scale.sp(16), color: AppColors.text),
                ),
              ),
              Icon(Icons.expand_more, color: AppColors.textMuted, size: scale.w(20)),
            ],
          ),
        ),
      ],
    );
  }
}

class _ExampleCheckboxField extends StatelessWidget {
  const _ExampleCheckboxField({required this.scale});

  final Scale scale;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: scale.h(22)),
      child: Container(
        height: scale.h(52),
        padding: EdgeInsets.symmetric(horizontal: scale.w(16)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(scale.r(16)),
          border: Border.all(color: const Color(0xFFC2C6D6)),
        ),
        child: Row(
          children: [
            Checkbox(
              value: true,
              onChanged: (_) {},
              activeColor: AppColors.primary,
            ),
            Expanded(
              child: Text(
                'Tự tạo câu ví dụ',
                style: TextStyle(
                  fontSize: scale.sp(16),
                  color: AppColors.text,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExtractedPreviewScreen extends StatelessWidget {
  const ExtractedPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    final items = [
      const _PreviewWordItem(
        word: 'struggle with',
        meaning: 'gặp khó khăn với',
        example: 'I struggle with consistency.',
        tag: 'Phrase',
        tagBackground: Color(0xFFD8E2FF),
        tagForeground: Color(0xFF001A42),
        selected: true,
      ),
      const _PreviewWordItem(
        word: 'consistency',
        meaning: 'sự kiên trì, nhất quán',
        tag: 'New Word',
        tagBackground: Color(0xFF6CF8BB),
        tagForeground: Color(0xFF005236),
        selected: true,
      ),
      const _PreviewWordItem(
        word: 'achieve',
        meaning: 'đạt được',
        tag: 'Existing',
        tagBackground: Color(0xFFE0E3E5),
        tagForeground: Color(0xFF424754),
        selected: true,
      ),
      const _PreviewWordItem(
        word: 'proficiency',
        meaning: 'sự thành thạo',
        selected: false,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: const _BottomNav(selectedIndex: 1),
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
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back),
                        color: AppColors.text,
                      ),
                      SizedBox(width: scale.w(4)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Xem trước từ vựng',
                              style: TextStyle(
                                fontSize: scale.sp(20),
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary,
                              ),
                            ),
                            SizedBox(height: scale.h(2)),
                            Text(
                              'Chúng tôi tìm thấy 18 từ/cụm từ có thể học.',
                              style: TextStyle(
                                fontSize: scale.sp(14),
                                color: AppColors.textSoft,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        radius: scale.w(20),
                        backgroundColor: const Color(0xFFE6E8EA),
                        child: Icon(Icons.person, color: AppColors.textSoft, size: scale.w(20)),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.fromLTRB(scale.w(20), scale.h(16), scale.w(20), scale.h(190)),
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: const [
                          _PreviewTab(label: 'Tất cả', active: true),
                          _PreviewTab(label: 'Từ mới'),
                          _PreviewTab(label: 'Đã tồn tại'),
                          _PreviewTab(label: 'Cụm từ'),
                        ],
                      ),
                    ),
                    SizedBox(height: scale.h(16)),
                    ...items.map(
                      (item) => Padding(
                        padding: EdgeInsets.only(bottom: scale.h(12)),
                        child: _PreviewWordCard(item: item),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: scale.h(72),
            child: Container(
              padding: EdgeInsets.all(scale.w(20)),
              decoration: const BoxDecoration(
                color: AppColors.background,
                border: Border(
                  top: BorderSide(color: Color(0xFFC2C6D6)),
                ),
              ),
              child: SafeArea(
                top: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Đã chọn 14/18 từ',
                          style: TextStyle(
                            fontSize: scale.sp(16),
                            color: AppColors.text,
                          ),
                        ),
                        Text(
                          'Chọn tất cả',
                          style: TextStyle(
                            fontSize: scale.sp(12),
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: scale.h(12)),
                    SizedBox(
                      width: double.infinity,
                      height: scale.h(52),
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
                          'Tạo 14 flashcard',
                          style: TextStyle(fontSize: scale.sp(18), fontWeight: FontWeight.w600),
                        ),
                        icon: Icon(Icons.style, size: scale.w(18)),
                      ),
                    ),
                    SizedBox(height: scale.h(12)),
                    SizedBox(
                      width: double.infinity,
                      height: scale.h(52),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.primary,
                          side: const BorderSide(color: Color(0xFFC2C6D6)),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(scale.r(16)),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Quay lại chỉnh đoạn văn',
                          style: TextStyle(fontSize: scale.sp(16)),
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

class _PreviewTab extends StatelessWidget {
  const _PreviewTab({required this.label, this.active = false});

  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final scale = context.scale;
    return Container(
      margin: EdgeInsets.only(right: scale.w(16)),
      padding: EdgeInsets.only(bottom: scale.h(10)),
      decoration: BoxDecoration(
        border: active
            ? const Border(
                bottom: BorderSide(color: AppColors.primary, width: 2),
              )
            : null,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: scale.sp(12),
          fontWeight: active ? FontWeight.w700 : FontWeight.w600,
          color: active ? AppColors.primary : AppColors.textSoft,
        ),
      ),
    );
  }
}

class _PreviewWordItem {
  const _PreviewWordItem({
    required this.word,
    required this.meaning,
    this.example,
    this.tag,
    this.tagBackground,
    this.tagForeground,
    required this.selected,
  });

  final String word;
  final String meaning;
  final String? example;
  final String? tag;
  final Color? tagBackground;
  final Color? tagForeground;
  final bool selected;
}

class _PreviewWordCard extends StatelessWidget {
  const _PreviewWordCard({required this.item});

  final _PreviewWordItem item;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: scale.h(2)),
            child: Checkbox(
              value: item.selected,
              onChanged: (_) {},
              activeColor: AppColors.primary,
            ),
          ),
          SizedBox(width: scale.w(8)),
          Expanded(
            child: Opacity(
              opacity: item.selected ? 1 : 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                item.word,
                                style: TextStyle(
                                  fontSize: scale.sp(20),
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.text,
                                ),
                              ),
                            ),
                            SizedBox(width: scale.w(4)),
                            Container(
                              width: scale.w(28),
                              height: scale.w(28),
                              decoration: BoxDecoration(
                                color: const Color(0xFFD8E2FF),
                                borderRadius: BorderRadius.circular(scale.r(999)),
                              ),
                              child: Icon(Icons.volume_up, size: scale.w(16), color: AppColors.primary),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.edit, size: scale.w(18), color: const Color(0xFF727785)),
                          SizedBox(width: scale.w(8)),
                          Icon(Icons.delete, size: scale.w(18), color: const Color(0xFF727785)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: scale.h(6)),
                  Text(
                    item.meaning,
                    style: TextStyle(
                      fontSize: scale.sp(16),
                      color: AppColors.textSoft,
                    ),
                  ),
                  if (item.example != null) ...[
                    SizedBox(height: scale.h(8)),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(scale.w(8)),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F4F6),
                        borderRadius: BorderRadius.circular(scale.r(12)),
                      ),
                      child: Text(
                        '"${item.example!}"',
                        style: TextStyle(
                          fontSize: scale.sp(14),
                          color: AppColors.textSoft,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                  if (item.tag != null) ...[
                    SizedBox(height: scale.h(8)),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: scale.w(8), vertical: scale.h(4)),
                      decoration: BoxDecoration(
                        color: item.tagBackground,
                        borderRadius: BorderRadius.circular(scale.r(999)),
                      ),
                      child: Text(
                        item.tag!,
                        style: TextStyle(
                          fontSize: scale.sp(10),
                          fontWeight: FontWeight.w700,
                          color: item.tagForeground,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
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
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: const _BottomNav(selectedIndex: 1),
      body: Column(
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
                        radius: scale.w(16),
                        backgroundColor: const Color(0xFFD8E2FF),
                        child: Icon(Icons.person, color: AppColors.primary, size: scale.w(16)),
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
              padding: EdgeInsets.fromLTRB(scale.w(20), scale.h(32), scale.w(20), scale.h(24)),
              children: [
                Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: scale.w(128),
                        height: scale.w(128),
                        decoration: const BoxDecoration(
                          color: Color(0xFF6CF8BB),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.check_circle,
                          color: const Color(0xFF00714D),
                          size: scale.w(64),
                        ),
                      ),
                      Positioned(
                        top: -scale.h(12),
                        right: -scale.w(12),
                        child: Container(
                          width: scale.w(32),
                          height: scale.w(32),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD8E2FF).withValues(alpha: 0.5),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -scale.h(8),
                        left: -scale.w(20),
                        child: Container(
                          width: scale.w(24),
                          height: scale.w(24),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFDAD9).withValues(alpha: 0.5),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: scale.h(24)),
                Text(
                  'Đã tạo flashcard thành công!',
                  style: TextStyle(
                    fontSize: scale.sp(28),
                    fontWeight: FontWeight.w700,
                    color: AppColors.text,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: scale.h(8)),
                Text(
                  'Bạn vừa tạo 14 flashcard mới từ đoạn văn.',
                  style: TextStyle(
                    fontSize: scale.sp(16),
                    color: AppColors.textSoft,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: scale.h(24)),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: scale.w(12),
                  mainAxisSpacing: scale.h(12),
                  childAspectRatio: 1.2,
                  children: [
                    _SuccessSummaryCardWide(scale: scale),
                    _SuccessSummaryCardSmall(
                      scale: scale,
                      icon: Icons.bookmark,
                      iconColor: AppColors.tertiary,
                      label: '3 cụm từ quan trọng',
                    ),
                    _SuccessSummaryCardSmall(
                      scale: scale,
                      icon: Icons.history,
                      iconColor: AppColors.textMuted,
                      label: '2 từ đã tồn tại',
                    ),
                  ],
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
                    icon: Icon(Icons.play_circle_fill, size: scale.w(20)),
                    label: Text(
                      'Học ngay',
                      style: TextStyle(fontSize: scale.sp(16), fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                SizedBox(height: scale.h(12)),
                SizedBox(
                  width: double.infinity,
                  height: scale.h(48),
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Color(0xFFC2C6D6)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(scale.r(16)),
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.style, size: scale.w(18)),
                    label: Text(
                      'Xem danh sách flashcard',
                      style: TextStyle(fontSize: scale.sp(16), fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(height: scale.h(12)),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.note_add_outlined, size: scale.w(18), color: AppColors.textSoft),
                  label: Text(
                    'Nhập đoạn văn khác',
                    style: TextStyle(
                      fontSize: scale.sp(14),
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSoft,
                    ),
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

class _SuccessSummaryCardWide extends StatelessWidget {
  const _SuccessSummaryCardWide({required this.scale});

  final Scale scale;

  @override
  Widget build(BuildContext context) {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.auto_awesome, color: AppColors.primary, size: scale.w(22)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: scale.w(8), vertical: scale.h(4)),
                decoration: BoxDecoration(
                  color: const Color(0xFF6CF8BB),
                  borderRadius: BorderRadius.circular(scale.r(999)),
                ),
                child: Text(
                  'Hoàn tất',
                  style: TextStyle(
                    fontSize: scale.sp(12),
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF00714D),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: scale.h(12)),
          Text(
            '14 từ mới',
            style: TextStyle(
              fontSize: scale.sp(20),
              fontWeight: FontWeight.w600,
              color: AppColors.text,
            ),
          ),
          SizedBox(height: scale.h(4)),
          Text(
            'Đã được thêm vào bộ sưu tập',
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

class _SuccessSummaryCardSmall extends StatelessWidget {
  const _SuccessSummaryCardSmall({
    required this.scale,
    required this.icon,
    required this.iconColor,
    required this.label,
  });

  final Scale scale;
  final IconData icon;
  final Color iconColor;
  final String label;

  @override
  Widget build(BuildContext context) {
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
          Icon(icon, color: iconColor, size: scale.w(22)),
          SizedBox(height: scale.h(12)),
          Text(
            label,
            style: TextStyle(
              fontSize: scale.sp(12),
              fontWeight: FontWeight.w600,
              color: AppColors.text,
            ),
          ),
        ],
      ),
    );
  }
}




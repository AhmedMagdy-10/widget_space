import 'package:flutter/material.dart';

enum WidgetType {
  stickyNote,
  checklist,
  moment,
  countdown,
  zikr,
  heartbeat,
  location;

  String get emoji => const {
    WidgetType.stickyNote: '📝',
    WidgetType.checklist: '✅',
    WidgetType.moment: '🖼️',
    WidgetType.countdown: '⏳',
    WidgetType.zikr: '📿',
    WidgetType.heartbeat: '💖',
    WidgetType.location: '📍',
  }[this]!;

  String get label => const {
    WidgetType.stickyNote: 'ملاحظة لاصقة',
    WidgetType.checklist: 'قائمة مهام',
    WidgetType.countdown: 'عد تنازلي',
    WidgetType.zikr: 'ذكر مشترك',
    WidgetType.heartbeat: 'نبضة قلب',
    WidgetType.location: 'موقعي الآن',
    WidgetType.moment: 'لحظة',
  }[this]!;

  WidgetLimit get limit => const {
    WidgetType.stickyNote: WidgetLimit(
      maxChars: 80,
      maxWords: 20,
      limitLabel: '٢٠ كلمة',
      limitDesc:
          'الملاحظة ستظهر في مساحة صغيرة على شاشتك - حاول أن تكون مختصراً! 😉',
    ),
    WidgetType.checklist: WidgetLimit(
      maxItems: 4,
      limitLabel: '٤ بنود',
      limitDesc:
          'أكثر من ٤ بنود لن تظهر كاملة على الشاشة - اختر أهم المهام! 🗂️',
    ),
    WidgetType.moment: WidgetLimit(
      isFixed: true,
      limitLabel: '١٠ كلمات',
      limitDesc: 'حد أقصى صورة واحدة - لحظات  لا تحتاج الكثير من الكلمات! 😊',
    ),
    WidgetType.countdown: WidgetLimit(
      maxChars: 25,
      maxWords: 5,
      limitLabel: '٥ كلمات',
      limitDesc: 'اسم الحدث يظهر فوق الأرقام - اجعله قصيراً وواضحاً! ⏰',
    ),
    WidgetType.zikr: WidgetLimit(
      isFixed: true,
      limitLabel: 'ثابت',
      limitDesc:
          'الذكر المشترك لا يحتاج نصاً - فقط اختر الذكر الذي تريده وسيظهر تلقائياً! 📿',
    ),
    WidgetType.heartbeat: WidgetLimit(
      noText: true,
      limitLabel: 'بلا نص',
      limitDesc: 'نبضة قلب لا تحتاج نصاً — تصل فوراً!',
    ),
    WidgetType.location: WidgetLimit(
      isAuto: true,
      limitLabel: 'تلقائي',
      limitDesc: 'الموقع يُحدَّد تلقائياً من الـ GPS',
    ),
  }[this]!;

  Color get badgeBg => const {
    WidgetType.stickyNote: Color(0x66FEF785),
    WidgetType.checklist: Color(0x264AC4F0),
    WidgetType.moment: Color(0x33C090C8),
    WidgetType.countdown: Color(0x26F5C518),
    WidgetType.zikr: Color(0x1F2D7A3D),
    WidgetType.heartbeat: Color(0x26F0617A),
    WidgetType.location: Color(0x2628A745),
  }[this]!;

  Color get badgeColor => const {
    WidgetType.stickyNote: Color(0xFFA09000),
    WidgetType.checklist: Color(0xFF0A5A7A),
    WidgetType.moment: Color(0xFF7030A0),
    WidgetType.countdown: Color(0xFF8A6000),
    WidgetType.zikr: Color(0xFF1A5A2A),
    WidgetType.heartbeat: Color(0xFFC04060),
    WidgetType.location: Color(0xFF28A745),
  }[this]!;
}

class WidgetLimit {
  final int? maxChars;
  final int? maxWords;
  final int? maxItems;
  final int? maxSecs;
  final bool isFixed;
  final bool noText;
  final bool isAuto;
  final String limitLabel;
  final String limitDesc;

  const WidgetLimit({
    this.maxChars,
    this.maxWords,
    this.maxItems,
    this.maxSecs,
    this.isFixed = false,
    this.noText = false,
    this.isAuto = false,
    required this.limitLabel,
    required this.limitDesc,
  });
}

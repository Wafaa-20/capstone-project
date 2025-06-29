class DayModel {
  final DateTime day; // date day
  final String lable; // today ,tomorrow,Saturday,sunday ...
  final double? progress; // progress
  final bool? isUnlocked; // is locked or not

  DayModel({
    required this.day,
    required this.lable,
    this.progress = 0.0,
    this.isUnlocked = false,
  });
}

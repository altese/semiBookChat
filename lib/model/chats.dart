class Chats {
  final int? cId;
  final int cDate;
  final int? cDelDate;
  final int? cMoDate;
  final String cContent;
  final int bId;

  Chats({
    this.cId,
    required this.cDate,
    this.cDelDate,
    this.cMoDate,
    required this.cContent,
    required this.bId,
  });

  Chats.fromMap(Map<String, dynamic> res)
      : cId = res['cId'],
        cDate = res['cDate'],
        cDelDate = res['cDelDate'],
        cMoDate = res['cMoDate'],
        cContent = res['cContent'],
        bId = res['bId'];

  // 뭐가 들어올지 몰라서 object
  Map<String, Object?> toMap() {
    return {
      'cId': cId,
      'cDate': cDate,
      'cDelDate': cDelDate,
      'cMoDate': cMoDate,
      'cContent': cContent,
      'bId': bId
    };
  }
}

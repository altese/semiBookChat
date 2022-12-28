class Tags {
  static List tagList = [];

  final int? tId;
  final String tTitle;

  Tags({
    this.tId,
    required this.tTitle,
  });

  Tags.fromMap(Map<String, dynamic> res)
      : tId = res['tId'],
        tTitle = res['tTitle'];

  // 뭐가 들어올지 몰라서 object
  Map<String, Object?> toMap() {
    return {
      'tId': tId,
      'tTitle': tTitle,
    };
  }
}

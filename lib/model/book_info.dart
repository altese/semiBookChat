class BookInfo {
  // api 받아와서 넣어두는 list
  static List books = [];
  // api에서 책 제목만 추출
  static String bookTitle = "";

  //book dto ---------
  final int? bId;
  final String bTitle;
  final String? bPublisher;
  final String? bThumbnail;
  final String? bAuthors;
  final String? bTranslators;
  final String? bContents;

  BookInfo({
    this.bId,
    required this.bTitle,
    this.bPublisher,
    this.bThumbnail,
    this.bAuthors,
    this.bTranslators,
    this.bContents,
  });

  BookInfo.fromMap(Map<String, dynamic> res)
      : bId = res['bId'],
        bPublisher = res['bPublisher'],
        bTitle = res['bTitle'],
        bThumbnail = res['bThumbnail'],
        bAuthors = res['bAuthors'],
        bTranslators = res['bTranslators'],
        bContents = res['bContents'];

  // 뭐가 들어올지 몰라서 object
  Map<String, Object?> toMap() {
    return {
      'bId': bId,
      'bPublisher': bPublisher,
      'bTitle': bTitle,
      'bThumbnail': bThumbnail,
      'bAuthors': bAuthors,
      'bTranslators': bTranslators,
      'bContents': bContents,
    };
  }
}

class BannerModel {
  int id;
  int userId;
  String bannerTh;
  String bannerEn;
  String titleTh;
  String titleEn;
  String linkTh;
  String linkEn;
  DateTime start;
  DateTime end;
  String click;
  int order;
  int active;
  DateTime createdAt;
  DateTime updatedAt;

  BannerModel({
    required this.id,
    required this.userId,
    required this.bannerTh,
    required this.bannerEn,
    required this.titleTh,
    required this.titleEn,
    required this.linkTh,
    required this.linkEn,
    required this.start,
    required this.end,
    required this.click,
    required this.order,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      userId: json['user_id'],
      bannerTh: json['banner_th'],
      bannerEn: json['banner_en'],
      titleTh: json['title_th'],
      titleEn: json['title_en'],
      linkTh: json['link_th'],
      linkEn: json['link_en'],
      start: DateTime.parse(json['start']),
      end: DateTime.parse(json['end']),
      click: json['click'],
      order: json['order'],
      active: json['active'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

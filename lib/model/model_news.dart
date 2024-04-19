class ModelNews {
  String? link;
  String? title;
  String? pubDate;
  String? description;
  String? thumbnail;

  ModelNews({this.link, this.title, this.pubDate, this.description, this.thumbnail});

  ModelNews.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    title = json['title'];
    pubDate = json['pubDate'];
    description = json['description'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['link'] = this.link;
    data['title'] = this.title;
    data['pubDate'] = this.pubDate;
    data['description'] = this.description;
    data['thumbnail'] = this.thumbnail;
    return data;
  }

  static List<ModelNews> fromJsonList(List list) {
    if (list.length == 0) return List<ModelNews>.empty();
    return list.map((item) => ModelNews.fromJson(item)).toList();
  }
}

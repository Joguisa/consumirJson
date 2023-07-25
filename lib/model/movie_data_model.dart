class MovieDataModel {
  int? id;
  String? name;
  String? category;
  String? imageUrl;
  String? popularity;
  String? date;

  MovieDataModel(
      {this.id,
      this.name,
      this.category,
      this.imageUrl,
      this.popularity,
      this.date});

  MovieDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    imageUrl = json['imageUrl'];
    popularity = json['popularity'];
    date = json['date'];
  }
}

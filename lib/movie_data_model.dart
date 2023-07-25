class MovieDataModel{
  int? id;
  String? name;
  String? category;
  String? imageURL;
  String? popularity;
  String? date;

  MovieDataModel(
      {
      this.id,
      this.name,
      this.category,
      this.imageURL,
      this.popularity,
      this.date
      });

  MovieDataModel.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    name =json['name'];
    category = json['category'];
    imageURL = json['imageUrl'];
    popularity = json['popularity'];
    date = json['date'];
  }
}
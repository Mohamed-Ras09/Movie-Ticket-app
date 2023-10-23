class MovieBookModel {
  String? title;
  
  String? poster;
  String? date;
  String? price;
 

  MovieBookModel(
      {this.title,
     
      this.poster,
      this.date,
      this.price,
      });

  MovieBookModel.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    
    poster = json['Poster'];
    date = json['date'];
    price = json['price'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Title'] = title;
  
    data['Poster'] = poster;
    data['date'] = date;
    data['price'] = price;
    
    return data;
  }
}

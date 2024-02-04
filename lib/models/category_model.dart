class CategoryModel {
  final String name;
  final String id;
  final String image;

  const CategoryModel({
    required this.name,
    required this.image,
    required this.id,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "photo_url": image,
      };
}

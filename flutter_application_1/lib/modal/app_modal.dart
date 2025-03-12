class AppModal {
  String? brand, name, price, image_link, description, product_type;
  double? rating;

  AppModal({this.brand, this.description, this.image_link, this.name, this.price, this.product_type, this.rating});
 
  factory AppModal.toMap(Map m)
  {
    return AppModal(
      brand: m['brand'],
      description: m['description'],
      image_link: m['image_link'],
      name: m['name'],
      price: m['price'],
      product_type: m['product_type'],
      rating: m['rating']
    );
  }
}

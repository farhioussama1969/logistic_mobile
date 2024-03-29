//create a model class for on boarding item
class OnBoardingItemModel {
  final String animation;
  final String title;
  final String description;

  OnBoardingItemModel({
    required this.animation,
    required this.title,
    required this.description,
  });

  //create fromjson method
  factory OnBoardingItemModel.fromJson(Map<String, dynamic> json) {
    return OnBoardingItemModel(
      animation: json['animation'],
      title: json['title'],
      description: json['description'],
    );
  }
}

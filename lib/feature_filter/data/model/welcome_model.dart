
import '../../domin/entity/sample.dart';

class WelcomeModel extends Welcome{


  factory WelcomeModel.fromJson(Map<String, dynamic> json) => WelcomeModel(
    greeting: json["greeting"],
    instructions: List<String>.from(json["instructions"].map((x) => x)),
  );

  const WelcomeModel({
          required super.greeting,
          required super.instructions,
      });
}
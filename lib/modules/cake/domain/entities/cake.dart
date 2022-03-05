import 'package:cake/modules/cake/cake.dart';
import 'package:equatable/equatable.dart';

class Cake extends Equatable {
  final String name;
  final String? description;
  final CakeType _type;
  final double rating;
  final String? image;

  const Cake({
    required this.name,
    required CakeType type,
    this.rating = 0,
    this.description,
    this.image,
  }) : _type = type;

  String get type {
    switch (_type) {
      case CakeType.angelCake:
        return 'Angel Cake';
      case CakeType.butterCake:
        return 'Butter Cake';
      case CakeType.chiffonCake:
        return 'Chiffon Cake';
      case CakeType.genoeseCake:
        return 'Genoese Cake';
      case CakeType.noFluorCake:
        return 'No Fluor Cake';
      case CakeType.spongeCake:
        return 'Sponge Cake';
      case CakeType.vegetableOilCake:
        return 'Oil Vegetable Cake';
    }
  }

  @override
  List<Object?> get props => [name, _type, rating, description, image];
}

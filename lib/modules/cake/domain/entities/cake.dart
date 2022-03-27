import 'package:cake/modules/cake/cake.dart';
import 'package:equatable/equatable.dart';

class Cake extends Equatable {
  final String name;
  final String? description;
  final CakeType _type;
  final double rating;
  final CakeSize size;
  final String? image;
  final double? price;
  final bool isPromotion;
  final double? discount;
  final List<CakeTag>? tags;

  const Cake({
    required this.name,
    required CakeType type,
    this.rating = 0,
    this.description,
    this.image,
    required this.size,
    this.price,
    this.isPromotion = false,
    this.discount,
    this.tags,
  }) : _type = type;

  String get type {
    switch (_type) {
      case CakeType.bolo:
        return 'Bolo';
      case CakeType.torta:
        return 'Torta';
      case CakeType.tortaSalgada:
        return 'Torta Salgada';
      default:
        return '';
    }
  }

  @override
  List<Object?> get props => [
        name,
        _type,
        rating,
        description,
        image,
        size,
        price,
        isPromotion,
        discount,
        tags,
      ];
}

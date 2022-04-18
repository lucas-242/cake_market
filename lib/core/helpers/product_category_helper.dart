import 'package:cake/core/themes/themes.dart';
import 'package:cake/modules/product/product.dart';

abstract class ProductCategoryHelper {
  static String getName(ProductCategory category) {
    switch (category) {
      case ProductCategory.bebida:
        return 'Bebida';
      case ProductCategory.bolo:
        return 'Bolo';
      case ProductCategory.doce:
        return 'Doce';
      case ProductCategory.salgado:
        return 'Salgado';
      case ProductCategory.torta:
        return 'Torta';
      case ProductCategory.tortaSalgada:
        return 'Torta Salgada';
    }
  }

  static String getImage(ProductCategory category) {
    switch (category) {
      case ProductCategory.bebida:
        return AppImages.bebida;
      case ProductCategory.bolo:
        return AppImages.bolo;
      case ProductCategory.doce:
        return AppImages.doce;
      case ProductCategory.salgado:
        return AppImages.salgado;
      case ProductCategory.torta:
        return AppImages.torta;
      case ProductCategory.tortaSalgada:
        return AppImages.tortaSalagada;
    }
  }
}

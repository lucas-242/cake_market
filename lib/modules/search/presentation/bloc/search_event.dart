part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class PerformSearchEvent extends SearchEvent {
  final ProductFilter filter;
  const PerformSearchEvent({required this.filter});
}

class ChangeFilterEvent extends SearchEvent {
  final String? searchText;
  final ProductCategory? category;
  final double? rating;
  final ProductSize? size;
  final int? price;
  final bool? isPromotion;
  final ProductFilterOrder? order;

  const ChangeFilterEvent({
    this.searchText,
    this.category,
    this.rating,
    this.size,
    this.price,
    this.isPromotion,
    this.order,
  });
}


// part of 'search_bloc.dart';

// class SearchEvent extends Equatable {
//   final String searchText;
//   final ProductFilter? filter;

//   const SearchEvent({required this.searchText, this.filter});

//   ProductFilter getFinalFilter() {
//     return ProductFilter(
//       name: searchText,
//       category: filter?.category,
//       rating: filter?.rating,
//       size: filter?.size,
//       price: filter?.price,
//       isPromotion: filter?.isPromotion,
//       order: filter?.order,
//     );
//   }

//   @override
//   List<Object> get props => [searchText, filter!];
// }

// class OnChangeFilter extends SearchEvent {
//   const OnChangeFilter({required String searchText, ProductFilter? filter})
//       : super(searchText: searchText, filter: filter);
// }

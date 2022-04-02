part of 'tab_bloc.dart';

abstract class TabEvent extends Equatable {
  const TabEvent();
}

class UpdateTab extends TabEvent {
  final AppTab tab;

  const UpdateTab(this.tab);

  @override
  List<Object> get props => [tab];
}

///This event is triggered when the searchbar is used
class ToSearchTabFiltering extends TabEvent {
  final String search;

  const ToSearchTabFiltering(this.search);

  @override
  List<Object> get props => [search];
}

part of 'get_started_cubit.dart';

class GetStartedState extends Equatable {
  final List<String> texts;
  final int currentText;

  const GetStartedState({
    this.texts = const [
      'Encontre as mais deliciosas tortas e doces com qualidade incomparável',
      'Experimente também nossos salgados feito com todo o amor',
      'Entregamos em todo o Rio de Janeiro no conforto da sua casa',
    ],
    this.currentText = 0,
  });

  @override
  List<Object> get props => [texts, currentText];

  GetStartedState copyWith({
    List<String>? texts,
    int? currentText,
  }) {
    return GetStartedState(
      texts: texts ?? this.texts,
      currentText: currentText ?? this.currentText,
    );
  }
}

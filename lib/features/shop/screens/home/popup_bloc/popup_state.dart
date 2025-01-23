import 'package:equatable/equatable.dart';

class PopupState extends Equatable {
  const PopupState({
    this.imagesPopups = const [],
  });

  final List<String> imagesPopups;

  PopupState copyWith({List<String>? imagesPopups}) {
    var state = PopupState(imagesPopups: imagesPopups ?? this.imagesPopups);
    return state;
  }

  @override
  List<Object?> get props => [imagesPopups];
}

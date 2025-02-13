import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

abstract class AvatarEvent extends Equatable {
  const AvatarEvent();

  @override
  List<Object> get props => [];
}

class ChangeAvatarEvent extends AvatarEvent {
  final int selectedIndex;

  const ChangeAvatarEvent(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}

class AvatarState extends Equatable {
  final int selectedAvatarIndex;

  const AvatarState({this.selectedAvatarIndex = 0});

  AvatarState copyWith({int? selectedAvatarIndex}) {
    return AvatarState(
      selectedAvatarIndex: selectedAvatarIndex ?? this.selectedAvatarIndex,
    );
  }

  @override
  List<Object> get props => [selectedAvatarIndex];
}

class AvatarBloc extends Bloc<AvatarEvent, AvatarState> {
  AvatarBloc() : super(const AvatarState()) {
    on<ChangeAvatarEvent>((event, emit) {
      emit(state.copyWith(selectedAvatarIndex: event.selectedIndex));
    });
  }
}

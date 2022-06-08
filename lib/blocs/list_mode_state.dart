part of 'list_mode_bloc.dart';

abstract class ListModeState extends Equatable {
  const ListModeState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ListModeInitial extends ListModeState {
  final Mode viewMode;

  const ListModeInitial({required this.viewMode});

  @override
  List<Object> get props => [viewMode];
}

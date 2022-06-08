part of 'list_mode_bloc.dart';

abstract class ListModeEvent extends Equatable {
  const ListModeEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChangeMode extends ListModeEvent {
  final Mode viewMode;

  const ChangeMode({required this.viewMode});

  @override
  // TODO: implement props
  List<Mode> get props => [viewMode];

}

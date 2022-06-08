import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../utilities/view_mode.dart';

part 'list_mode_event.dart';
part 'list_mode_state.dart';

class ListModeBloc extends Bloc<ListModeEvent, ListModeState> {
  ListModeBloc() : super(const ListModeInitial(viewMode: Mode.grid)) {
    on<ChangeMode>((event, emit) {
      if (state is ListModeInitial) {
        emit(
          ListModeInitial(viewMode: event.viewMode),
        );
      }
    });
  }
}

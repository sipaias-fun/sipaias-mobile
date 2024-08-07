import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'general_event.dart';
part 'general_state.dart';

class GeneralBloc extends Bloc<GeneralEvent, GeneralState> {
  GeneralBloc() : super(GeneralInitial()) {
    on<LoadingEvent>(_onGeneralLoading);
    on<ContextEvent>(_setContext);
  }

  void _setContext(
    ContextEvent event,
    Emitter<GeneralState> emit,
  ) {
    emit(GeneralContext(event.context));
  }

  void _onGeneralLoading(
    LoadingEvent event,
    Emitter<GeneralState> emit,
  ) async {
    emit(GeneralLoading(status: event.status));
  }
}

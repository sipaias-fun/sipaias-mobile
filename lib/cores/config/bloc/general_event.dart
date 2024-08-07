part of 'general_bloc.dart';

sealed class GeneralEvent extends Equatable {
  const GeneralEvent();

  @override
  List<Object> get props => [];
}

final class ContextEvent extends GeneralEvent {
  final BuildContext context;

  const ContextEvent(this.context);
}

final class LoadingEvent extends GeneralEvent {
  final bool status;

  const LoadingEvent({
    required this.status,
  });
}

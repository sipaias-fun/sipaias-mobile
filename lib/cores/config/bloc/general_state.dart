part of 'general_bloc.dart';

@immutable
sealed class GeneralState extends Equatable {
  const GeneralState();

  @override
  List<Object> get props => [];
}

final class GeneralContext extends GeneralState {
  final BuildContext context;

  const GeneralContext(this.context);
}

final class GeneralInitial extends GeneralState {}

final class GeneralLoading extends GeneralState {
  final bool status;

  const GeneralLoading({this.status = false});
}

final class GeneralSuccess extends GeneralState {}

final class GeneralFailure extends GeneralState {
  final String error;

  const GeneralFailure(this.error);
}

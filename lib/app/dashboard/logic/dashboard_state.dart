import 'package:equatable/equatable.dart';
import 'package:maga_app/app/dashboard/data/models/gastro_model.dart';

abstract class DashboardState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final List<GastroModel> gastros;

  DashboardLoaded({required this.gastros});

  @override
  List<Object?> get props => [gastros];
}

class DashboardError extends DashboardState {
  DashboardError({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maga_app/app/dashboard/data/dashboard_repository.dart';
import 'package:maga_app/app/dashboard/data/models/gastro_model.dart';
import 'package:maga_app/app/dashboard/logic/dashboard_cubit.dart';
import 'package:maga_app/app/dashboard/logic/dashboard_state.dart';
import 'package:maga_app/app/dashboard/ui/widgets/gastro_card.dart';
import 'package:maga_app/app/shared/ui/default_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      body: BlocProvider<DashboardCubit>(
        create: (context) => DashboardCubit(context.read<DashboardRepository>())
          ..loadDashboardContent(),
        child: BlocBuilder<DashboardCubit, DashboardState>(
            builder: (context, state) {
          if (state is DashboardLoaded) {
            return _buildContent(state.gastros);
          }

          if (state is DashboardError) {
            return Center(
              child: Text(state.errorMessage),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }

  Padding _buildContent(List<GastroModel> gastros) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        child: Center(
            child: ListView.builder(
          itemCount: gastros.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GastroCard(gastroModel: gastros[index]),
            );
          },
        )),
      );
}

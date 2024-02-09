import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/features/dashboard/repository/dashboard_repository.dart';

import '../../models/movie_model.dart';

final dashboardControllerProvider = Provider((ref) {
  final dashboardRepository = ref.watch(dashboardRepositoryProvider);
  return DashboardController(
      dashboardRepository: dashboardRepository, ref: ref);
});

class DashboardController {
  final DashboardRepository dashboardRepository;
  final ProviderRef ref;

  DashboardController({required this.dashboardRepository, required this.ref});

  Future<List<MovieModel>> getPopularMovies(int page, String? region) async {
    return await dashboardRepository.getPopularMovies(page, region);
  }
}

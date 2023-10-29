import 'package:arch_x_spacex/components/errors_display_card.dart';
import 'package:arch_x_spacex/data/repositories/launches_repo.dart';
import 'package:arch_x_spacex/data/services/spacex_api/launches/launch_model.dart';
import 'package:arch_x_spacex/extensions/context_extension.dart';
import 'package:arch_x_spacex/extensions/datetime_extension.dart';
import 'package:arch_x_spacex/extensions/string_extension.dart';
import 'package:arch_x_spacex/global_utils.dart';
import 'package:arch_x_spacex/view_modules/rocket_details/rocket_details_view.dart';
import 'package:arch_x_spacex/view_modules/timeline/timeline_view_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class TimelineView extends StatelessWidget {
  const TimelineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Space X - The Launches'),
        ),
        body: BlocProvider(
          create: (_) => TimelineViewBloc(),
          child: BlocBuilder<TimelineViewBloc, LaunchesRetrievedData?>(
            builder: (context, state) {
              if (state == null) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.errors.isNotEmpty) {
                return ErrorsDisplayCard(
                  errors: state.errors,
                  retry: context.read<TimelineViewBloc>().retryRequestData,
                );
              }

              if (state.launches.isEmpty) {
                return const Center(
                    child: Text('There are no launches to display'));
              }

              return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  shrinkWrap: true,
                  itemBuilder: (_, index) => _LaunchListItem(
                          launch: state.launches[index],
                          isLast: index == state.launches.length - 1)
                      .animate(delay: Duration(milliseconds: index * 5))
                      .fadeIn(),
                  itemCount: state.launches.length);
            },
          ),
        ));
  }
}

class _LaunchListItem extends StatelessWidget {
  final Launch launch;
  final bool isLast;
  const _LaunchListItem({required this.launch, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: spaceSiblingsEvenly([
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${launch.flightNumber}. ${launch.name}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      Text(launch.dateUtc.dateAndTime),
                      if (launch.details.notNullNotEmpty)
                        Text(
                          launch.details!,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        )
                    ], heightSpacing: 4),
                  ),
                ),
                if (launch.patchImageUrl != null)
                  Image.network(
                    launch.patchImageUrl!,
                    width: 100,
                    height: 100,
                  )
                else
                  Image.asset(
                    'TODO - placeholder image',
                    width: 100,
                    height: 100,
                  ),
              ],
            ),
          ),
          if (launch.rocket != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _InfoButton(
                    onPressed: () => context.push(
                            child: RocketDetailsView(
                          rocketId: launch.rocket!,
                        )),
                    assetName: 'assets/icons/rocket_icon.svg',
                    label: 'Rocket Info'),
              ],
            )
        ],
      ),
    );
  }
}

class _InfoButton extends StatelessWidget {
  final String assetName;
  final String label;
  final VoidCallback onPressed;
  const _InfoButton(
      {required this.assetName, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: onPressed,
        icon: SvgPicture.asset(assetName,
            width: 20, semanticsLabel: '$label - button'),
        label: Text(label));
  }
}

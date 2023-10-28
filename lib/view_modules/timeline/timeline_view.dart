import 'package:arch_x_spacex/data/services/spacex_api/launches/launches_model.dart';
import 'package:arch_x_spacex/extensions/datetime_extension.dart';
import 'package:arch_x_spacex/extensions/string_extension.dart';
import 'package:arch_x_spacex/global_utils.dart';
import 'package:arch_x_spacex/view_modules/timeline/timeline_view_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          child: BlocBuilder<TimelineViewBloc, TimelineViewBlocState>(
            builder: (context, state) {
              if (!state.initialized) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.blocError != null) {
                /// TODO.
                /// Show error
              }

              return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  shrinkWrap: true,
                  itemBuilder: (_, index) => LaunchListItem(
                          launch: state.launches[index],
                          isLast: index == state.launches.length - 1)
                      .animate(delay: Duration(milliseconds: index * 10))
                      .fadeIn(),
                  itemCount: state.launches.length);
            },
          ),
        ));
  }
}

class LaunchListItem extends StatelessWidget {
  final Launch launch;
  final bool isLast;
  const LaunchListItem({super.key, required this.launch, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
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
                      Text(
                        '${launch.flightNumber}. ${launch.name}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  Text(launch.dateUtc.dateAndTime),
                  if (launch.details.notNullNotEmpty)
                    Text(
                      launch.details!,
                      maxLines: 3,
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
    );
  }
}

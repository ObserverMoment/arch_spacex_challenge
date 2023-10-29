import 'package:arch_x_spacex/components/errors_display_card.dart';
import 'package:arch_x_spacex/data/repositories/rockets_repo.dart';
import 'package:arch_x_spacex/data/services/spacex_api/rockets/rocket_model.dart';
import 'package:arch_x_spacex/extensions/datetime_extension.dart';
import 'package:arch_x_spacex/extensions/int_extension.dart';
import 'package:arch_x_spacex/view_modules/rocket_details/rocket_details_view_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RocketDetailsView extends StatelessWidget {
  final String rocketId;
  const RocketDetailsView({super.key, required this.rocketId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton.filledTonal(
                onPressed: () => showAdaptiveDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (context) => const AlertDialog.adaptive(
                          title: Text('"Favourites" Coming Soon...'),
                        )),
                icon: const Icon(CupertinoIcons.heart))
          ],
        ),
        body: BlocProvider(
          create: (_) => RocketDetailsViewBloc(rocketId),
          child: BlocBuilder<RocketDetailsViewBloc, RocketRetrievedData?>(
            builder: (context, state) {
              if (state == null) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.errors.isNotEmpty || state.rocket == null) {
                return ErrorsDisplayCard(
                  errors: state.errors,
                  retry: context
                      .read<RocketDetailsViewBloc>()
                      .retrieveRocketDetails,
                );
              }

              return _RocketDetailsDisplay(
                rocket: state.rocket!,
              );
            },
          ),
        ));
  }
}

class _RocketDetailsDisplay extends StatelessWidget {
  final Rocket rocket;
  const _RocketDetailsDisplay({required this.rocket});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        Text(
          rocket.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 4),
        Text('First Flight: ${rocket.firstFlight.dateAndTime}'),
        const SizedBox(height: 8),
        _StatsCard(
          statOne: rocket.active ? 'Active' : 'Inactive',
          statTwo: rocket.costPerLaunch.asCurrency,
        ),
        _StatsCard(
          statOne: 'Stages: ${rocket.stages}',
          statTwo: 'Boosters: ${rocket.boosters}',
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(rocket.description),
        ),
        ...rocket.flickrImages
            .map((i) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        i,
                        width: 300,
                      )),
                ))
            .toList()
      ],
    );
  }
}

class _StatsCard extends StatelessWidget {
  final String statOne;
  final String statTwo;
  const _StatsCard({required this.statOne, required this.statTwo});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text(statOne), Text(statTwo)],
        ),
      ),
    );
  }
}

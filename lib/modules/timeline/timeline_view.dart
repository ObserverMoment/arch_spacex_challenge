import 'package:arch_x_spacex/modules/timeline/timeline_view_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimelineView extends StatelessWidget {
  const TimelineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Space X - A History'),
        ),
        body: BlocProvider(
          create: (_) => TimelineViewBloc(),
          child: BlocBuilder<TimelineViewBloc, TimelineViewBlocState>(
            builder: (context, state) {
              if (!state.initialized) {
                /// Show loading.
              }

              if (state.blocError != null) {
                /// Show error
              }

              print(state.launches);

              return Text('Timeline here');
            },
          ),
        ));
  }
}

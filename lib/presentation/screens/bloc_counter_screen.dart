import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formsapp/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: _CounterBlocView(),
    );
  }
}

//Extracted this class so the return section can be read better.
class _CounterBlocView extends StatelessWidget {
  const _CounterBlocView({
    super.key,
  });

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterBloc>().add(CounterIncreased(value));
  }

  @override
  Widget build(BuildContext context) {
    final counterstate = context.watch<CounterBloc>().state;
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoc Counter: ${counterstate.transactionCount}'),
        actions: [
          IconButton(
            onPressed: () {
              context
                  .read<CounterBloc>()
                  .add(CounterReset(counterstate.counter));
            },
            icon: const Icon(Icons.refresh_outlined),
          )
        ],
      ),
      body: Center(
        child: Text(
          'Current value is: ${counterstate.counter}',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 3,
            child: const Text('+3'),
            onPressed: () => increaseCounterBy(context, 3),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: 2,
            child: const Text('+2'),
            onPressed: () => increaseCounterBy(context, 2),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: 1,
            child: const Text('+1'),
            onPressed: () => increaseCounterBy(context),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

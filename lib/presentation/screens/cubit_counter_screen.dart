import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formsapp/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Now the cubit info lives along all the widgets that are inside of _CubirCounterView, just on those.
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

//Lo extraemos para envolver el llamado con el BlocProvider
class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
//Vamos a definir un listener del state.
//WAY #2 TO USE CUBITS TODO
    final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit Counter: ${counterState.transactionCount}'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<CounterCubit>().reset();
            },
            icon: const Icon(Icons.refresh_outlined),
          )
        ],
      ),
      body: Center(
        //Vamos a poner a que consuma el cubit solo a este widget de texto. Para eso lo envolvemos en un Blocbuilder.
        //WAY #3 TO USE CUBITS TODO
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Text(
              'Current value is: ${state.counter}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
              maxLines: 1,
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 3,
            child: const Text('+3'),
            onPressed: () {
              context.read<CounterCubit>().increaseBy(3);
            },
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: 2,
            child: const Text('+2'),
            onPressed: () {
              context.read<CounterCubit>().increaseBy(2);
            },
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: 1,
            child: const Text('+1'),
            onPressed: () {
              context.read<CounterCubit>().increaseBy(1);
            },
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:protest/provider/counter_provider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider App',
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Material App Bar')),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Pushed the button: ${context.watch<Counter>().count}',
              ),
              const Count(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
                child: const Text('Launch Screen'),
              )
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              key: const Key('decrement_floatingActionButton'),
              onPressed: () => context.read<Counter>().decrement(),
              tooltip: 'Decrement',
              child: const Icon(
                Icons.remove,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              key: const Key('reset_floatingActionButton'),
              onPressed: () => context.read<Counter>().reset(),
              tooltip: 'Decrement',
              child: const Icon(
                Icons.exposure_zero,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              key: const Key('increment_floatingActionButton'),
              onPressed: () => context.read<Counter>().increment(),
              tooltip: 'Increment',
              child: const Icon(
                Icons.add,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class Count extends StatelessWidget {
  const Count({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${context.watch<Counter>().count}',
      key: const Key('counterState'),
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

import 'package:contact_app/main.dart';
import 'package:contact_app/util/extensions.dart';
import 'package:contact_app/utils/app_theme.dart';
import 'package:contact_app/views/counter/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Provider"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<CounterProvider>().refresh();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: Text(
            "${context.watch<CounterProvider>().i}",
            style: AppTheme.LightTheme.textTheme.headlineLarge,
          ),
        ),
      ),
      floatingActionButton: Column(
        //Addition & subtraction
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterProvider>().increment();
                },
                child: Text(
                  "+",
                  style: AppTheme.LightTheme.textTheme.headlineMedium,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterProvider>().decrement();
                },
                child: Text(
                  "-",
                  style: AppTheme.LightTheme.textTheme.headlineMedium,
                ),
              ),
            ],
          ),
          10.h,
          //2x,3x,4x multiplication
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterProvider>().twoX();
                },
                child: Text(
                  "2x",
                  style: AppTheme.LightTheme.textTheme.headlineMedium,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterProvider>().threeX();
                },
                child: Text(
                  "3x",
                  style: AppTheme.LightTheme.textTheme.headlineMedium,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterProvider>().fourX();
                },
                child: Text(
                  "4x",
                  style: AppTheme.LightTheme.textTheme.headlineMedium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

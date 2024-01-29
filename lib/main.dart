import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/providers/basic_provider_example1.dart';
import 'package:riverpod_practice/providers/future_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    home: HomePage1(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShowAllNumbers(),
             SizedBox(height: 50),
            ShowEvenNumberList()
          ],
        ),
      ),
    );
  }
}

class ShowAllNumbers extends ConsumerWidget {
  const ShowAllNumbers({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numbersList = ref.watch(numbersListProvider);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue[300]!),
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
        Text(numbersList.toString()),
       
        
        ],
      ),
    );
  }
}

class ShowEvenNumberList extends ConsumerWidget {
  const ShowEvenNumberList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

  final evenNumberList = ref.watch(evenNumberProvider);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue[300]!),
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
        Text(evenNumberList.toString())
        ],
      ),
    );
  }
}

class HomePage1 extends ConsumerWidget {
  const HomePage1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Pratce'),),
      body: userData.when(data: (data) {
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(data[index].avatar),),
            title: Text('${data[index].firstName} ${data[index].lastName}'),
            subtitle: Text(data[index].email),
            trailing: Text(data[index].id.toString()),
          );
        },);
      }, error: (error, stackTrace) {
        return Center(child: Text(error.toString()),);
      }, loading: () {
        return const CircularProgressIndicator();
      },),
    );
  }
}
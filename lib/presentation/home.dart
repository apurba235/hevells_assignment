import 'package:flutter/material.dart';
import 'package:havells_assignments/presentation/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  bool firstTime = true;
  final List<String> menuItems = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    if (firstTime) {
      provider.fetchImages(1);
      firstTime = false;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff105161),
        centerTitle: true,
        title: const Text(
          'Images',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String result) {},
            color: Colors.white,
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              ...List.generate(
                provider.images?.data?.length ?? 0,
                (index) => PopupMenuItem<String>(
                  value: menuItems[index],
                  child: Text(menuItems[index]),
                ),
              ),
            ],
          ),
        ],
      ),
      body: provider.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              itemCount: provider.images?.data?.length,
              itemBuilder: (context, i) {
                final data = provider.images?.data?[i];
                return Card(
                  child: Image.network(data?.assets?.preview?.url ?? ''),
                );
              },
            ),
    );
  }
}

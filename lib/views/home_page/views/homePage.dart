import 'package:contact_app/routes/app_routes.dart';
import 'package:contact_app/views/home_page/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: ListView.builder(
        itemCount: context.watch<HomeProvider>().allContacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              context.read<HomeProvider>().setIndex(index);

              Navigator.pushNamed(context, AppRoutes.detailPage,
                  arguments: context.read<HomeProvider>().allContacts[index]);
            },
            onLongPress: () {
              context.read<HomeProvider>().deleteContact(index);
            },
            leading: CircleAvatar(
              foregroundImage: FileImage(
                  context.watch<HomeProvider>().allContacts[index].image!),
            ),
            title: Text(context
                .watch<HomeProvider>()
                .allContacts[index]
                .name
                .toString()),
            subtitle:
                Text(context.watch<HomeProvider>().allContacts[index].contact!),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios_rounded),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addContactPage);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

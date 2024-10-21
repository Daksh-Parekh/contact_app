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
        actions: [
          IconButton(
            onPressed: () async {
              bool isLock =
                  await context.read<HomeProvider>().openHideContact();

              if (isLock) {
                Navigator.pushNamed(context, AppRoutes.hidePage);
              } else {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Unsuccessful")));
              }
              // Navigator.pushNamed(context, AppRoutes.hidePage);
            },
            icon: Icon(Icons.lock),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: context.watch<HomeProvider>().allContacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              context.read<HomeProvider>().setIndex(index);

              Navigator.pushNamed(
                context, AppRoutes.detailPage,
                arguments: context.read<HomeProvider>().allContacts[index],
                // context.read<HomeProvider>().pages
              );
            },
            onLongPress: () {
              context.read<HomeProvider>().deleteContact(index);
            },
            leading:
                context.watch<HomeProvider>().allContacts[index].image == null
                    ? CircleAvatar()
                    : CircleAvatar(
                        foregroundImage: FileImage(context
                            .watch<HomeProvider>()
                            .allContacts[index]
                            .image!),
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

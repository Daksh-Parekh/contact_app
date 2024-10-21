import 'package:contact_app/routes/app_routes.dart';
import 'package:contact_app/utils/app_theme.dart';
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
        title: Text(
          "Home Page",
          style: AppTheme.LightTheme.textTheme.titleLarge,
        ),
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
            onLongPress: () {
              context.read<HomeProvider>().deleteContact(index);
            },
            leading:
                context.watch<HomeProvider>().allContacts[index].image == null
                    ? CircleAvatar(
                        child: Text(
                          context
                              .watch<HomeProvider>()
                              .allContacts[index]
                              .name!
                              .substring(0, 1)
                              .toUpperCase(),
                          style: AppTheme.LightTheme.textTheme.displayLarge,
                        ),
                      )
                    : CircleAvatar(
                        foregroundImage: FileImage(context
                            .watch<HomeProvider>()
                            .allContacts[index]
                            .image!),
                      ),
            title: Text(
              context.watch<HomeProvider>().allContacts[index].name.toString(),
              style: AppTheme.LightTheme.textTheme.displayLarge,
            ),
            subtitle: Text(
              context.watch<HomeProvider>().allContacts[index].contact!,
              style: AppTheme.LightTheme.textTheme.displayMedium,
            ),
            trailing: IconButton(
              onPressed: () {
                context.read<HomeProvider>().setIndex(index);

                Navigator.pushNamed(
                  context, AppRoutes.detailPage,
                  arguments: context.read<HomeProvider>().allContacts[index],
                  // context.read<HomeProvider>().pages
                );
              },
              icon: const Icon(Icons.arrow_forward_ios_rounded),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addContactPage);
        },
        child: Icon(
          Icons.add_rounded,
          size: 50,
        ),
      ),
    );
  }
}

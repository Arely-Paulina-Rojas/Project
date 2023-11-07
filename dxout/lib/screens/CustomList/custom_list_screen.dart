import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';

class CustomListScreen extends StatelessWidget {
  const CustomListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<AppInfo>>(
        future: InstalledApps.getInstalledApps(true, true, "com.whatsapp"),
        builder:
            (BuildContext buildContext, AsyncSnapshot<List<AppInfo>> snapshot) {
          return snapshot.connectionState == ConnectionState.done
              ? snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        AppInfo app = snapshot.data![index];
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: Image.memory(app.icon!),
                            ),
                            title: Text(app.name!),
                            subtitle: Text(app.getVersionInfo()),
                            onTap: () =>
                                //AppCheck.isAppEnabled(app.packageName),
                                InstalledApps.startApp(app.packageName!),
                            onLongPress: () =>
                                InstalledApps.openSettings(app.packageName!),
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: Text(
                          "Ocurrió un error al cargar las aplicaciones instaladas..."))
              : const Center(
                  child: Text("Cargando aplicaciones instaladas..."));
        },
      ),
    );
  }
}

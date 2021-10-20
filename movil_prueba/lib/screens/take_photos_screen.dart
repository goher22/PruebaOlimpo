import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movil_prueba/widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'package:movil_prueba/providers/users_provider.dart';

class TakePhoteScreen extends StatelessWidget {
  const TakePhoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UsersProvider>(context);
    final user = userProvider.user!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Tomar foto'),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            UserImg(url: user.picture),
            Positioned(
                top: 10,
                left: 20,
                child: IconButton(
                  onPressed: () {
                    _loadimage(userProvider, false);
                  },
                  icon: Icon(Icons.image_search_sharp,
                      size: 40, color: Colors.white),
                )),
            Positioned(
              top: 10,
              right: 20,
              child: IconButton(
                onPressed: () {
                  _loadimage(userProvider, true);
                },
                icon: Icon(
                  Icons.camera_alt_outlined,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () {
          Navigator.pushNamed(context, 'geo');
        },
      ),
    );
  }

  _loadimage(UsersProvider provider, bool cam) async {
    final picker = new ImagePicker();
    final sour = cam ? ImageSource.camera : ImageSource.gallery;
    final PickedFile? pickedFile = await picker.getImage(
      source: sour,
      imageQuality: 100,
    );

    if (pickedFile == null) {
      print('No seleccionó nada');
      return;
    }

    provider.pinture = pickedFile.path;
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internativeapp/core/extension/context_extension.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  _ProfilePage createState() => _ProfilePage();
}

enum AppState {
  free,
  picked,
  cropped,
}

class _ProfilePage extends State<ProfilePage> {
  final ImagePicker _picker = ImagePicker();
  AppState? state;
  int? selectedRadio = 0;
  bool isLoading = false;
  Future<void> _pickImage() async {
    isActive = true;
    final pickedImage =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 70);
    _image = pickedImage != null ? File(pickedImage.path) : null;
    if (_image != null) {
      setState(() {
        state = AppState.picked;
        imageBytes = _image!.readAsBytesSync();
        base64Image = base64.encode(imageBytes);
        print(_image!.readAsStringSync);
      });
    }
  }

  Future<void> _cropImage() async {
    File? croppedFile = await ImageCropper().cropImage(
        sourcePath: _image!.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        androidUiSettings: const AndroidUiSettings(
            toolbarTitle: 'Resmi Kırp',
            toolbarColor: Colors.orange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: const IOSUiSettings(
          title: 'Resmi Kırp',
        ));
    if (croppedFile != null) {
      _image = croppedFile;
      setState(() {
        state = AppState.cropped;
        imageBytes = _image!.readAsBytesSync();
        base64Image = base64.encode(imageBytes);
        print(_image!.readAsStringSync);
      });
    }
  }

  void _clearImage() {
    _image = null;
    setState(() {
      state = AppState.free;
    });
  }

  Widget _buildButtonIcon() {
    if (state == AppState.free) {
      return const Icon(
        Icons.photo_camera,
        color: Colors.white,
      );
    } else if (state == AppState.picked) {
      return const Icon(
        Icons.crop,
        color: Colors.white,
      );
    } else if (state == AppState.cropped) {
      return const Icon(
        Icons.clear,
        color: Colors.white,
      );
    } else {
      return Container();
    }
  }

  late List<int> imageBytes;
  String? base64Image;
  File? _image;
  bool isActive = false;

  @override
  void initState() {
    state = AppState.free;
    super.initState();
  }

  // ignore: non_constant_identifier_names
  void open_camera() async {
    var image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 70);
    setState(() {
      _image = File(image!.path);
      isActive = true;
    });

    imageBytes = _image!.readAsBytesSync();
    base64Image = base64.encode(imageBytes);
    print(_image!.readAsStringSync);
  }

// ignore: non_constant_identifier_names
  void open_gallery() async {
    // ignore: deprecated_member_use
    var image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 70);
    setState(() {
      _image = File(image!.path);
      isActive = true;
    });
    imageBytes = _image!.readAsBytesSync();
    base64Image = base64.encode(imageBytes);
    print(_image!.readAsStringSync);
  }

  @override
  // ignore: unused_element
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50]!.withOpacity(0.9),
        appBar: AppBar(
          elevation: 4,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 25,
            ),
            onPressed: () {},
          ),
          backgroundColor: Colors.white,
          title: Text(
            "My Profile",
            style: context.textTheme.headline6!.copyWith(
              fontWeight: FontWeight.w500,
              color: context.colors.onBackground,
            ),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Colors.transparent,
          ),
        ),
        body: isLoading == true
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        margin: EdgeInsets.zero,
                        child: _image == null
                            ? CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 70,
                                child: Center(
                                  child: Image.asset(
                                    "assets/images/defaultImage.png",
                                    height:
                                        MediaQuery.of(context).size.width / 2,
                                  ),
                                ),
                              )
                            : Image.file(
                                _image!,
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height / 3,
                              ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (state == AppState.free) {
                          _pickImage();
                        } else if (state == AppState.picked) {
                          _cropImage();
                        } else if (state == AppState.cropped) {
                          _clearImage();
                        }
                      },
                      child: _buildButtonIcon(),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    buildSave(context),
                    const SizedBox(
                      height: 10,
                    ),
                    buildLogOut(context),
                  ],
                ),
              ));
  }

  buildSave(
    BuildContext context,
  ) {
    return Center(
      child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.2,
          height: 50.0,
          child: Material(
            elevation: 3.0,
            borderRadius: BorderRadius.circular(5),
            color: Colors.blue[900],
            child: MaterialButton(
                padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                onPressed: () {
                  LocaleManager.instance.clearAll();
                  NavigationService.instance
                      .navigateToPageClear(path: "/login");
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const Icon(
                        Icons.logout,
                        size: 30,
                        color: Colors.white,
                      ),
                      Text(
                        "Save",
                        textAlign: TextAlign.center,
                        style: context.textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.w400, color: Colors.white),
                      ),
                    ])),
          )),
    );
  }

  buildLogOut(
    BuildContext context,
  ) {
    return SizedBox(
        width: MediaQuery.of(context).size.width / 1.2,
        height: 50.0,
        child: Material(
          elevation: 3.0,
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey.withOpacity(0.9),
          child: MaterialButton(
              padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              onPressed: () {
                LocaleManager.instance.clearAll();
                NavigationService.instance.navigateToPageClear(path: '/login');
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const Icon(
                      Icons.logout,
                      size: 30,
                      color: Colors.white,
                    ),
                    Text(
                      "Log Out",
                      textAlign: TextAlign.center,
                      style: context.textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.w400, color: Colors.white),
                    ),
                  ])),
        ));
  }
}

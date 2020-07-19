import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class UploadDownload extends StatefulWidget {
  @override
  _UploadDownloadState createState() => _UploadDownloadState();
}

class _UploadDownloadState extends State<UploadDownload> {
  File image;
  _getImage() async {
    File img = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      this.image = img;
      print("Image Path is ${this.image.path}");
    });
  }

  _cropIt() async {
    File cropImage = await ImageCropper.cropImage(sourcePath: image.path);
    setState(() {
      image = cropImage;
    });
  }

  String downloadURL = "";
  _downloadIt() async {
    if (taskSnapshot != null) {
      downloadURL = await taskSnapshot.ref.getDownloadURL();
      setState(() {
        msg2 = "Image Downloaded";
        print("Set State Done $downloadURL");
      });
    }
  }

  String msg2 = "No Image";
  static String bucketUrl = "gs://uploaddownloaddemo-290d5.appspot.com";
  FirebaseStorage fbs = FirebaseStorage(storageBucket: bucketUrl);
  StorageUploadTask storageUploadTask;
  String message = "";
  StorageTaskSnapshot taskSnapshot;
  _uploadIt() async {
    String uploadPath = "images/brainmentors${DateTime.now()}.jpg";
    storageUploadTask = fbs.ref().child(uploadPath).putFile(image);
    taskSnapshot = await storageUploadTask.onComplete;
    setState(() {
      message = "File Uploaded Done ";
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Re Build called...");
    return Scaffold(
      appBar: AppBar(
        title: Text('UploadDownload'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.add_a_photo,
                  size: 32,
                  color: Colors.redAccent,
                ),
                onPressed: () {
                  _getImage();
                },
              ),
              this.image != null
                  ? Container(
                      child: Image.file(image),
                    )
                  : Text('Select the Image'),
              IconButton(
                icon: Icon(
                  Icons.crop,
                  size: 32,
                ),
                onPressed: () {
                  _cropIt();
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.file_upload,
                  size: 32,
                ),
                onPressed: () {
                  _uploadIt();
                },
              ),
              storageUploadTask != null && storageUploadTask.isComplete
                  ? Text(message)
                  : Text('No Image Upload'),
              IconButton(
                onPressed: () {
                  _downloadIt();
                },
                icon: Icon(
                  Icons.file_download,
                  size: 32,
                  color: Colors.blueAccent,
                ),
              ),
              downloadURL.trim().length == 0
                  ? Text('$msg2 $downloadURL')
                  : Image.network(downloadURL)
            ],
          ),
        ),
      ),
    );
  }
}

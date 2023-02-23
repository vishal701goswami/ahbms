import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:dropbox_client/dropbox_client.dart';
import 'package:http/http.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedfile;
  bool isLoading = false;
  File? fileToDisplay;
  Future? response;

  uploadFile(String path) async {
    final response = Dropbox.upload(path, "/data");
    log(response.toString());
  }

  void pickFile() async {
    try {
      setState(() {
        isLoading = true;
      });

      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );
      if (result != null) {
        _fileName = result!.files.first.name;
        pickedfile = result!.files.first;
        fileToDisplay = File(pickedfile!.path.toString());
        log("File name $_fileName");
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Colors.white),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: isLoading
                      ? const CircularProgressIndicator.adaptive()
                      : TextButton(
                          onPressed: () => pickFile(),
                          child: const Text("Pick File"))),
              if (pickedfile != null)
                SizedBox(
                  height: 300,
                  width: 400,
                  child: Image.file(fileToDisplay!),
                ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      response = uploadFile(fileToDisplay!.path.toString());

                      log(response.toString());
                    });
                  },
                  child: const Text("send")),
                  ElevatedButton(
                  onPressed: () {
                    createFoldar();
                  },
                  child: const Text("create")),
                  ElevatedButton(
                  onPressed: () {
                    uploadData(_fileName!);
                  },
                  child: const Text("upload"))
            ],
          ),
        ),
      ),
    );
  }

  createFoldar() async {
    String token = "sl.BXhC9w_oF_3GmEbpTsyx97K8JwZgRy766AHQYMWh5C8lNNJ2R4jMRmPN8wiRMaojCkMovjJY_8-Ctx2lP7jiD4ZjH3ISsojS3IxWWBk_CDBebRlo8c22AjPH1nmCZWVPBt2r53TYvjq_";
    final response = await http.post(
      Uri.parse('https://api.dropboxapi.com/2/files/create_folder_v2'),
      headers: <String, String>{
        'Authorization' : 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'autorename': false,
        'path':'/data',
      }),
    );
    if(response.statusCode == 200){
      log(response.body.toString());

    }else{
      log(response.body.toString());
    }
  }

  uploadData(String filename) async {
    final file = File(fileToDisplay!.path.toString());
    Uint8List data = await file.readAsBytes();
    String token = "sl.BXhC9w_oF_3GmEbpTsyx97K8JwZgRy766AHQYMWh5C8lNNJ2R4jMRmPN8wiRMaojCkMovjJY_8-Ctx2lP7jiD4ZjH3ISsojS3IxWWBk_CDBebRlo8c22AjPH1nmCZWVPBt2r53TYvjq_";
    final response = await http.post(
      Uri.parse('https://content.dropboxapi.com/2/files/upload'),
      headers: <String, String>{
        'Authorization' : 'Bearer $token',
        'Content-Type': 'application/octet-stream',
        'Dropbox-API-Arg' : '{"autorename" : false, "mode":"add", "mute": false,  "path": "/data/$filename", "strict_conflict": false}'
      },
      body: data,
    );
    if(response.statusCode == 200){
      log(response.body.toString());

    }else{
      log(response.body.toString());
    }
  }

}

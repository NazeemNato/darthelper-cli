import 'dart:io';
import 'package:dartHelp/commands/command.dart';

class Create extends DartCmd {
  final name = 'create';
  final description = "Create Dart project";

  @override
  createFileForUsers(String fileName) async {
    String mainFile = '''
import 'package:$fileName/$fileName.dart' as ${fileName.toLowerCase()};

main(List<String> args) async {

}
    ''';

    String pubFile = '''
name: $fileName
description: My dart project

# dependencies:

dev_dependencies:
  pedantic: ^1.8.0
  test: ^1.6.0

    ''';

    List folderFileName = [
      '$fileName/lib/$fileName.dart',
      '$fileName/bin/main.dart',
      '$fileName/pubspec.yaml'
    ];

    folderFileName.forEach((element) {
      new File(element).create(recursive: true).then((value)async{
        print(value);
        if(value.path == '$fileName/pubspec.yaml' || value.path == '$fileName\\pubspec.yaml'){
          var myFile = File(value.path);
          var sink = myFile.openWrite();
          sink.write(pubFile);
          await sink.flush();
          await sink.close();
        }
        if(value.path == '$fileName/bin/main.dart' || value.path == '$fileName\\bin\\main.dart'){
          var myFile = File(value.path);
          var sink = myFile.openWrite();
          sink.write(mainFile);
          await sink.flush();
          await sink.close();
        }
      });
    });

    return 'Finished\n';
  }
}

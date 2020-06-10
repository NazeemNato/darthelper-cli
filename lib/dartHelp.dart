import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:dartHelp/commands/create.dart';

Future<void> dartHelp(List<String> args) async{
 final runner = CommandRunner('Dart Helper','DartHelper help you to create dart project folder');
  

  runner..addCommand(Create());
  
  return await runner.run(args).catchError((e) {
    stdout.write("${e ?? "An Error Occured"}");
    exitCode = 1;
  });
}
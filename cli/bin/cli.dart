import 'package:command_runner/command_runner.dart';

void main(List<String> arguments) async {
  var runner = CommandRunner();
  await runner.run(arguments);
}

const version = '0.0.1';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartopedia CLI Version $version');
  } else {
    print('Unknown command: ${arguments.first}');
    printUsage();
  }
}

void printUsage() {
  print('Usage: dart cli.dart [command]');
  print('Commands:');
  print('  help      Show this help message');
  print('  version   Show the version of the CLI');
}
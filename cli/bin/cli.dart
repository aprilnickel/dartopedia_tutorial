import 'dart:io';

const version = '0.0.1';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartopedia CLI Version $version');
  } else if (arguments.first == 'search') {
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
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
  print('  search    Search an articlefrom Wikipedia');
}

void searchWikipedia(List<String>? arguments) {
  final String articleTitle;

  // If the user did not pass in arguments, prompt for an article title.
  if (arguments == null || arguments.isEmpty) {
    print('Please provide an article title to search.');
    // Await user input, default to an empty string if no input is provided.
    articleTitle = stdin.readLineSync() ?? '';
  } else {
    articleTitle = arguments.join(' ');
  }
  print('Searching Wikipedia for: "$articleTitle". Please wait.');
  print('Here ya go!');
  print('(Pretend this is an article about $articleTitle.)');
}
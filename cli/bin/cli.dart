import 'dart:io';
import 'package:http/http.dart' as http;

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

void searchWikipedia(List<String>? arguments) async {
  final String articleTitle;

  // If the user did not pass in arguments, prompt for an article title.
  if (arguments == null || arguments.isEmpty) {
    print('Please provide an article title to search.');
    final inputFromUser = stdin.readLineSync();
    if (inputFromUser == null || inputFromUser.isEmpty) {
      print('No article title provided. Exiting.');
      return;
    }
    articleTitle = inputFromUser;
  } else {
    articleTitle = arguments.join(' ');
  }
  
  print('Searching Wikipedia for: "$articleTitle". Please wait.');
  
  var articleSummary = await getWikipediaArticle(articleTitle);
  print(articleSummary);
}

Future<String> getWikipediaArticle(String articleTitle) async {
  final url = Uri.https(
    'en.wikipedia.org',
    '/api/rest_v1/page/summary/$articleTitle',
  );
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return response.body;
  }
  
  return 'Error: Failed to load article "$articleTitle". Status code: ${response.statusCode}';
}
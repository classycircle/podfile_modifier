//  library;
 export 'src/podfile_modifier_base.dart';

import 'dart:io';

class PodfileModifier {
  final String podfilePath;

  PodfileModifier({this.podfilePath = 'ios/Podfile'});

  void modifyPodfile() {
    final podfile = File(podfilePath);

    if (!podfile.existsSync()) {
      print('Podfile not found at $podfilePath');
      exit(1);
    }

    final lines = podfile.readAsLinesSync();

    final updatedLines = lines.map((line) {
      if (line.contains('BUILD_LIBRARY_FOR_DISTRIBUTION')) {
        return line.replaceAll('BUILD_LIBRARY_FOR_DISTRIBUTION = YES', 'BUILD_LIBRARY_FOR_DISTRIBUTION = NO');
      } else if (line.contains('APPLICATION_EXTENSION_API_ONLY')) {
        return line.replaceAll('APPLICATION_EXTENSION_API_ONLY = YES', 'APPLICATION_EXTENSION_API_ONLY = NO');
      } else {
        return line;
      }
    }).toList();

    podfile.writeAsStringSync(updatedLines.join('\n'));

    print('Podfile modified successfully.');
  }
}

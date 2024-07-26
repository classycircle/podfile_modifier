import 'package:args/args.dart';
import 'package:podfile_modifier/podfile_modifier.dart';

void main(List<String> arguments) {
  final parser = ArgParser()..addOption('path', abbr: 'p', defaultsTo: 'ios/Podfile');
  final argResults = parser.parse(arguments);

  final modifier = PodfileModifier(podfilePath: argResults['path']);
  modifier.modifyPodfile();
}

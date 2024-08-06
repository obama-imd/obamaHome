// List<String> nivelEnsino = <String>['Todos'];


List<String> temaCurricular = <String>['Todos'];
List<String> tipo = <String>['Todos'];
List<String> descritor = <String>['Todos'];

const List<String> tileTitle = <String>[
  'Selecione o nível de ensino',
  'Selecione o tema curricular',
  'Selecione o tipo',
  'Selecione o descritor',
];

bool pcnCheck = false;
bool bnccCheck = false;

var setLevel = [];
// Future<void> getLevels() async {
//   List<String> levels = [];
//   List<dynamic> learnLevels = await fetchLevels();
//   for (var level in learnLevels) {
//     print("nivel1 => $level");
//     levels.add(level.name);
//   }
//   // try {
//   // setState(() {
//   //   nivelEnsino = levels;
//   // });
//   print("nivel2 => $learnLevels");
//   // } catch (e) {
//   //   print('Error in getLevels: $e');
//   // }
// }

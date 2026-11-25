import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_spor_bilgisi/oyun_spor_bilgisi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(sporBilgisiConfig.title.length, 33);
    expect(sporBilgisiConfig.tagline.length, 33);
    for (final s in sporBilgisiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(sporBilgisiConfig.gameId, sporBilgisiId);
    expect(sporBilgisiRules.gameId, sporBilgisiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(sporBilgisiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: sporBilgisiId, optionalMechanics: sporBilgisiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(sporBilgisiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}

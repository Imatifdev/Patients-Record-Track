import 'dart:convert';

class PatientsData {
  final int updated;
  final int cases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int todayRecovered;
  final int active;
  final int critical;
  final int casesPerOneMillion;
  final double deathsPerOneMillion;
  final int tests;
  final double testsPerOneMillion;
  final int population;
  final int oneCasePerPeople;
  final int oneDeathPerPeople;
  final int oneTestPerPeople;
  final double activePerOneMillion;
  final double recoveredPerOneMillion;
  final double criticalPerOneMillion;
  final int affectedCountries;
  PatientsData({
    required this.updated,
    required this.cases,
    required this.todayCases,
    required this.deaths,
    required this.todayDeaths,
    required this.recovered,
    required this.todayRecovered,
    required this.active,
    required this.critical,
    required this.casesPerOneMillion,
    required this.deathsPerOneMillion,
    required this.tests,
    required this.testsPerOneMillion,
    required this.population,
    required this.oneCasePerPeople,
    required this.oneDeathPerPeople,
    required this.oneTestPerPeople,
    required this.activePerOneMillion,
    required this.recoveredPerOneMillion,
    required this.criticalPerOneMillion,
    required this.affectedCountries,
  });

  PatientsData copyWith({
    int? updated,
    int? cases,
    int? todayCases,
    int? deaths,
    int? todayDeaths,
    int? recovered,
    int? todayRecovered,
    int? active,
    int? critical,
    int? casesPerOneMillion,
    double? deathsPerOneMillion,
    int? tests,
    double? testsPerOneMillion,
    int? population,
    int? oneCasePerPeople,
    int? oneDeathPerPeople,
    int? oneTestPerPeople,
    double? activePerOneMillion,
    double? recoveredPerOneMillion,
    double? criticalPerOneMillion,
    int? affectedCountries,
  }) {
    return PatientsData(
      updated: updated ?? this.updated,
      cases: cases ?? this.cases,
      todayCases: todayCases ?? this.todayCases,
      deaths: deaths ?? this.deaths,
      todayDeaths: todayDeaths ?? this.todayDeaths,
      recovered: recovered ?? this.recovered,
      todayRecovered: todayRecovered ?? this.todayRecovered,
      active: active ?? this.active,
      critical: critical ?? this.critical,
      casesPerOneMillion: casesPerOneMillion ?? this.casesPerOneMillion,
      deathsPerOneMillion: deathsPerOneMillion ?? this.deathsPerOneMillion,
      tests: tests ?? this.tests,
      testsPerOneMillion: testsPerOneMillion ?? this.testsPerOneMillion,
      population: population ?? this.population,
      oneCasePerPeople: oneCasePerPeople ?? this.oneCasePerPeople,
      oneDeathPerPeople: oneDeathPerPeople ?? this.oneDeathPerPeople,
      oneTestPerPeople: oneTestPerPeople ?? this.oneTestPerPeople,
      activePerOneMillion: activePerOneMillion ?? this.activePerOneMillion,
      recoveredPerOneMillion:
          recoveredPerOneMillion ?? this.recoveredPerOneMillion,
      criticalPerOneMillion:
          criticalPerOneMillion ?? this.criticalPerOneMillion,
      affectedCountries: affectedCountries ?? this.affectedCountries,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'updated': updated,
      'cases': cases,
      'todayCases': todayCases,
      'deaths': deaths,
      'todayDeaths': todayDeaths,
      'recovered': recovered,
      'todayRecovered': todayRecovered,
      'active': active,
      'critical': critical,
      'casesPerOneMillion': casesPerOneMillion,
      'deathsPerOneMillion': deathsPerOneMillion,
      'tests': tests,
      'testsPerOneMillion': testsPerOneMillion,
      'population': population,
      'oneCasePerPeople': oneCasePerPeople,
      'oneDeathPerPeople': oneDeathPerPeople,
      'oneTestPerPeople': oneTestPerPeople,
      'activePerOneMillion': activePerOneMillion,
      'recoveredPerOneMillion': recoveredPerOneMillion,
      'criticalPerOneMillion': criticalPerOneMillion,
      'affectedCountries': affectedCountries,
    };
  }

  factory PatientsData.fromMap(Map<String, dynamic> map) {
    return PatientsData(
      updated: map['updated'].toInt() as int,
      cases: map['cases'].toInt() as int,
      todayCases: map['todayCases'].toInt() as int,
      deaths: map['deaths'].toInt() as int,
      todayDeaths: map['todayDeaths'].toInt() as int,
      recovered: map['recovered'].toInt() as int,
      todayRecovered: map['todayRecovered'].toInt() as int,
      active: map['active'].toInt() as int,
      critical: map['critical'].toInt() as int,
      casesPerOneMillion: map['casesPerOneMillion'].toInt() as int,
      deathsPerOneMillion: map['deathsPerOneMillion'].toDouble() as double,
      tests: map['tests'].toInt() as int,
      testsPerOneMillion: map['testsPerOneMillion'].toDouble() as double,
      population: map['population'].toInt() as int,
      oneCasePerPeople: map['oneCasePerPeople'].toInt() as int,
      oneDeathPerPeople: map['oneDeathPerPeople'].toInt() as int,
      oneTestPerPeople: map['oneTestPerPeople'].toInt() as int,
      activePerOneMillion: map['activePerOneMillion'].toDouble() as double,
      recoveredPerOneMillion:
          map['recoveredPerOneMillion'].toDouble() as double,
      criticalPerOneMillion: map['criticalPerOneMillion'].toDouble() as double,
      affectedCountries: map['affectedCountries'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PatientsData.fromJson(String source) =>
      PatientsData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PatientsData(updated: $updated, cases: $cases, todayCases: $todayCases, deaths: $deaths, todayDeaths: $todayDeaths, recovered: $recovered, todayRecovered: $todayRecovered, active: $active, critical: $critical, casesPerOneMillion: $casesPerOneMillion, deathsPerOneMillion: $deathsPerOneMillion, tests: $tests, testsPerOneMillion: $testsPerOneMillion, population: $population, oneCasePerPeople: $oneCasePerPeople, oneDeathPerPeople: $oneDeathPerPeople, oneTestPerPeople: $oneTestPerPeople, activePerOneMillion: $activePerOneMillion, recoveredPerOneMillion: $recoveredPerOneMillion, criticalPerOneMillion: $criticalPerOneMillion, affectedCountries: $affectedCountries)';
  }

  @override
  bool operator ==(covariant PatientsData other) {
    if (identical(this, other)) return true;

    return other.updated == updated &&
        other.cases == cases &&
        other.todayCases == todayCases &&
        other.deaths == deaths &&
        other.todayDeaths == todayDeaths &&
        other.recovered == recovered &&
        other.todayRecovered == todayRecovered &&
        other.active == active &&
        other.critical == critical &&
        other.casesPerOneMillion == casesPerOneMillion &&
        other.deathsPerOneMillion == deathsPerOneMillion &&
        other.tests == tests &&
        other.testsPerOneMillion == testsPerOneMillion &&
        other.population == population &&
        other.oneCasePerPeople == oneCasePerPeople &&
        other.oneDeathPerPeople == oneDeathPerPeople &&
        other.oneTestPerPeople == oneTestPerPeople &&
        other.activePerOneMillion == activePerOneMillion &&
        other.recoveredPerOneMillion == recoveredPerOneMillion &&
        other.criticalPerOneMillion == criticalPerOneMillion &&
        other.affectedCountries == affectedCountries;
  }

  @override
  int get hashCode {
    return updated.hashCode ^
        cases.hashCode ^
        todayCases.hashCode ^
        deaths.hashCode ^
        todayDeaths.hashCode ^
        recovered.hashCode ^
        todayRecovered.hashCode ^
        active.hashCode ^
        critical.hashCode ^
        casesPerOneMillion.hashCode ^
        deathsPerOneMillion.hashCode ^
        tests.hashCode ^
        testsPerOneMillion.hashCode ^
        population.hashCode ^
        oneCasePerPeople.hashCode ^
        oneDeathPerPeople.hashCode ^
        oneTestPerPeople.hashCode ^
        activePerOneMillion.hashCode ^
        recoveredPerOneMillion.hashCode ^
        criticalPerOneMillion.hashCode ^
        affectedCountries.hashCode;
  }
}

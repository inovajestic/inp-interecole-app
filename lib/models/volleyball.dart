import 'package:cloud_firestore/cloud_firestore.dart';

class Volleyball {
  final String categorie;
  final String dateHeure;
  final String domicile;
  final String exterieur;
  final int scoreDomicile;
  final int scoreExterieur;
  final int setDomicile;
  final int setExterieur;
  final String statut;
  final String temps;
  final String terrain;
  final String journee;
  final bool enCours;
  final bool estTerminee;
  final DocumentReference reference;

  Volleyball.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['categorie'] != null),
        assert(map['dateHeure'] != null),
        assert(map['domicile'] != null),
        assert(map['exterieur'] != null),
        assert(map['scoreDomicile'] != null),
        assert(map['scoreExterieur'] != null),
        assert(map['setDomicile'] != null),
        assert(map['setExterieur'] != null),
        assert(map['statut'] != null),
        assert(map['temps'] != null),
        assert(map['terrain'] != null),
        assert(map['journee'] != null),
        assert(map['enCours'] != null),
        assert(map['estTerminee'] != null),
        categorie = map['categorie'],
        dateHeure = map['dateHeure'],
        domicile = map['domicile'],
        exterieur = map['exterieur'],
        scoreDomicile = map['scoreDomicile'],
        scoreExterieur = map['scoreExterieur'],
        setDomicile = map['setDomicile'],
        setExterieur = map['setExterieur'],
        statut = map['statut'],
        temps = map['temps'],
        journee = map['journee'],
        terrain = map['terrain'],
        estTerminee = map['estTerminee'],
        enCours = map['enCours'];
  Volleyball.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() {
    return "Basketball<$journee:$categorie:$dateHeure:$enCours:$domicile:$scoreDomicile:$exterieur:$scoreExterieur:$statut:$temps:$terrain>";
  }


}

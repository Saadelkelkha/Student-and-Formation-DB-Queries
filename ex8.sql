use centre_formation;
Database changed
mysql> select count(nom_CINEtu) as nombre_etudiants from etudiant;
+------------------+
| nombre_etudiants |
+------------------+
|                7 |
+------------------+
1 row in set (0.02 sec)

mysql> select nom_CINEtu,round(datediff(sysdate(),dateNaissance)/365) as Age from etudiant;
+------------+------+
| nom_CINEtu | Age  |
+------------+------+
| AB234567   |   38 |
| C0987265   |   26 |
| D2356903   |   28 |
| F9827363   |   27 |
| G5346789   |   24 |
| J3578902   |   34 |
| Y1234987   |   44 |
+------------+------+
7 rows in set (0.00 sec)

mysql> select max(prixform) as plus_chere,min(prixform) as moins_chere from formation;
+------------+-------------+
| plus_chere | moins_chere |
+------------+-------------+
|       6000 |        2500 |
+------------+-------------+
1 row in set (0.00 sec)

mysql> select sum(prixform) as prix_tout_formation from formation;
+---------------------+
| prix_tout_formation |
+---------------------+
|               23050 |
+---------------------+
1 row in set (0.00 sec)

mysql> SELECT DISTINCT session.codesess, COUNT(inscription.nom_CINEtu) AS nombre_etudiants
    -> FROM session
    -> left JOIN inscription ON session.codesess = inscription.codesess
    -> GROUP BY session.codesess;
+----------+------------------+
| codesess | nombre_etudiants |
+----------+------------------+
|     1101 |                7 |
|     1102 |                0 |
|     1104 |                0 |
|     1201 |                6 |
|     1202 |                0 |
|     1203 |                0 |
|     1204 |                0 |
|     1301 |                0 |
|     1302 |                5 |
|     1303 |                0 |
|     1401 |                6 |
|     1402 |                0 |
|     1501 |                7 |
|     1502 |                0 |
|     1601 |                0 |
|     1602 |                0 |
+----------+------------------+
16 rows in set (0.00 sec)

mysql> select distinct nom_CINEtu from inscription;
+------------+
| nom_CINEtu |
+------------+
| AB234567   |
| C0987265   |
| D2356903   |
| F9827363   |
| G5346789   |
| J3578902   |
| Y1234987   |
+------------+
7 rows in set (0.00 sec)

mysql> select distinct nom_CINEtu,count(nom_CINEtu) as nombre_inscription from inscription
    -> group by nom_CINEtu;
+------------+--------------------+
| nom_CINEtu | nombre_inscription |
+------------+--------------------+
| AB234567   |                  4 |
| C0987265   |                  5 |
| D2356903   |                  5 |
| F9827363   |                  3 |
| G5346789   |                  5 |
| J3578902   |                  4 |
| Y1234987   |                  5 |
+------------+--------------------+
7 rows in set (0.00 sec)

mysql> SELECT DISTINCT session.codesess, COUNT(inscription.nom_CINEtu) AS nombre_etudiants_distanciel
    -> FROM session
    -> left JOIN inscription ON session.codesess = inscription.codesess and typecours = 'Distanciel'
    -> GROUP BY session.codesess;
+----------+-----------------------------+
| codesess | nombre_etudiants_distanciel |
+----------+-----------------------------+
|     1101 |                           7 |
|     1102 |                           0 |
|     1104 |                           0 |
|     1201 |                           0 |
|     1202 |                           0 |
|     1203 |                           0 |
|     1204 |                           0 |
|     1301 |                           0 |
|     1302 |                           1 |
|     1303 |                           0 |
|     1401 |                           6 |
|     1402 |                           0 |
|     1501 |                           2 |
|     1502 |                           0 |
|     1601 |                           0 |
|     1602 |                           0 |
+----------+-----------------------------+
16 rows in set (0.00 sec)

mysql> SELECT DISTINCT session.codesess, COUNT(inscription.nom_CINEtu) AS nombre_etudiants_distanciel
    -> FROM session
    -> left JOIN inscription ON session.codesess = inscription.codesess and typecours = 'Présentiel'
    -> GROUP BY session.codesess;
+----------+-----------------------------+
| codesess | nombre_etudiants_distanciel |
+----------+-----------------------------+
|     1101 |                           0 |
|     1102 |                           0 |
|     1104 |                           0 |
|     1201 |                           6 |
|     1202 |                           0 |
|     1203 |                           0 |
|     1204 |                           0 |
|     1301 |                           0 |
|     1302 |                           4 |
|     1303 |                           0 |
|     1401 |                           0 |
|     1402 |                           0 |
|     1501 |                           4 |
|     1502 |                           0 |
|     1601 |                           0 |
|     1602 |                           0 |
+----------+-----------------------------+
16 rows in set (0.00 sec)

mysql>

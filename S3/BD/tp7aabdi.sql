CREATE SCHEMA IF NOT EXISTS indexes;
SET search_path TO indexes;

/* QUESTION 1*/

DROP TABLE IF EXISTS entiers CASCADE;

CREATE TABLE entiers (

	cle SERIAL PRIMARY KEY,
	valeur INT
);

INSERT INTO entiers (cle, valeur) VALUES (generate_series(1, 10000), (RANDOM() * 500 + 1));

/* QUESTION 2*/

explain (format json) select * from entiers;

/*            QUERY PLAN             
-----------------------------------
 [                                +
   {                              +
     "Plan": {                    +
       "Node Type": "Seq Scan",   +
       "Parallel Aware": false,   +
       "Relation Name": "entiers",+
       "Alias": "entiers",        +
       "Startup Cost": 0.00,      +
       "Total Cost": 146.70,      +
       "Plan Rows": 10170,        +
       "Plan Width": 8            +
     }                            +
   }                              +
 ]
(1 ligne)*/

/* QUESTION 3*/

EXPLAIN (format json) SELECT valeur, COUNT(cle) FROM entiers GROUP BY valeur ORDER BY valeur;

/*                  QUERY PLAN                   
-----------------------------------------------
 [                                            +
   {                                          +
     "Plan": {                                +
       "Node Type": "Sort",                   +
       "Parallel Aware": false,               +
       "Startup Cost": 222.48,                +
       "Total Cost": 223.73,                  +
       "Plan Rows": 501,                      +
       "Plan Width": 12,                      +
       "Sort Key": ["valeur"],                +
       "Plans": [                             +
         {                                    +
           "Node Type": "Aggregate",          +
           "Strategy": "Hashed",              +
           "Partial Mode": "Simple",          +
           "Parent Relationship": "Outer",    +
           "Parallel Aware": false,           +
           "Startup Cost": 195.00,            +
           "Total Cost": 200.01,              +
           "Plan Rows": 501,                  +
           "Plan Width": 12,                  +
           "Group Key": ["valeur"],           +
           "Plans": [                         +
             {                                +
               "Node Type": "Seq Scan",       +
               "Parent Relationship": "Outer",+
               "Parallel Aware": false,       +SELECT valeur, COUNT(cle) FROM entiers
               "Relation Name": "entiers",    +
               "Alias": "entiers",            +
               "Startup Cost": 0.00,          +
               "Total Cost": 145.00,          +
               "Plan Rows": 10000,            +
               "Plan Width": 8                +
             }                                +
           ]                                  +
         }                                    +
       ]                                      +
     }                                        +
   }                                          +
 ]
(1 ligne)
*/


/*il lit ligne par ligne de manière sequentielle avec le seq scan, on peut 
aussi voir que le cout total est assez élevé, il y a aussi le nombre de lignes retournés etc...*/

/* QUESTION 4*/

EXPLAIN (format json) SELECT COUNT(cle) FROM entiers WHERE valeur = 2;

/* count 
-------
    22
(1 ligne)*/


/*                QUERY PLAN                 
-------------------------------------------
 [                                        +
   {                                      +
     "Plan": {                            +
       "Node Type": "Aggregate",          +
       "Strategy": "Plain",               +
       "Partial Mode": "Simple",          +
       "Parallel Aware": false,           +
       "Startup Cost": 170.04,            +
       "Total Cost": 170.05,              +
       "Plan Rows": 1,                    +
       "Plan Width": 8,                   +
       "Plans": [                         +
         {                                +
           "Node Type": "Seq Scan",       +
           "Parent Relationship": "Outer",+
           "Parallel Aware": false,       +
           "Relation Name": "entiers",    +
           "Alias": "entiers",            +
           "Startup Cost": 0.00,          +
           "Total Cost": 170.00,          +
           "Plan Rows": 18,               +
           "Plan Width": 4,               +
           "Filter": "(valeur = 2)"       +
         }                                +
       ]                                  +
     }                                    +
   }                                      +
 ]
(1 ligne)*/

CREATE INDEX ind ON entiers USING hash(valeur);

SELECT COUNT(cle) FROM entiers WHERE valeur = 2;

EXPLAIN (format json) SELECT COUNT(cle) FROM entiers WHERE valeur = 2;

/*                   QUERY PLAN                    
-------------------------------------------------
 [                                              +
   {                                            +
     "Plan": {                                  +
       "Node Type": "Aggregate",                +
       "Strategy": "Plain",                     +
       "Partial Mode": "Simple",                +
       "Parallel Aware": false,                 +
       "Startup Cost": 38.71,                   +
       "Total Cost": 38.72,                     +
       "Plan Rows": 1,                          +
       "Plan Width": 8,                         +
       "Plans": [                               +
         {                                      +
           "Node Type": "Bitmap Heap Scan",     +
           "Parent Relationship": "Outer",      +
           "Parallel Aware": false,             +
           "Relation Name": "entiers",          +
           "Alias": "entiers",                  +
           "Startup Cost": 4.42,                +
           "Total Cost": 38.67,                 +
           "Plan Rows": 18,                     +
           "Plan Width": 4,                     +
           "Recheck Cond": "(valeur = 2)",      +
           "Plans": [                           +
             {                                  +
               "Node Type": "Bitmap Index Scan",+
               "Parent Relationship": "Outer",  +
               "Parallel Aware": false,         +
               "Index Name": "ind_val",         +
               "Startup Cost": 0.00,            +
               "Total Cost": 4.42,              +
               "Plan Rows": 18,                 +
               "Plan Width": 0,                 +
               "Index Cond": "(valeur = 2)"     +
             }                                  +
           ]                                    +
         }                                      +
       ]                                        +
     }                                          +
   }                                            +
 ]
(1 ligne)*/

/* cette fois il se sert de l'index et on peut bel et bien apercevoir que le cout total est beaucoup 
moins important

l'index peut etre comparé à une vue de la table entiers qui est trié et quand on en crée un pour la table
entiers maintenant dans le WHERE il va chercher directement dans l'index et non plus 
dans la table elle-meme*/

















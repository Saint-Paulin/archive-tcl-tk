#ifndef _LAUNCHER_
#define _LAUNCHER_

#include <stdio.h>
#include <stdlib.h>
#include <tcl.h>
#include <tk.h>
#include <string.h>

#define NBCASE 8
const int VIDE=0;
const int JR1=1;
const int JR2=2;

typedef int * tDamier;
typedef int tHauteur[NBCASE];


int JoueAuto(ClientData cdata,Tcl_Interp * interp,int argnumber,const char *arglist[]);
int Joue(ClientData cdata,Tcl_Interp * interp,int argnumber,const char *arglist[]);
int init_jeu(ClientData cdata,Tcl_Interp * interp,int argnumber,const char *arglist[]);
int Affichdamier(ClientData cdata,Tcl_Interp * interp,int argnumber,const char *arglist[]);

// fonctions masques pour les methodes tcl:

void TestPos(tDamier tabl,int* Htr,int jr,int niv,int x,int y,int *tab1);
void CalculScore(tDamier tabl,int jr,int x,int y,int *tabres);
void MeilleurPosition(tDamier tabl,tHauteur *Htr,int jr,int niv, int *res);
int Launch_Interface(Tcl_Interp *interp);
int PremierLibre(tHauteur *Htr,int x);
void ExamineDamier(tDamier tabl,int jr,int x,int y,int * tabp4);
int comptedir(tDamier tabl,int jr,int x,int y,int dir);
void initdamier (void);


class Launcher
{
public:
	int Launch(char which);

};

#endif

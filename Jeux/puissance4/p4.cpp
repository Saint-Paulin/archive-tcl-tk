#include <tk.h>
#include "p4.h"

tDamier damier;
tHauteur Hauteur;

int Joueur = JR1;
int Niveau = 0;
/* La fonction main se contente de lancer l'interpreteur Tk */



/*------------------------------------------------------------*/
/*                                                            */
/* Initialisation de Tcl/Tk et rajout des nouvelles commandes */
/* Lancement du script tcl par Tk_EvalFile,					  */
/* puis boucle d'attente des commandes (tk_MainLoop)	      */
/*------------------------------------------------------------*/

int Launch_Interface(Tcl_Interp *interp)
{
	// Initialisation TCL:
    if (Tcl_Init(interp) != TCL_OK) {
		fprintf(stderr, "Tcl_Init failed: %s\n", interp->result);
		return TCL_ERROR;
    }
	// Initialisation TK:
    if (Tk_Init(interp) != TCL_OK) {
		fprintf(stderr, "Tk_Init failed: %s\n", interp->result);
		return TCL_ERROR;
    }

	// Association de la commande Tcl "fact" avec la fonction C Fact 
   Tcl_CreateCommand(interp, "JoueAuto", JoueAuto, (ClientData) 0,NULL);

   Tcl_CreateCommand(interp, "Joue", Joue, (ClientData) 0,NULL);
   Tcl_CreateCommand(interp, "init_jeu", init_jeu, (ClientData) 0,NULL);
   Tcl_CreateCommand(interp, "Affichdamier", Affichdamier, (ClientData) 0,NULL);


   printf("chargement \n");

	// Chargement du fichier TCL:
	if (Tcl_EvalFile(interp, "p4.tcl") != TCL_OK) {
		fprintf(stderr, "p4.tcl evaluation failed: %s\n", interp->result);
		return TCL_ERROR;
	}

	printf("fin chargement \n");

	// On donne la main au Window Manager:
	Tk_MainLoop();
	
	printf("fin launch_practice\n");
    return TCL_OK;
}


// Fonction appellé lorsqu'un joueur joue
int Joue(ClientData cdata,Tcl_Interp * interp,int argnumber,const char *arglist[])
{	
	char which = *arglist[1];
	int nb=0,x,y,tab4[18];
	char resultat[50],temp[5];

	x=((int) which) - 48; //conversion ascii -> int*/

	if ((x<0) || (x>7)) return 1;

	y=PremierLibre(&Hauteur,x); // hauteur de la colonne joué
	if (y> -1)
	{

		if (Joueur==JR1) Joueur=JR2;
		else Joueur=JR1;

		Hauteur[x]=y + 1;
		damier[(NBCASE*x) + y]=Joueur;
//printf("\n set_which damier[x=%d,y=%d]=%d  ",x,y,damier[(NBCASE*x) + y]);

		ExamineDamier(damier,Joueur,x,y,tab4);
		nb=tab4[0]; //nb de p4

	}

	if (nb>0) {
	//	itoa(nb,resultat,10);
	        resultat[0]=(char  ) (nb+48);
		resultat[1]=0;
		printf (interp->result, "\n  nbP4:%d",nb);

		for (int i=1;i<(4*nb+1);i++) {

		//	itoa(tab4[i],temp,10);
		  temp[0]= (char ) (tab4[i]+48);
		  temp[1]=0;
//			printf("\n tab4[%d]=%d temp:%s ",i,tab4[i],temp);
			strcat(resultat," ");
			strcat(resultat,temp);
		//	sprintf (interp->result, " %d",tab4[i]);
		}
		printf("resultat=%s",resultat);
		sprintf (interp->result, "%d %d %s",y,Joueur,resultat);

	} else {
		sprintf (interp->result, "%d %d",y,Joueur);
	//	printf ("\nValeur de retour:%d %d",y,Joueur);
	}



	return 0;
}


int JrAdverse(int joueur)
{
	if (joueur== JR1) return JR2;
		return JR1;
}

int JoueAuto(ClientData cdata,Tcl_Interp * interp,int argnumber,const char *arglist[])
{
	int res[20],pos[4],nb,x,y,jr;
	char which = *arglist[1];
	char resultat[50],temp[5];
	Niveau=((int) which) - 48; //ascii -> int*/
	jr=JrAdverse(Joueur);

	MeilleurPosition(damier,&Hauteur,Joueur,Niveau,pos);

	x=pos[0];
	y=pos[1];
printf("\n JoueAuto: x=%d y=%d",x,y);

	if (y<0) {
		for(x=0;(x<NBCASE) && (y<0) && (y<NBCASE);x++) {
			y=PremierLibre(&Hauteur,x);
		}
	printf("\nPas de case interressante trouve, on prend la première libre:%d",y);
	}

	if (y> -1)
	{

		Joueur=jr;

		Hauteur[x]=y + 1;
		damier[(NBCASE*x) + y]=Joueur;

		ExamineDamier(damier,Joueur,x,y,res);
		nb=res[0]; //nb de p4

	} else {
		printf("\nERREUR JoueAuto y<0\n"); //pas de case trouvée


	}


			if (nb>0) {
			//	itoa(nb,resultat,10);

			 //	sprintf (interp->result, "%d %d %d %d",x,y,Joueur,nb);
			  resultat[0]=(char ) (nb+48);
			  resultat[1]=0;
				for (int i=1;i<(4*nb+1);i++) {
			//		fprintf(fic_in,"\n%d",res[i]);
					strcat(resultat," ");
					temp[0]= (char) (res[i] + 48);
					temp[1]=0;
					strcat(resultat,temp);
				//	sprintf (interp->result,"%d ",res[i]);
					

				}
				printf("\nresultat=%s",resultat);
				sprintf (interp->result, "%d %d %d %s",x,y,Joueur,resultat);

			} else {
				sprintf (interp->result, "%d %d %d",x,y,Joueur);		
			}

		//	fclose(fic_in);
	//}

	//sprintf (interp->result, "%d",x);

	return TCL_OK;
}


void MeilleurPosition(tDamier tabl,tHauteur *Htr,int jr,int niv, int *res)
{
	int x=0,y=-1/*,tab[25]*/,tab1[4],nbmax,scrmax,xb=0,yb=0,nbp4,score;//,temp;
	bool fin=false;
//	int tabl2[NBCASE*NBCASE],Htr2[NBCASE];

	if (Niveau==0) {
		while ( (x<8) && (y<0) ) {
			y=PremierLibre(Htr,x);
			x++;
		}
		res[0]=x-1;
		res[1]=y;
	}
	else {


		for (x=0;(x<8) && (!fin);x++) {
			y=PremierLibre(Htr,x);
			//Calcul du score de chaque position
			CalculScore(tabl,jr,x,y,tab1);
			nbp4=tab1[0];
			score=tab1[1];
			if ((niv >1) && (y>-1) && (nbp4<2)) {

				TestPos(tabl,*Htr,jr,niv,x,y,tab1);

				if (nbp4>tab1[2]) fin=true;

				nbp4=nbp4 - tab1[2];
				score=score-tab1[3];

//printf("\nniv=%d x:%d nbp4:%d score:%d  ",niv,x,nbp4,score);

			}

			if ( (x==0) || (nbp4>nbmax) || ( (nbp4 == nbmax) && ( (score>scrmax) ||
					( (score==scrmax) && ( Htr[y]>Htr[yb] ) )  ) ) )  {

				xb=x;
				yb=y;
				nbmax=nbp4;
				scrmax=score;
			}

			res[0]=xb;
			res[1]=yb;
			res[2]=nbmax;
			res[3]=scrmax;


		}

	}

//printf("\n MeilleurPosition: x=%d y=%d",res[0],res[1]);

}


void TestPos(tDamier tabl,int* Htr,int jr,int niv,int x,int y,int *tab1)
{
	int i,tabl2[NBCASE*NBCASE],Htr2[NBCASE],temp;

	for(i=0;i<(NBCASE*NBCASE);i++) {tabl2[i]=tabl[i]; }//copier tabl -> tabl2 et Htr
	for(i=0;i<NBCASE;i++) Htr2[i]=Htr[i];
	tabl2[(NBCASE*x) + y]=jr;
	Htr2[x]=y + 1;
	temp=JrAdverse(jr);
	MeilleurPosition(tabl2,&Htr2,temp,(niv-1),tab1);

//if(niv == Niveau) printf("\nTestPos: niv:%d jr:%d x:%d y:%d  nb:%d scoremax:%d ",niv-1,temp,x,y,tab1[2],tab1[3]);

}
/****************************************************************
 *			init_jeu										    *
 ****************************************************************/

int init_jeu(ClientData cdata,Tcl_Interp * interp,int argnumber,const char *arglist[])
{
	// Initialisation
	char which = *arglist[1]; /*- 48; //ascii -> int*/


	damier= (int *) malloc(sizeof(int) * (NBCASE*NBCASE));
	
	initdamier();


	return 0;
}


void initdamier(void)
{
	int i,j;
	printf("\nInitalisation des tableaux damier et Hauteur");
	for (i=0; i<NBCASE; i++) {
		Hauteur[i]=0;
		//printf("\n Hauteur[%d]=%d ",i,Hauteur[i]);
		for (j=0; j<NBCASE; j++) {
			damier[(i*NBCASE)+j]=VIDE;
		}

	}

}


int Affichdamier(ClientData cdata,Tcl_Interp * interp,int argnumber,const char *arglist[])
{

	int i,j;
	printf("\ndamier=");
	for (i=0; i<NBCASE; i++) {

		printf("\n Hauteur[%d]=%d ",i,Hauteur[i]);
		for (j=0; j<NBCASE; j++) {
			printf(" %d",damier[(i*NBCASE)+j]);
		}

	}
 return TCL_OK;
}



///////////////////////////////////////////////////////

int PremierLibre(tHauteur *Htr,int x)
// Retourne l'indice du 1er elt libre ds la colonne x
{
	int ht;
	ht=(*Htr)[x]; // ht = (nb d'elements ds la colonne)
	if (ht<0)
	{		// colonne vide
		(*Htr)[x]=0;
		return 0;
	} // pas besoin de else

	if (ht>7) return -1; // la colonne est pleine

	return ht;
}


void ExamineDamier(tDamier tabl,int jr,int x,int y,int * tabp4)
// Recherche les extrémitées d'un alignement de 4 pions identiques
{
	const int Nbdir=7;
	const int NbLigne=4;
	int tabdir[Nbdir],tabLigne[NbLigne],direction,nbp4,ind,/*tabp4[17],*/temp;
//printf("\n ExamineDamier damier[x=%d,y=%d]=%d  \n",x,y,(tabl)[(NBCASE*x) + y]);

	for(direction=0,nbp4=0,ind=1;direction<Nbdir;direction++)
	{
		tabdir[direction]=comptedir(tabl,jr,x,y,direction);
		switch(direction)
		{
		case 0: tabLigne[0]=tabdir[0];
				if (tabLigne[0]>3) {
					// s'il y a puissance 4 on sauvegarde les coordonnées
					tabp4[ind]=x;
					tabp4[ind+1]=y - 3;
					tabp4[ind+2]=x;
					tabp4[ind+3]=y;
printf("\n puissance 4 (x1,y1)=(%d , %d ) -- (x2,y2)=(%d , %d ) \n",tabp4[ind],tabp4[ind+1],tabp4[ind+2],tabp4[ind+3]);
					nbp4++;
					ind=4*nbp4 + 1;
				}
				break;
		case 2: tabLigne[1]=tabdir[1] + tabdir[2] -1;
				if (tabLigne[1]>3) {
					// s'il y a puissance 4 on sauvegarde les coordonnées
					temp=(tabdir[1]-1) % 4;
					tabp4[ind]=x - temp ;
					tabp4[ind+1]=y;
					temp= 3 - temp;
					tabp4[ind+2]=x + temp;
					tabp4[ind+3]=y;
printf("\n puissance 4 (x1,y1)=(%d , %d ) -- (x2,y2)=(%d , %d ) \n",tabp4[ind],tabp4[ind+1],tabp4[ind+2],tabp4[ind+3]);
					nbp4++;
					ind=4*nbp4+1;
				}
				break;
		case 4: tabLigne[2]=tabdir[3] + tabdir[4] -1;
			if (tabLigne[2]>3) {
					// s'il y a puissance 4 on sauvegarde les coordonnées
					temp=(tabdir[3]-1) % 4;
					tabp4[ind]=x - temp ;
					tabp4[ind+1]=y - temp;
					temp= 3 - temp;
					tabp4[ind+2]=x + temp ;
					tabp4[ind+3]=y + temp;
printf("\n puissance 4 (x1,y1)=(%d , %d ) -- (x2,y2)=(%d , %d ) \n",tabp4[ind],tabp4[ind+1],tabp4[ind+2],tabp4[ind+3]);
					nbp4++;
					ind=4*nbp4+1;
				}
				break;
		case 6: tabLigne[3]=tabdir[5] + tabdir[6] -1;
			if (tabLigne[3]>3) {
					// s'il y a puissance 4 on sauvegarde les coordonnées
					temp=(tabdir[5]-1) % 4;
					tabp4[ind]=x + temp ;
					tabp4[ind+1]=y - temp;
					temp= 3 - temp;
					tabp4[ind+2]=x - temp;
					tabp4[ind+3]=y + temp;
printf("\n puissance 4 (x1,y1)=(%d , %d ) -- (x2,y2)=(%d , %d ) \n",tabp4[ind],tabp4[ind+1],tabp4[ind+2],tabp4[ind+3]);
					nbp4++;
					ind=4*nbp4+1;
				}
				break;
		}

	}
	tabp4[0]=nbp4;

}

void CalculScore(tDamier tabl,int jr,int x,int y,int *tabres)
// Le score calculé permet de savoir s'il est intérressant de jouer cette case
{
	const int Nbdir=7;
	const int NbLigne=4;
	int tabdir[Nbdir],direction,ind, temp,score,nbp4;

//printf("\n\n calculScore x=%d,y=%d  \n",x,y);

	for(direction=0,nbp4=0,ind=1;direction<Nbdir;direction++)
	{
		tabdir[direction]=comptedir(tabl,jr,x,y,direction);
//printf("  dir:%d tabdir:%d  ",direction,tabdir[direction]);
		switch(direction)
		{
		case 0: score=2 * (tabdir[0] -1);
				if (tabdir[0]>3) 	nbp4++;
				break;

		case 2: temp=tabdir[1] + tabdir[2];
				score =score +  (2 * temp)-1;
				if (temp>3)
					nbp4++;
				break;
		case 4: temp=tabdir[3] + tabdir[4] -1;
				score =score +  (3 * temp);
				if (temp>3)
					nbp4++;
				break;
		case 6: temp=tabdir[5] + tabdir[6]-1;
				score =score +  (3 * temp);
				if (temp>3)
					nbp4++;
				break;
		}

	}
	tabres[0]=nbp4;
	tabres[1]=score;
}

int comptedir(tDamier tabl,int jr,int x,int y,int dir)
// Compte le nb de pion du joueur jr, a partir de la case x,y dans la direction dir
{
	int i,j,nb=0;
	bool fin=false;
	i=x;
	j=y;

	while ((!fin) && (i>-1) && (i<8) && (j>-1) && (j<8) )
	{
		if ( (nb>0) && (tabl)[(i*NBCASE)+j] != jr ) fin=true;
		else {
			nb++;

			switch(dir) {
			case 0:j--; break; //haut -> bas
			case 1:i--; break; //->gauche
			case 2:i++; break; //->droite
			case 3:i--; j--; break; //->bas guauche
			case 4:i++; j++; break; //->haut droite
			case 5:i++; j--; break; //->bas droite
			case 6:i--; j++; break; //->haut gauche
			default:fin=true;
			}
		}
	}

	if ((nb%4)!=0) nb=nb%4; // cela evite de compter plusieurs fois le même alignement de 4
	return nb;
}

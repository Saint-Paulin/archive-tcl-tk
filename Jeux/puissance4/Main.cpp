#include "main.h"



// variables globales:
Launcher theLauncher;


/****************************************************************
 *			MAIN												*
 ****************************************************************/

int main()
{
	// little trick for the tcl library:
	char **arg2, *arg1, arg='1';
	arg1 = &arg;
	arg2 = &arg1;
		
	// Choosing:
	//Tcl_Main(1,arg2,Launch_Choose);
	Tcl_Main(1,arg2,Launch_Interface);
	Tk_MainLoop();

    return TCL_OK;
}


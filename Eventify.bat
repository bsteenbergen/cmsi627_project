;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  File name  : Eventify.bat
;;;  Purpose    : This CLIPS source file runs a program to determine a location for the user
;;;               based on their answers to specific questions about their needs.
;;;  Project    : CMSI 627
;;;  Date       : 16-Apr-2024
;;;  Author     : Brittany, Christine, Alejandro, Subhraneel
;;;  Description: Batch file to run the Eventify.clp program
;;;
;;;  Operation  : This source file is intended to be run from the batch file with the
;;;                corresponding name.  To do this, in the CLIPS environment, use the command:
;;;
;;;                   (batch Eventify.bat)
;;;
;;;                OR start clips using the file load option command:
;;;
;;;                   %> clipsdos -f Eventify.bat
;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Revision History:
;;;  -----------------
;;;
;;;   Ver      Date      Modified by:  Description
;;;  -----  -----------  ------------  ---------------------------------
;;;  1.0.0  16-Apr-2024  Dr. Johnson   Initial release
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(clear)
(load Eventify.clp)
(reset)
(run)

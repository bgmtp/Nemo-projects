REPORT YFTP1 .

*  FTP by abap.
*  This program passses host, user, source/target
*  directory and file parameters to a UNIX script which
*  in turn gets the required file from the host by ftp.
*  The unix script should look like this:
*
*  #! /bin/sh
*  ftp -n $1 << !!
*  user $2 $3
*  cd ..                      <-- only for mainframe ftp
*  get $4 $5
*  quit
*  !!
*
*  placed in the adm path, preferably under
*  /sapmnt//exe. In order to make this program
*  work please create sapcpic/manager cpic user and
*  apply note no. 41770.
*  

PARAMETERS: HOST(10) OBLIGATORY LOWER CASE,
USER(8) OBLIGATORY LOWER CASE,
PASSWORD(8) OBLIGATORY LOWER CASE,
SRC_FILE(45) OBLIGATORY LOWER CASE,
TRG_FILE(45) DEFAULT '/usr/sap/trans/data/??????' OBLIGATORY LOWER CASE,
BIN AS CHECKBOX.
DATA: JC(8), FLG(1), B(128), PRNAME(128), LOGFILE(30), AAA(40).

DATA: BEGIN OF A,
1(12), 2(10), 3(10), 4(47), 5(47),
END OF A.

IF HOST = 'zxaq'.
  IF BIN = 'X'.
    PRNAME = 'ftp_bin_vms'.
  ELSE.
    PRNAME = 'ftp_asc_vms'.
  ENDIF.
ELSE.
  IF BIN = 'X'.
    PRNAME = '/usr/sap/trans/bin/ftp_bin_unix'.
  ELSE.
    PRNAME = '/usr/sap/trans/bin/ftp_asc_unix'.
  ENDIF.
ENDIF.

A-1 = HOST.
A-2 = USER.
A-3 = PASSWORD.
A-4 = SRC_FILE.
A-5 = TRG_FILE.
CONDENSE A.
B = A.

CALL FUNCTION 'JOB_OPEN'
     EXPORTING
          JOBNAME  = 'FTP'
     IMPORTING
          JOBCOUNT = JC.

CALL FUNCTION 'JOB_SUBMIT'
     EXPORTING
          AUTHCKNAM     = SY-UNAME
          EXTPGM_NAME   = PRNAME
          EXTPGM_PARAM  = B
          EXTPGM_SYSTEM = 'jupiter'
          JOBCOUNT      = JC
          JOBNAME       = 'FTP'.

CALL FUNCTION 'JOB_CLOSE'
     EXPORTING
          JOBCOUNT         = JC
          JOBNAME          = 'FTP'
          STRTIMMED        = 'X'
          TARGETSYSTEM     = 'jupiter'
     IMPORTING
          JOB_WAS_RELEASED = FLG.

LOGFILE = '/tmp/ftp.log'.
DO.
  OPEN DATASET LOGFILE FOR INPUT IN TEXT MODE.
  IF SY-SUBRC = 0. EXIT. ENDIF.
ENDDO.

DO.
  READ DATASET LOGFILE INTO AAA.
  IF SY-SUBRC = 0. WRITE / AAA. ENDIF.
  IF AAA = 'FTP completed'. EXIT. ENDIF.
ENDDO.

CLOSE DATASET LOGFILE.
delete dataset logfile.

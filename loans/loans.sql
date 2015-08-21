select 
	lnr."LASTNAME" ||'  '||lnr."FIRSTNAME" ||'  '|| lnr."MIDDLENAME" AS  FIO
from 
	"TLOANER" lnr 
inner join 
	"TLOANINFO" li on lnr."ID_LOANER" = li."ID_LOANER"
inner join 
	"TLOAN" l on li."ID_LOAN" = l."ID_LOAN"
inner join
	"TUSERLOANS" ul on l."ID_LOAN" = ul."ID_LOAN"
inner join 
	"TUSERS" u on ul."ID_USER" = u."ID_USER"
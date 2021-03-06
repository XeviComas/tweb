//	{% LoadHrb( 'lib/tweb/tweb.hrb' ) %}

#define PATH_DATA 		HB_GetEnv( "PRGPATH" ) + '/data/'

#include {% TWebInclude() %}

function main()

    local o, oCol, oBrw, cAlias
	local hRow 	:= {=>}
	local aRows := {}
	
	USE ( PATH_DATA + 'utf8.dbf' ) SHARED NEW VIA 'DBFCDX'
	
	cAlias := Alias()
	
	while (cAlias)->( !Eof() )
	
		Aadd( aRows,  { 'english' 	=> (cAlias)->english 	,;
						'hindi' 	=> (cAlias)->hindi 		,;
						'telugu' 	=> (cAlias)->telugu 	})
		
		(cAlias)->( dbskip() )
	end	

	DEFINE WEB oWeb TITLE 'Test Browse UTF8' ICON 'images/favicon.ico'
		oWeb:lTables := .T.		
	INIT WEB oWeb
	
	DEFINE FORM o ID 'demo'

		HTML o INLINE '<h3>Test Browse</h3><hr>'
		
	INIT FORM o  			

		DEFINE BROWSE oBrw ID 'ringo' HEIGHT 400 OF o

			ADD oCol TO oBrw ID 'english' 	HEADER 'English' 
			ADD oCol TO oBrw ID 'hindi'		HEADER 'Hindi'  
			ADD oCol TO oBrw ID 'telugu'	HEADER 'Telugu' 			

		INIT BROWSE oBrw DATA aRows		
	
	END FORM o	
	
retu nil
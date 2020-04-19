//----------------------------------------------------------------------------//
// {% LoadHrb( 'lib/tweb.hrb' ) %}	//	Load TWeb library...
//----------------------------------------------------------------------------//

CLASS TWebController

	METHOD New( oController )			CONSTRUCTOR

ENDCLASS   

//----------------------------------------------------------------------------//

METHOD New( oController ) CLASS TWebController

    local cAction := lower( oController:oRequest:Post( 'action' ) )	

    do case

        case cAction == "tutor"   	    ; 	oController:View( 'tutor.view' )
        case cAction == "tutor1"   	    ; 	oController:View( 'tutor1.view' )

	endcase

RETU Self    


CLASS rootController

    METHOD New( oController )

ENDCLASS    

//----------------------------------------------------------------------------//

METHOD New( oController ) CLASS rootController

	oController:View( "root.view" )

return Self    

//----------------------------------------------------------------------------//

sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'customerloyalpa128233u28/customers/test/integration/FirstJourney',
		'customerloyalpa128233u28/customers/test/integration/pages/CustomersList',
		'customerloyalpa128233u28/customers/test/integration/pages/CustomersObjectPage'
    ],
    function(JourneyRunner, opaJourney, CustomersList, CustomersObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('customerloyalpa128233u28/customers') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCustomersList: CustomersList,
					onTheCustomersObjectPage: CustomersObjectPage
                }
            },
            opaJourney.run
        );
    }
);
sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'customerloyalpa128233u28/purchases/test/integration/FirstJourney',
		'customerloyalpa128233u28/purchases/test/integration/pages/PurchasesList',
		'customerloyalpa128233u28/purchases/test/integration/pages/PurchasesObjectPage'
    ],
    function(JourneyRunner, opaJourney, PurchasesList, PurchasesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('customerloyalpa128233u28/purchases') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePurchasesList: PurchasesList,
					onThePurchasesObjectPage: PurchasesObjectPage
                }
            },
            opaJourney.run
        );
    }
);
sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'customerloyalpa128233u28/redemptions/test/integration/FirstJourney',
		'customerloyalpa128233u28/redemptions/test/integration/pages/RedemptionsList',
		'customerloyalpa128233u28/redemptions/test/integration/pages/RedemptionsObjectPage'
    ],
    function(JourneyRunner, opaJourney, RedemptionsList, RedemptionsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('customerloyalpa128233u28/redemptions') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheRedemptionsList: RedemptionsList,
					onTheRedemptionsObjectPage: RedemptionsObjectPage
                }
            },
            opaJourney.run
        );
    }
);
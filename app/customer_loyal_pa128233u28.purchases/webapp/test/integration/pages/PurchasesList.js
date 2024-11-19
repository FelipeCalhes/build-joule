sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'customerloyalpa128233u28.purchases',
            componentId: 'PurchasesList',
            contextPath: '/Purchases'
        },
        CustomPageDefinitions
    );
});
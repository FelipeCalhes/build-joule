using { customer_loyal_pa128233u28Srv } from '../srv/service.cds';

annotate customer_loyal_pa128233u28Srv.Customers with @UI.HeaderInfo: { TypeName: 'Customer', TypeNamePlural: 'Customers', Title: { Value: name } };
annotate customer_loyal_pa128233u28Srv.Customers with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate customer_loyal_pa128233u28Srv.Customers with @UI.Identification: [{ Value: name }];
annotate customer_loyal_pa128233u28Srv.Customers with @UI.DataPoint #customerNumber: {
  Value: customerNumber,
  Title: 'Customer Number',
};
annotate customer_loyal_pa128233u28Srv.Customers with {
  name @title: 'Name';
  email @title: 'Email';
  customerNumber @title: 'Customer Number';
  totalPurchaseValue @title: 'Total Purchase Value';
  totalRewardPoints @title: 'Total Reward Points';
  totalRedeemedRewardPoints @title: 'Total Redeemed Reward Points'
};

annotate customer_loyal_pa128233u28Srv.Customers with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: email },
    { $Type: 'UI.DataField', Value: customerNumber },
    { $Type: 'UI.DataField', Value: totalPurchaseValue },
    { $Type: 'UI.DataField', Value: totalRewardPoints },
    { $Type: 'UI.DataField', Value: totalRedeemedRewardPoints }
];

annotate customer_loyal_pa128233u28Srv.Customers with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: email },
    { $Type: 'UI.DataField', Value: customerNumber },
    { $Type: 'UI.DataField', Value: totalPurchaseValue },
    { $Type: 'UI.DataField', Value: totalRewardPoints },
    { $Type: 'UI.DataField', Value: totalRedeemedRewardPoints }
  ]
};

annotate customer_loyal_pa128233u28Srv.Customers with {
  purchases @Common.Label: 'Purchases';
  redemptions @Common.Label: 'Redemptions'
};

annotate customer_loyal_pa128233u28Srv.Customers with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#customerNumber' }
];

annotate customer_loyal_pa128233u28Srv.Customers with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate customer_loyal_pa128233u28Srv.Customers with @UI.SelectionFields: [
  name
];

annotate customer_loyal_pa128233u28Srv.Purchases with @UI.HeaderInfo: { TypeName: 'Purchase', TypeNamePlural: 'Purchases' };
annotate customer_loyal_pa128233u28Srv.Purchases with {
  customer @Common.ValueList: {
    CollectionPath: 'Customers',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: customer_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'email'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'customerNumber'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalPurchaseValue'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalRewardPoints'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalRedeemedRewardPoints'
      },
    ],
  }
};
annotate customer_loyal_pa128233u28Srv.Purchases with {
  purchaseValue @title: 'Purchase Value';
  rewardPoints @title: 'Reward Points';
  selectedProduct @title: 'Selected Product'
};

annotate customer_loyal_pa128233u28Srv.Purchases with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: purchaseValue },
    { $Type: 'UI.DataField', Value: rewardPoints },
    { $Type: 'UI.DataField', Value: selectedProduct },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID }
];

annotate customer_loyal_pa128233u28Srv.Purchases with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: purchaseValue },
    { $Type: 'UI.DataField', Value: rewardPoints },
    { $Type: 'UI.DataField', Value: selectedProduct },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID }
  ]
};

annotate customer_loyal_pa128233u28Srv.Purchases with {
  customer @Common.Text: { $value: customer.name, ![@UI.TextArrangement]: #TextOnly }
};

annotate customer_loyal_pa128233u28Srv.Purchases with {
  customer @Common.Label: 'Customer'
};

annotate customer_loyal_pa128233u28Srv.Purchases with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate customer_loyal_pa128233u28Srv.Purchases with @UI.SelectionFields: [
  customer_ID
];

annotate customer_loyal_pa128233u28Srv.Redemptions with @UI.HeaderInfo: { TypeName: 'Redemption', TypeNamePlural: 'Redemptions' };
annotate customer_loyal_pa128233u28Srv.Redemptions with {
  customer @Common.ValueList: {
    CollectionPath: 'Customers',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: customer_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'email'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'customerNumber'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalPurchaseValue'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalRewardPoints'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalRedeemedRewardPoints'
      },
    ],
  }
};
annotate customer_loyal_pa128233u28Srv.Redemptions with {
  redeemedAmount @title: 'Redeemed Amount'
};

annotate customer_loyal_pa128233u28Srv.Redemptions with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: redeemedAmount },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID }
];

annotate customer_loyal_pa128233u28Srv.Redemptions with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: redeemedAmount },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID }
  ]
};

annotate customer_loyal_pa128233u28Srv.Redemptions with {
  customer @Common.Text: { $value: customer.name, ![@UI.TextArrangement]: #TextOnly }
};

annotate customer_loyal_pa128233u28Srv.Redemptions with {
  customer @Common.Label: 'Customer'
};

annotate customer_loyal_pa128233u28Srv.Redemptions with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate customer_loyal_pa128233u28Srv.Redemptions with @UI.SelectionFields: [
  customer_ID
];


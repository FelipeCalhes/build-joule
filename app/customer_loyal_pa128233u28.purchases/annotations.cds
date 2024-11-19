using customer_loyal_pa128233u28Srv as service from '../../srv/service';
using from '../annotations';

annotate service.Purchases with @(
    UI.FieldGroup #Main : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : purchaseValue,
            },
            {
                $Type : 'UI.DataField',
                Value : selectedProduct,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Customer',
                Value : customer_ID,
            },
        ],
    }
);

annotate service.Purchases with {
    selectedProduct @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'A_ProductBasicText',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : selectedProduct,
                    ValueListProperty : 'Product',
                },
            ],
            Label : 'Product',
        PresentationVariantQualifier : 'vh_Purchases_selectedProduct',
        },
        Common.ValueListWithFixedValues : true
)};

annotate service.A_ProductBasicText with @(
    UI.PresentationVariant #vh_Purchases_selectedProduct : {
        $Type : 'UI.PresentationVariantType',
        SortOrder : [
            {
                $Type : 'Common.SortOrderType',
                Property : Product,
                Descending : false,
            },
        ],
    }
);

annotate service.Purchases with {
    customer @(
        Common.ValueListWithFixedValues : false,
        Common.Text : customer.name,
        Common.ValueList : {
            CollectionPath : 'Customers',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : customer_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'email',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'customerNumber',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'totalPurchaseValue',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'totalRewardPoints',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'totalRedeemedRewardPoints',
                },
            ],
            Label : 'Customer',
        },
    )
};

annotate service.A_ProductBasicText with {
    Product @Common.Text : LongText
};


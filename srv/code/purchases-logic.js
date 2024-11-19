/**
 * 
 * @On(event = { "CREATE" }, entity = "customer_loyal_pa128233u28Srv.Purchases")
 * @param {Object} request - User information, tenant-specific CDS model, headers and query parameters
*/
module.exports = async function(request) {
    const { Purchases, Customers } = cds.entities;

    // Get the purchase data from the request
    const purchaseData = request.data;

    // Calculate reward points
    const rewardPoints = Math.floor(purchaseData.purchaseValue / 10);

    // Update the purchase data with reward points
    purchaseData.rewardPoints = rewardPoints;

    // Insert the purchase data into the Purchases entity
    //await INSERT.into(Purchases).entries(purchaseData);

    // Get the customer ID from the purchase data
    const customerId = purchaseData.customer_ID;

    if (customerId) {
        // Fetch the customer data
        const customer = await SELECT.one.from(Customers).where({ ID: customerId });

        if (customer) {
            // Update the customer's total purchase value and total reward points
            const updatedCustomer = {
                totalPurchaseValue: customer.totalPurchaseValue + purchaseData.purchaseValue,
                totalRewardPoints: customer.totalRewardPoints + rewardPoints
            };

            // Update the customer entity
            await UPDATE(Customers).set(updatedCustomer).where({ ID: customerId });
        }
    }
}
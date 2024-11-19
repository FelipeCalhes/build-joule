/**
 * 
 * @On(event = { "CREATE" }, entity = "customer_loyal_pa128233u28Srv.Redemptions")
 * @param {Object} request - User information, tenant-specific CDS model, headers and query parameters
*/
module.exports = async function(request) {
  const { Redemptions, Customers } = cds.entities;
  const { customer, redeemedAmount } = request.data;

  if (!customer || !redeemedAmount) {
    return; // If customer or redeemedAmount is not provided, exit the function
  }

  // Fetch the related customer
  const customerData = await SELECT.one.from(Customers).where({ ID: customer });

  if (!customerData) {
    return; // If customer does not exist, exit the function
  }

  // Calculate the new values for totalRewardPoints and totalRedeemedRewardPoints
  const newTotalRewardPoints = customerData.totalRewardPoints - redeemedAmount;
  const newTotalRedeemedRewardPoints = customerData.totalRedeemedRewardPoints + redeemedAmount;

  // Update the customer with the new values
  await UPDATE(Customers).set({
    totalRewardPoints: newTotalRewardPoints,
    totalRedeemedRewardPoints: newTotalRedeemedRewardPoints
  }).where({ ID: customer });
};
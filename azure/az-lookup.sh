#!/bin/bash

# PURPOSE
#
# Simplify exploring of azure rest apis

# DOCS
#
# Consumption
# https://docs.microsoft.com/en-us/azure/billing/billing-consumption-api-overview#price-sheet-api
# https://docs.microsoft.com/en-us/rest/api/consumption/pricesheet


########################################################################
# Support funcs
#

function showHelp() {
    echo ""
    echo "Simplify exploring of azure rest apis"
    echo "Available args are:"
    echo "- getSubscriptionCost"

}

function runQuery() {
    local api_url="$1" # INPUT 1

    # Get access token an run query
    local bearer_token="$(az account get-access-token --query 'accessToken' -o tsv)"
    curl -X GET -H "Authorization: Bearer $bearer_token" \
        -H "Content-Type: application/json" \
        "$api_url"
}

function getSubscriptionId() {
    az account show --query id -o tsv
}


########################################################################
# Lookup funcs
#
function getSubscriptionCost() {
    local subscriptionId="$(getSubscriptionId)"
    local url="https://management.azure.com/subscriptions/${subscriptionId}/providers/Microsoft.Consumption/pricesheets/default?api-version=2019-01-01"

    runQuery "$url"
}

########################################################################
# MAIN
#

case "$1" in
            
    "-h" | "--help" )           
        showHelp
        ;;
    
    "getSubscriptionCost" )
        getSubscriptionCost
        ;;
        
    *)
        showHelp
esac  


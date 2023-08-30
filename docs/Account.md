# YNAB::Account

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **name** | **String** |  |  |
| **type** | [**AccountType**](AccountType.md) |  |  |
| **on_budget** | **Boolean** | Whether this account is on budget or not |  |
| **closed** | **Boolean** | Whether this account is closed or not |  |
| **note** | **String** |  | [optional] |
| **balance** | **Integer** | The current balance of the account in milliunits format |  |
| **cleared_balance** | **Integer** | The current cleared balance of the account in milliunits format |  |
| **uncleared_balance** | **Integer** | The current uncleared balance of the account in milliunits format |  |
| **transfer_payee_id** | **String** | The payee id which should be used when transferring to this account |  |
| **direct_import_linked** | **Boolean** | Whether or not the account is linked to a financial institution for automatic transaction import. | [optional] |
| **direct_import_in_error** | **Boolean** | If an account linked to a financial institution (direct_import_linked&#x3D;true) and the linked connection is not in a healthy state, this will be true. | [optional] |
| **last_reconciled_at** | **Time** | A date/time specifying when the account was last reconciled. | [optional] |
| **debt_original_balance** | **Integer** | The original debt/loan account balance, specified in milliunits format. | [optional] |
| **debt_interest_rates** | **Hash&lt;String, Integer&gt;** |  | [optional] |
| **debt_minimum_payments** | **Hash&lt;String, Integer&gt;** |  | [optional] |
| **debt_escrow_amounts** | **Hash&lt;String, Integer&gt;** |  | [optional] |
| **deleted** | **Boolean** | Whether or not the account has been deleted.  Deleted accounts will only be included in delta requests. |  |


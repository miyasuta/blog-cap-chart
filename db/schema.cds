namespace demo.aggregate;
using { Currency, cuid } from '@sap/cds/common';

entity Expenses : cuid {
    category: String @title: 'Category';
    amount: Decimal(9,2) @title: 'Amount';
    currency: Currency @title: 'Currency';
    postingDate: DateTime @title: 'Posting Date'
}

@Aggregation.ApplySupported.PropertyRestrictions: true
view ExpensesAnalytics as select from Expenses {
  key ID,
  @Analytics.Dimension: true
  category,
  @Analytics.Measure: true
  @Aggregation.default: #SUM
  amount,
  @Analytics.Dimension: true
  currency
};
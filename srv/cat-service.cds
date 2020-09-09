using demo.aggregate as db from '../db/schema';

service CatalogService {
    entity Expenses as projection on db.Expenses
    view ExpensesAnalytics as select from db.ExpensesAnalytics
}

annotate CatalogService.ExpensesAnalytics with @(
    UI: {
        Chart: [{
                ChartType: 'Donut',
                Measures: ['amount'],
                Dimensions: ['category'],
                DimensionAttributes: [{
                    Dimension: 'category',
                    Role: 'Category'
                }],
                MeasureAttributes: [{
                    Measure: 'amount',
                    Role: 'Axis1'
                }]        
        }]
    }
);

annotate CatalogService.Expenses with @(
    UI: {
        SelectionFields: [postingDate, category],
        LineItem: [
            { Value: postingDate },
            { Value: category },
            { Value: amount },
            { Value: currency_code }
        ],   
    }
);
using demo.aggregate as db from '../db/schema';

service CatalogService {
    entity Expenses as projection on db.Expenses
    view ExpensesAnalytics as select from db.ExpensesAnalytics
}

annotate CatalogService.ExpensesAnalytics with @(
    UI: {
        Chart: {
            $Type: 'UI.ChartDefinitionType',
            ChartType: #Donut,
            Measures: ['amount'],
            MeasureAttributes: [{
                $Type: 'UI.ChartMeasureAttributeType',
                Measure: 'amount',
                Role: #Axis1
            }],             
            Dimensions: ['category'],
            DimensionAttributes: [{
                $Type: 'UI.ChartDimensionAttributeType',
                Dimension: 'category',
                Role: #Category
            }]       
        }
    }
);

annotate CatalogService.Expenses with @(
    UI: {
        Chart: {
            $Type: 'UI.ChartDefinitionType',
            ChartType: #Donut,
            Measures: ['amount'],
            MeasureAttributes: [{
                $Type: 'UI.ChartMeasureAttributeType',
                Measure: 'amount',
                Role: #Axis1
            }],             
            Dimensions: ['category'],
            DimensionAttributes: [{
                $Type: 'UI.ChartDimensionAttributeType',
                Dimension: 'category',
                Role: #Category
            }]       
        }
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
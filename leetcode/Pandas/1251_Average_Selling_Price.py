import pandas as pd

def average_selling_price(prices: pd.DataFrame, units_sold: pd.DataFrame) -> pd.DataFrame:
    merged_data = prices.merge(units_sold, on='product_id')
    filtered_data = merged_data[
        (merged_data['purchase_date'] >= merged_data['start_date']) &
        (merged_data['purchase_date'] <= merged_data['end_date'])
    ]
    filtered_data['revenue'] = filtered_data['price'] * filtered_data['units']
    result = filtered_data.groupby('product_id')['revenue'].sum() / filtered_data.groupby('product_id')['units'].sum()
    result = result.round(2).reset_index()
    result.columns = ['product_id', 'average_price']
    prices = pd.DataFrame(columns=['product_id'], data=prices['product_id'].unique())
    result = prices.merge(result[['product_id', 'average_price']], on='product_id', how='left').fillna(0)
    
    return result
